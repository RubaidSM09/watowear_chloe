import 'package:get/get.dart';

class AddNewItemController extends GetxController {
  RxList<RxBool> selectedMethod = [true.obs, false.obs, false.obs].obs;

  RxBool isUploaded = false.obs;

  final RxDouble progress = 0.6.obs;

  void setProgress(double value) {
    progress.value = value.clamp(0.0, 1.0);
  }

  void selectMethod (int index) {
    for (int i=0; i<selectedMethod.length; i++) {
      if (i == index) {
        selectedMethod[i].value = true;
      } else {
        selectedMethod[i].value = false;
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
