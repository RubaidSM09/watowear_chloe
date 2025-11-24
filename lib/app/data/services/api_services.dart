import 'dart:convert';
import 'dart:io';

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

  Future<http.Response> login(
      String email,
      String password,
      ) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/auth/login/');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final Map<String, String> body = {
      "email": email,
      "password": password,
    };

    return await http.post(url, headers: headers, body: jsonEncode(body));
  }

  Future<http.Response> sendOtpForgetPassword(String email) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/password/forgot/');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final Map<String, String> body = {
      "email": email,
    };

    return await http.post(url, headers: headers, body: jsonEncode(body));
  }

  Future<http.Response> verifyOtpForgetPassword(String email, String otp) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/password/verify-otp/');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final Map<String, String> body = {
      "email": email,
      "otp": otp
    };

    return await http.post(url, headers: headers, body: jsonEncode(body));
  }

  Future<http.Response> resetPassword(String email, String otp, String password) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/password/reset/');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final Map<String, String> body = {
      "email": email,
      "otp": otp,
      "password": password
    };

    return await http.post(url, headers: headers, body: jsonEncode(body));
  }

  Future<http.Response> changePassword(String currentPassword, String newPassword) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/profile/change-password/');

    String? accessToken = await _storage.read(key: 'access_token');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    final Map<String, String> body = {
      "current_password": currentPassword,
      "new_password": newPassword
    };

    return await http.post(url, headers: headers, body: jsonEncode(body));
  }

  Future<http.Response> modifyEmail(String currentPassword, String newEmail) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/profile/modify-email/');

    String? accessToken = await _storage.read(key: 'access_token');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    final Map<String, String> body = {
      "current_password": currentPassword,
      "new_email": newEmail
    };

    return await http.post(url, headers: headers, body: jsonEncode(body));
  }

  Future<http.Response> verifyOtpModifyEmail(String otp) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/profile/verify-new-email/');

    String? accessToken = await _storage.read(key: 'access_token');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    final Map<String, String> body = {
      "otp": otp
    };

    return await http.post(url, headers: headers, body: jsonEncode(body));
  }



  Future<http.Response> getProfile() async {
    final Uri url = Uri.parse('$baseUrl/api/v1/profile/');

    String? accessToken = await _storage.read(key: 'access_token');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    return await http.get(url, headers: headers,);
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

  Future<http.Response> myProgress() async {
    final Uri url = Uri.parse('$baseUrl/api/v1/gamification/progress/');

    String? accessToken = await _storage.read(key: 'access_token');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    return await http.get(url, headers: headers,);
  }

  Future<http.Response> getAllItems() async {
    final Uri url = Uri.parse('$baseUrl/api/v1/closet/items/');

    String? accessToken = await _storage.read(key: 'access_token');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    return await http.get(url, headers: headers,);
  }

  Future<http.Response> addClosetItem(File imageFile) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/closet/items/add/');

    String? accessToken = await _storage.read(key: 'access_token');

    final request = http.MultipartRequest('POST', url);

    // Only auth header; MultipartRequest will set proper Content-Type
    request.headers['Authorization'] = 'Bearer $accessToken';

    request.files.add(
      await http.MultipartFile.fromPath(
        'images', // 👈 field name from Postman screenshot
        imageFile.path,
        contentType: MediaType('image', 'jpeg'), // or detect by extension if you want
      ),
    );

    final streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }

  Future<http.Response> getFavoriteItems() async {
    final Uri url = Uri.parse('$baseUrl/api/v1/closet/items/?filter=favorites');

    String? accessToken = await _storage.read(key: 'access_token');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    return await http.get(url, headers: headers);
  }

  Future<http.Response> toggleFavorite(int itemId) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/closet/items/$itemId/favorite/');

    String? accessToken = await _storage.read(key: 'access_token');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    // body is not needed, the endpoint toggles is_favorite
    return await http.post(url, headers: headers);
  }

  Future<http.Response> getRecentItems() async {
    final Uri url =
    Uri.parse('$baseUrl/api/v1/closet/items/?filter=recent');

    String? accessToken = await _storage.read(key: 'access_token');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    return await http.get(url, headers: headers);
  }

  Future<http.Response> recordItemView(int itemId) async {
    final Uri url =
    Uri.parse('$baseUrl/api/v1/closet/items/$itemId/view/');

    String? accessToken = await _storage.read(key: 'access_token');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    // body is not needed – backend just records the view
    return await http.post(url, headers: headers);
  }



  Future<http.Response> createSupportMessage(
      String? subject,
      String? message,
      File? photo,
      ) async {
    final Uri url = Uri.parse('$baseUrl/api/v1/support/tickets/add/');

    String? accessToken = await _storage.read(key: 'access_token');

    final request = http.MultipartRequest('POST', url);

    if (accessToken != null) {
      request.headers['Authorization'] = 'Bearer $accessToken';
    }

    // subject (required by backend, but we allow null and default it)
    final String finalSubject =
    (subject == null || subject.trim().isEmpty)
        ? 'Support request'
        : subject.trim();
    request.fields['subject'] = finalSubject;

    // message
    request.fields['message'] = message?.trim() ?? '';

    // optional photo
    if (photo != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'photo',
          photo.path,
          contentType: MediaType('image', 'png'),
        ),
      );
    }

    final streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }
}
