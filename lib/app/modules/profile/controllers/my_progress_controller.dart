import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:watowear_chloe/app/data/model/my_progress.dart';
import 'package:watowear_chloe/app/data/services/api_services.dart';

class MyProgressController extends GetxController {
  final ApiService _apiService = ApiService();

  RxBool isLoading = false.obs;
  Rx<MyProgress?> myProgress = Rx<MyProgress?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchMyProgress();
  }

  Future<void> fetchMyProgress() async {
    try {
      isLoading.value = true;

      final response = await _apiService.myProgress();

      if (response.statusCode == 200) {
        final Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;
        myProgress.value = MyProgress.fromJson(data);
      } else {
        debugPrint('❌ Failed to load progress: ${response.statusCode}');
        debugPrint('Body: ${response.body}');
      }
    } catch (e) {
      debugPrint('❌ Error while loading progress: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Convenience getters (optional)
  int get itemCount => myProgress.value?.summary?.itemCount ?? 0;
  int get outfitFeedbackCount =>
      myProgress.value?.summary?.outfitFeedbackCount ?? 0;
  int get inviteCount => myProgress.value?.summary?.inviteCount ?? 0;
  int get progressPercentage =>
      myProgress.value?.progressPercentage ?? 0;
  String get nextBadgeName =>
      myProgress.value?.nextBadgeToUnlock ?? 'Refiner';
  List<BadgeLevels> get badgeLevels =>
      myProgress.value?.badgeLevels ?? <BadgeLevels>[];
}
