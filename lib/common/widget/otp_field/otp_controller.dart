import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final int otpLength;
  late final List<TextEditingController> controllers;
  late final List<FocusNode> focusNodes;
  late final List<String> _lastValues;
  final otp = ''.obs;

  OtpController({this.otpLength = 4});

  @override
  void onInit() {
    controllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
    _lastValues = List.generate(otpLength, (_) => '');
    super.onInit();
  }

  @override
  void onClose() {
    for (final c in controllers) c.dispose();
    for (final f in focusNodes) f.dispose();
    super.onClose();
  }

  void _recomputeOtp() {
    otp.value = controllers.map((c) => c.text).join();
  }

  /// Handles typing, paste, and delete
  void handleChange(int index, String value) {
    final raw = value.replaceAll(RegExp(r'[^0-9]'), '');

    // 1️⃣ PASTE full OTP in first field
    if (index == 0 && raw.length > 1) {
      final take = raw.substring(0, raw.length.clamp(0, otpLength));
      for (int i = 0; i < otpLength; i++) {
        final ch = i < take.length ? take[i] : '';
        controllers[i].text = ch;
        _lastValues[i] = ch;
      }
      _recomputeOtp();
      if (take.length >= otpLength) {
        focusNodes.last.requestFocus();
      } else {
        focusNodes[take.length].requestFocus();
      }
      return;
    }

    // 2️⃣ Single digit typed → go next
    if (raw.length == 1) {
      controllers[index].text = raw;
      controllers[index].selection =
          TextSelection.collapsed(offset: controllers[index].text.length);

      if (index < otpLength - 1) {
        focusNodes[index + 1].requestFocus();
      }
      _lastValues[index] = raw;
      _recomputeOtp();
      return;
    }

    // 3️⃣ Deleted → now empty
    if (raw.isEmpty) {
      final wasOneToZero = _lastValues[index].isNotEmpty;
      _lastValues[index] = '';
      controllers[index].text = '';
      if (wasOneToZero && index > 0) {
        focusNodes[index - 1].requestFocus();
      }
      _recomputeOtp();
    }
  }

  /// For hardware keyboards or some Android IMEs that emit key events
  KeyEventResult handleBackspaceOnEmpty(int index, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    if (event.logicalKey == LogicalKeyboardKey.backspace) {
      if (controllers[index].text.isEmpty && index > 0) {
        focusNodes[index - 1].requestFocus();
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  void clearAll() {
    for (final c in controllers) c.clear();
    for (int i = 0; i < _lastValues.length; i++) {
      _lastValues[i] = '';
    }
    _recomputeOtp();
    focusNodes.first.requestFocus();
  }
}
