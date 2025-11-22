import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:watowear_chloe/app/modules/authentication/views/authentication_view.dart';
import 'package:watowear_chloe/app/modules/dashboard/views/dashboard_view.dart';
import 'package:watowear_chloe/app/modules/home/views/home_view.dart';

import '../../../data/services/api_services.dart';
import '../../profile/views/modify_email_view.dart';
import '../views/account_created_view.dart';
import '../views/check_your_email_view.dart';
import '../views/password_updated_view.dart';
import '../views/set_new_password_view.dart';

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

  final newPasswordCtrl = TextEditingController();
  final confirmNewPasswordCtrl = TextEditingController();
  final currentPasswordCtrl = TextEditingController();

  final newEmailCtrl = TextEditingController();
  final repeatNewEmailCtrl = TextEditingController();

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

  Future<void> login (
      String email,
      String password,
      ) async {
    isLoading.value = true;

    try {
      final http.Response response = await _service.login(email, password);

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

        final userId = responseBody['user']['id'].toString();
        final name = responseBody['user']['name'];
        final surname = responseBody['user']['surname'];

        await _storage.write(key: 'user_id', value: userId);
        await _storage.write(key: 'name', value: name);
        await _storage.write(key: 'surname', value: surname);

        Get.snackbar('Success', 'Logged In Successfully');

        Get.to(DashboardView());
      } else {
        final responseBody = jsonDecode(response.body);
        Get.snackbar('Login failed', responseBody['message'] ?? 'Please use Correct password');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occured');
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendOtpForgetPassword (String email) async {
    isLoading.value = true;

    try {
      final http.Response response = await _service.sendOtpForgetPassword(email);

      print(':::::::::RESPONSE:::::::::${response.body.toString()}');
      print(':::::::::CODE:::::::::${response.statusCode}');
      print(':::::::::REQUEST:::::::::${response.request}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);

        print(':::::::::responseBody:::::::::$responseBody');

        Get.snackbar('Success', 'Otp has been sent to your email');

        Get.back();
        Get.dialog(CheckYourEmailView(email: email));
      } else {
        final responseBody = jsonDecode(response.body);
        Get.snackbar('Otp send failed', responseBody['message'] ?? 'Please use Correct email');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occured');
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtpForgetPassword (String email, String otp) async {
    isLoading.value = true;

    try {
      final http.Response response = await _service.verifyOtpForgetPassword(email, otp);

      print(':::::::::RESPONSE:::::::::${response.body.toString()}');
      print(':::::::::CODE:::::::::${response.statusCode}');
      print(':::::::::REQUEST:::::::::${response.request}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);

        print(':::::::::responseBody:::::::::$responseBody');

        Get.snackbar('Success', 'Otp has been verified successfully');

        Get.back();
        Get.dialog(SetNewPasswordView(email: email, otp: otp,));
      } else {
        final responseBody = jsonDecode(response.body);
        Get.snackbar('Otp verification failed', responseBody['message'] ?? 'Please use correct otp');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occured');
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword (String email, String otp, String password) async {
    isLoading.value = true;

    try {
      final http.Response response = await _service.resetPassword(email, otp, password);

      print(':::::::::RESPONSE:::::::::${response.body.toString()}');
      print(':::::::::CODE:::::::::${response.statusCode}');
      print(':::::::::REQUEST:::::::::${response.request}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);

        print(':::::::::responseBody:::::::::$responseBody');

        Get.snackbar('Success', 'Password reset successfully');

        Get.back();
        Get.dialog(PasswordUpdatedView());
      } else {
        final responseBody = jsonDecode(response.body);
        Get.snackbar('Password reset failed', responseBody['message'] ?? 'Please use correct password');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occured');
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> changePassword (String currentPassword, String newPassword) async {
    isLoading.value = true;

    try {
      final http.Response response = await _service.changePassword(currentPassword, newPassword);

      print(':::::::::RESPONSE:::::::::${response.body.toString()}');
      print(':::::::::CODE:::::::::${response.statusCode}');
      print(':::::::::REQUEST:::::::::${response.request}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);

        print(':::::::::responseBody:::::::::$responseBody');

        Get.snackbar('Success', 'Password changed successfully');

        Get.dialog(PasswordUpdatedView());
      } else {
        final responseBody = jsonDecode(response.body);
        Get.snackbar('Password change failed', responseBody['message'] ?? 'Please use correct password');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occured');
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> modifyEmail(String currentPassword, String newEmail) async {
    isLoading.value = true;

    try {
      final http.Response response = await _service.modifyEmail(currentPassword, newEmail);

      print(':::::::::RESPONSE:::::::::${response.body.toString()}');
      print(':::::::::CODE:::::::::${response.statusCode}');
      print(':::::::::REQUEST:::::::::${response.request}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);

        print(':::::::::responseBody:::::::::$responseBody');

        Get.snackbar('Success', 'Otp sent to verify email');

        Get.dialog(MailVerificationView());
      } else {
        final responseBody = jsonDecode(response.body);
        Get.snackbar('Otp sent failed', responseBody['message'] ?? 'Please use correct email');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occured');
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtpModifyEmail(String otp) async {
    isLoading.value = true;

    try {
      final http.Response response = await _service.verifyOtpModifyEmail(otp);

      print(':::::::::RESPONSE:::::::::${response.body.toString()}');
      print(':::::::::CODE:::::::::${response.statusCode}');
      print(':::::::::REQUEST:::::::::${response.request}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);

        print(':::::::::responseBody:::::::::$responseBody');

        Get.snackbar('Success', 'Otp verified successfully');

        Get.back();
      } else {
        final responseBody = jsonDecode(response.body);
        Get.snackbar('Otp verification failed', responseBody['message'] ?? 'Please use correct otp');
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
    newPasswordCtrl.dispose();
    confirmNewPasswordCtrl.dispose();
    newEmailCtrl.dispose();
    repeatNewEmailCtrl.dispose();
    super.onClose();
  }
}
