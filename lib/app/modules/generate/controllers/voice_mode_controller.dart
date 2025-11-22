import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:watowear_chloe/app/secrets/secrets.dart';

class VoiceModeController extends GetxController {
  // ====== ELEVENLABS CONFIG ======
  static const String _wsBaseUrl =
      'wss://api.elevenlabs.io/v1/convai/conversation';

  // from secrets.dart (you define these)
  final String _agentId = agentId;           // e.g. public agent id
  final String _apiKey = elevenLabsApiKey;   // for getting signed URL if private

  // ====== STORAGE ======
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // ====== AUDIO & WS ======
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();
  WebSocket? _socket;

  StreamSubscription<Uint8List>? _audioStreamSub;
  final List<int> _audioChunks = [];

  // ====== UI STATE ======
  RxBool isInCall = false.obs;
  RxBool isRecording = false.obs;
  RxInt callSeconds = 0.obs;

  Timer? _timer;

  @override
  void onClose() {
    _disposeAll();
    super.onClose();
  }

  // ============ PUBLIC API ============

  Future<void> startCall() async {
    if (isInCall.value) return;

    try {
      // Read user id from secure storage
      final userId = await _secureStorage.read(key: 'user_id');

      await _connectToAgent(userId: userId);
      await _startRecording();
      _startTimer();
      isInCall.value = true;
    } catch (e, st) {
      print('[VoiceMode] startCall error: $e');
      print(st);
      await _disposeAll();
    }
  }

  Future<void> endCall() async {
    await _stopRecording();
    await _stopPlaying();
    await _closeSocket();
    _stopTimer();
    isInCall.value = false;
  }

  // ============ WEBSOCKET ============

  Future<void> _connectToAgent({String? userId}) async {
    // For PUBLIC agents you can use agent_id directly:
    final url = '$_wsBaseUrl?agent_id=$_agentId';

    // For PRIVATE agents, you should build a signed URL on your backend
    // using _apiKey and then pass that signed URL here instead of `url`.

    print('[VoiceMode] Connecting to: $url');

    try {
      _socket = await WebSocket.connect(
        url,
        // No need to send API key header for public agents
        // For private: use a signed URL, not raw key in headers.
        // headers: { 'xi-api-key': _apiKey },
      );

      // ---- IMPORTANT: send conversation initiation event ----
      final initPayload = <String, dynamic>{
        'type': 'conversation_initiation_client_data',
      };

      // Attach user_id + dynamic_variables if available
      if (userId != null && userId.isNotEmpty) {
        initPayload['user_id'] = userId;
        initPayload['dynamic_variables'] = {
          'user_id': userId,
        };
      }

      _socket?.add(jsonEncode(initPayload));

      // ---- Listen to events from ElevenLabs ----
      _socket?.listen(
            (dynamic event) async {
          if (event is String) {
            final res = jsonDecode(event);
            print('[VoiceMode] ElevenLabs response: $res');

            final type = res['type'];

            // Handle PING -> send PONG (keeps connection alive)
            if (type == 'ping') {
              final eventId = res['ping_event']?['event_id'];
              final pingMs = res['ping_event']?['ping_ms'] as int?;
              if (eventId != null) {
                // Optional: respect pingMs delay if provided
                Future.delayed(
                  Duration(milliseconds: pingMs ?? 0),
                      () {
                    _socket?.add(jsonEncode({
                      'type': 'pong',
                      'event_id': eventId,
                    }));
                    print('[VoiceMode] Sent pong for event_id=$eventId');
                  },
                );
              }
              return; // nothing else to do for ping
            }

            // Collect audio bytes from audio events
            if (type == 'audio' && res['audio_event'] != null) {
              final audioB64 = res['audio_event']['audio_base_64'];
              if (audioB64 != null && audioB64 is String) {
                final pcmBytes = base64Decode(audioB64);
                _audioChunks.addAll(pcmBytes);
              }
            }

            if (type == 'agent_response') {
              print('[VoiceMode] agent_response event');

              if (_audioChunks.isNotEmpty) {
                final wavBytes =
                _pcmToWavWithSilence(Uint8List.fromList(_audioChunks));

                // Pause mic while agent speaks
                await _stopRecording();

                try {
                  // stop any previous playback before loading new audio
                  await _player.stop();
                  await _player.setAudioSource(BytesAudioSource(wavBytes));
                  await _player.play();
                } catch (e, st) {
                  print('[VoiceMode] Audio playback error: $e');
                  print(st);
                }

                _audioChunks.clear();

                // Resume mic when agent finishes
                await _startRecording();
              }
            }

            if (type == 'interruption') {
              print('[VoiceMode] interruption event');
              await _player.stop();
            }

            if (type == 'user_transcript') {
              print('[VoiceMode] user_transcript event');
              // You can read res['user_transcript_event']['user_transcript'] if needed
            }
          }
        },
        onDone: () {
          print(
              '[VoiceMode] WS done/closed. code=${_socket?.closeCode} reason=${_socket?.closeReason}');
          isInCall.value = false;
        },
        onError: (error) {
          print('[VoiceMode] WS error: $error');
          isInCall.value = false;
        },
      );
    } catch (e, st) {
      print('[VoiceMode] Failed to connect WS: $e');
      print(st);
      rethrow;
    }
  }

