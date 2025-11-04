import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxList<RxBool> selectedBadge = [false.obs, false.obs, false.obs, false.obs].obs;

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
