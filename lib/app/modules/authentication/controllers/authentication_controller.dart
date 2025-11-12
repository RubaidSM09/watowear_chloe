import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:watowear_chloe/app/modules/authentication/views/authentication_view.dart';

import '../../../data/services/api_services.dart';
import '../views/account_created_view.dart';

class AuthenticationController extends GetxController {
  RxBool isSignIn = true.obs;
  RxBool obscureText = true.obs;
  RxBool newPassObscureText = true.obs;
  RxBool confirmNewPassObscureText = true.obs;

  RxBool isSelected1 = false.obs;
  RxBool isSelected2 = false.obs;
  RxBool isSelected3 = false.obs;

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final surnameCtrl = TextEditingController();

  final ApiService _service = ApiService();
  var isLoading = false.obs;
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> storeTokens(String accessToken, String refreshToken) async {
    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<void> signUp (
      String email,
      String password,
      String name,
      String surname,
  ) async {
    isLoading.value = true;

    try {
      final http.Response response = await _service.signUp(email, password, name, surname);

      print(':::::::::RESPONSE:::::::::${response.body.toString()}');
      print(':::::::::CODE:::::::::${response.statusCode}');
      print(':::::::::REQUEST:::::::::${response.request}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);

        print(':::::::::responseBody:::::::::$responseBody');

        Get.snackbar('Success', 'Account created Successfully');

        Get.dialog(OtpVerificationView(email: email));
      } else {
        final responseBody = jsonDecode(response.body);
        Get.snackbar('Sign up failed', responseBody['message'] ?? 'Please use Correct password');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occured');
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> otpVerification (String email, String otp) async {
    isLoading.value = true;

    try {
      final http.Response response = await _service.verifyOtp(email, otp);

      print(':::::::::RESPONSE:::::::::${response.body.toString()}');
      print(':::::::::CODE:::::::::${response.statusCode}');
      print(':::::::::REQUEST:::::::::${response.request}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        final accessToken = responseBody['access'];
        final refreshToken = responseBody['refresh'];

        await storeTokens(accessToken, refreshToken);

        print(':::::::::responseBody:::::::::$responseBody');
        print(':::::::::accessToken:::::::::$accessToken');
        print(':::::::::refreshToken:::::::::$refreshToken');

        Get.snackbar('Success', 'Account created Successfully');

        Get.dialog(AccountCreatedView());
      } else {
        final responseBody = jsonDecode(response.body);
        Get.snackbar('Sign up failed', responseBody['message'] ?? 'Please use Correct password');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occured');
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    nameCtrl.dispose();
    surnameCtrl.dispose();
    super.onClose();
  }
}
