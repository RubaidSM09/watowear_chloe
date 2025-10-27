import 'package:get/get.dart';

import '../controllers/about_yourself_controller.dart';

class AboutYourselfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutYourselfController>(
      () => AboutYourselfController(),
    );
  }
}
