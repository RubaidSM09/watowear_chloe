import 'package:get/get.dart';

class OutfitReadyController extends GetxController {
  RxList<RxBool> selectedEditMode = [false.obs, false.obs, false.obs].obs;

  void selectEditMode (int index) {
    for (int i=0;i<selectedEditMode.length;i++) {
      if (i==index) {
        selectedEditMode[i].value = true;
      } else {
        selectedEditMode[i].value = false;
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
