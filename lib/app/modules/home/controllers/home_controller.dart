import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../data/model/my_progress.dart';
import '../../../data/model/profile.dart';
import '../../../data/services/api_services.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();

  // New state
  Rx<Profile?> profile = Rx<Profile?>(null);
  Rx<MyProgress?> myProgress = Rx<MyProgress?>(null);

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  RxString userFullName = ''.obs;

  Future<void> loadUserName() async {
    final storage = FlutterSecureStorage();

    String? name = await storage.read(key: 'name');

    userFullName.value = (name ?? '').trim();
  }

  Future<void> fetchInitialData() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final responses = await Future.wait([
        _apiService.getProfile(),
        _apiService.myProgress(),
      ]);

      final profileRes = responses[0];
      final progressRes = responses[1];

      // Profile
      if (profileRes.statusCode == 200) {
        final data = jsonDecode(profileRes.body) as Map<String, dynamic>;
        profile.value = Profile.fromJson(data);
      } else {
        errorMessage.value =
        'Failed to load profile (${profileRes.statusCode}).';
      }

      // MyProgress
      if (progressRes.statusCode == 200) {
        final data = jsonDecode(progressRes.body) as Map<String, dynamic>;
        myProgress.value = MyProgress.fromJson(data);
      } else {
        errorMessage.value =
        'Failed to load progress (${progressRes.statusCode}).';
      }
    } catch (e) {
      errorMessage.value = 'Something went wrong: $e';
    } finally {
      isLoading.value = false;
    }
  }

  // ===== Helpers for UI =====

  /// e.g. "Beginner", "Refiner"...
  String get currentBadgeLabel {
    final badge = myProgress.value?.currentBadge;
    if (badge == null || badge.isEmpty) return 'Refiner'; // fallback
    return badge;
  }

  /// 0–100
  int get currentProgressPercent {
    return myProgress.value?.progressPercentage ?? 0;
  }

  /// Next badge name from API
  String get nextBadgeLabel {
    final next = myProgress.value?.nextBadgeToUnlock;
    if (next == null || next.isEmpty) return '';
    return next;
  }

  /// Referral code from profile
  String get referralCodeText {
    final code = profile.value?.referralCode;
    if (code == null || code.isEmpty) return '';
    return code;
  }

  /// Total items from summary
  int get totalItems {
    return myProgress.value?.summary?.itemCount ?? 0;
  }

  @override
  void onInit() {
    super.onInit();
    loadUserName();
    fetchInitialData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
