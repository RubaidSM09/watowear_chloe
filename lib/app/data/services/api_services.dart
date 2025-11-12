import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  final String baseUrl = "http://10.10.13.75:7887";

  Future<http.Response> signUp(
    String email,
    String password,
    String name,
    String surname,
  ) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/auth/signup/');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final Map<String, String> body = {
      "email": email,
      "password": password,
      "name": name,
      "surname": surname,
    };

    return await http.post(url, headers: headers, body: jsonEncode(body));
  }

  Future<http.Response> verifyOtp(String email, String otp) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/auth/verify-otp/');

    final Map<String, String> headers = {"Content-Type": "application/json"};

    final Map<String, String> body = {
      "email": email,
      "otp": otp,
    };

    return await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
  }

  Future<http.Response> profileSetup(
    String gender,
    int age,
    double heightCm,
    double weightKg,
    bool enableLocationForClimate,
    double latitude,
    double longitude,
    String bodyType,
    String skinTone,
    String eyeColor,
    String comfortZone,
    List<String> favoriteColors,
    List<String> avoidedColors,
    List<String> muses,
  ) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/profile/');

    String? accessToken = await _storage.read(key: 'access_token');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    final Map<String, dynamic> body = {
      "gender": gender,
      "age": age,
      "height_cm": heightCm,
      "weight_kg": weightKg,
      "enable_location_for_climate": enableLocationForClimate,
      "latitude": latitude,
      "longitude": longitude,
      "body_type": bodyType,
      "skin_tone": skinTone,
      "eye_color": eyeColor,
      "comfort_zone": comfortZone,
      "favorite_colors": favoriteColors,
      "avoided_colors": avoidedColors,
      "muses": muses,
    };

    return await http.patch(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
  }
}
