import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

// adjust the paths according to your project structure
import 'package:watowear_chloe/app/data/model/profile.dart';
import 'package:watowear_chloe/app/data/services/api_services.dart';

class ProfileController extends GetxController {
  // ✅ NEW: API & state
  final ApiService _apiService = ApiService();

  RxBool isProfileLoading = false.obs;
  Rx<Profile?> profile = Rx<Profile?>(null);

  RxString userFullName = ''.obs;

  RxList<RxBool> selectedBadge = [false.obs, false.obs, false.obs, false.obs].obs;

  RxBool isCm = true.obs;
  RxBool isKg = true.obs;

  RxBool obscureText = true.obs;
  RxBool obscureText2 = true.obs;
  RxBool obscureText3 = true.obs;
  RxBool obscureText4 = true.obs;
  RxBool obscureText5 = true.obs;

  RxBool isMen = true.obs;
  RxBool isAgreed = false.obs;

  // List of country codes (extend as you need)
  final List<String> countryCodes = [
    '+33',
    '+1',
    '+44',
    '+49',
    '+880',
  ];

  // Selected country code
  RxString selectedCode = '+33'.obs;

  // Phone number controller
  final TextEditingController phoneController = TextEditingController();

  void changeCode(String value) {
    selectedCode.value = value;
  }

  void selectBadge(int index) {
    for (int i = 0; i < selectedBadge.length; i++) {
      if (i == index && selectedBadge[i].value == false) {
        selectedBadge[i].value = true;
      } else {
        selectedBadge[i].value = false;
      }
    }
  }

  Future<void> loadUserName() async {
    final storage = FlutterSecureStorage();

    String? name = await storage.read(key: 'name');
    String? surname = await storage.read(key: 'surname');

    userFullName.value = "${name ?? ''} ${surname ?? ''}".trim();
  }

  @override
  void onInit() {
    super.onInit();
    loadUserName();
    fetchProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  // ✅ NEW: Fetch profile from API and parse ALL fields
  Future<void> fetchProfile() async {
    try {
      isProfileLoading.value = true;

      final response = await _apiService.getProfile();

      if (response.statusCode == 200) {
        final Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

        profile.value = Profile.fromJson(data);
      } else {
        debugPrint('❌ Failed to load profile: ${response.statusCode}');
        debugPrint('Body: ${response.body}');
      }
    } catch (e) {
      debugPrint('❌ Error while loading profile: $e');
    } finally {
      isProfileLoading.value = false;
    }
  }
}
