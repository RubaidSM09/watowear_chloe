import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxList<RxBool> selectedBadge = [false.obs, false.obs, false.obs, false.obs].obs;

  RxBool isCm = true.obs;
  RxBool isKg = true.obs;

  RxBool isFavouriteEmpty = false.obs;

  RxBool obscureText = true.obs;
  RxBool obscureText2 = true.obs;
  RxBool obscureText3 = true.obs;
  RxBool obscureText4 = true.obs;
  RxBool obscureText5 = true.obs;

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

  void selectBadge (int index) {
    for (int i=0; i<selectedBadge.length ; i++) {
      if (i == index && selectedBadge[i].value == false) {
        selectedBadge[i].value = true;
      } else {
        selectedBadge[i].value = false;
      }
    }
  }

  final count = 0.obs;
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
    super.onClose();
  }

  void increment() => count.value++;
}