  Future<void> _closeSocket() async {
    try {
      await _socket?.close();
    } catch (_) {}
    _socket = null;
  }

  // ============ MIC STREAMING ============

  Future<void> _startRecording() async {
    final hasPerm = await _recorder.hasPermission();
    if (!hasPerm) {
      throw Exception('Microphone permission denied');
    }

    print('[VoiceMode] Starting mic stream...');
    final stream = await _recorder.startStream(
      const RecordConfig(
        encoder: AudioEncoder.pcm16bits,
        sampleRate: 16000,
        numChannels: 1,
      ),
    );

    _audioStreamSub = stream.listen(
          (Uint8List chunk) {
        // Encode chunk as base64 and send as user_audio_chunk
        final base64Chunk = base64Encode(chunk);
        _socket?.add(
          jsonEncode({
            'user_audio_chunk': base64Chunk,
          }),
        );
      },
      onDone: () {
        print('[VoiceMode] Mic stream done');
      },
      onError: (e) {
        print('[VoiceMode] Mic stream error: $e');
      },
    );

    isRecording.value = true;
  }

  Future<void> _stopRecording() async {
    print('[VoiceMode] Stopping mic stream...');
    try {
      await _audioStreamSub?.cancel();
    } catch (_) {}
    _audioStreamSub = null;

    try {
      if (await _recorder.isRecording()) {
        await _recorder.stop();
      }
    } catch (_) {}

    isRecording.value = false;
  }

  Future<void> _stopPlaying() async {
    try {
      await _player.stop();
    } catch (_) {}
  }

  // ============ TIMER ============

  void _startTimer() {
    _stopTimer();
    callSeconds.value = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      callSeconds.value++;
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  // ============ CLEANUP ============

  Future<void> _disposeAll() async {
    await _stopRecording();
    await _stopPlaying();
    await _closeSocket();
    _stopTimer();

    _recorder.dispose();
    _player.dispose();
  }

  // ============ PCM → WAV (with small silence pad) ============

  Uint8List _pcmToWavWithSilence(
      Uint8List pcmBytes, {
        int sampleRate = 16000,
        int channels = 1,
        int bitsPerSample = 16,
        double silenceMs = 100,
      }) {
    final byteRate = sampleRate * channels * (bitsPerSample ~/ 8);

    // Generate silence buffer
    final silenceSamples = (sampleRate * silenceMs / 1000).toInt();
    final silenceBytes = Uint8List(silenceSamples * (bitsPerSample ~/ 8));

    // Combine silence + actual audio
    final combined = Uint8List(silenceBytes.length + pcmBytes.length)
      ..setAll(0, silenceBytes)
      ..setAll(silenceBytes.length, pcmBytes);

    final totalAudioLen = combined.length;
    final totalDataLen = totalAudioLen + 36;

    final header = BytesBuilder();
    header.add(ascii.encode('RIFF'));
    header.add(_intToBytes(totalDataLen, 4));
    header.add(ascii.encode('WAVE'));
    header.add(ascii.encode('fmt '));
    header.add(_intToBytes(16, 4)); // PCM chunk size
    header.add(_intToBytes(1, 2)); // Audio format PCM
    header.add(_intToBytes(channels, 2));
    header.add(_intToBytes(sampleRate, 4));
    header.add(_intToBytes(byteRate, 4));
    header.add(_intToBytes((channels * bitsPerSample ~/ 8), 2));
    header.add(_intToBytes(bitsPerSample, 2));
    header.add(ascii.encode('data'));
    header.add(_intToBytes(totalAudioLen, 4));

    return Uint8List.fromList([...header.toBytes(), ...combined]);
  }

  Uint8List _intToBytes(int value, int byteCount) {
    final b = ByteData(byteCount);
    if (byteCount == 2) {
      b.setInt16(0, value, Endian.little);
    } else if (byteCount == 4) {
      b.setInt32(0, value, Endian.little);
    }
    return b.buffer.asUint8List();
  }
}

/// Helper to play WAV bytes from memory
class BytesAudioSource extends StreamAudioSource {
  final List<int> bytes;
  BytesAudioSource(this.bytes);

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    final s = start ?? 0;
    final e = end ?? bytes.length;
    final slice = bytes.sublist(s, e);

    return StreamAudioResponse(
      sourceLength: bytes.length,
      contentLength: slice.length,
      offset: s,
      stream: Stream.value(slice),
      contentType: 'audio/wav',
    );
  }
}
