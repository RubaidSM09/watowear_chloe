import 'package:get/get.dart';

import 'package:watowear_chloe/app/modules/generate/controllers/chat_mode_controller.dart';

import '../controllers/generate_controller.dart';

class GenerateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatModeController>(
      () => ChatModeController(),
    );
    Get.lazyPut<GenerateController>(
      () => GenerateController(),
    );
  }
}
