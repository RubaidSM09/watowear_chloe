import 'package:get/get.dart';

class AboutYourselfController extends GetxController {
  /// About Yourself 1
  RxBool genderClicked = false.obs;
  RxList<RxBool> selectedGender = [false.obs, false.obs, false.obs].obs;

  RxBool isCm = true.obs;
  RxBool isKg = true.obs;
  RxBool isLocationEnabled = false.obs;

  void selectGender(int index) {
    print(index);
    for (int i = 0; i < selectedGender.length; i++) {
      selectedGender[i].value = i == index;
    }
  }

  /// About Yourself 1
  RxBool bodyShapeClicked = false.obs;
  RxList<RxBool> selectedBodyShape = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;

  RxBool skinToneClicked = false.obs;
  RxList<RxBool> selectedSkinTone = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;

  RxBool eyesClicked = false.obs;
  RxList<RxBool> selectedEyes = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;

  void selectBodyShape(int index) {
    print(index);
    for (int i = 0; i < selectedBodyShape.length; i++) {
      selectedBodyShape[i].value = i == index;
    }
  }

  void selectSkinTone(int index) {
    print(index);
    for (int i = 0; i < selectedSkinTone.length; i++) {
      selectedSkinTone[i].value = i == index;
    }
  }

  void selectEyes(int index) {
    print(index);
    for (int i = 0; i < selectedEyes.length; i++) {
      selectedEyes[i].value = i == index;
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
