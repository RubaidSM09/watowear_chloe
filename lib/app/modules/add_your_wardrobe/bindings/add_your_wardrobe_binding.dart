import 'package:get/get.dart';

import '../controllers/add_your_wardrobe_controller.dart';

class AddYourWardrobeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddYourWardrobeController>(
      () => AddYourWardrobeController(),
    );
  }
}
