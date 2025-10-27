import 'package:get/get.dart';

import 'package:watowear_chloe/app/modules/onboarding/controllers/onboarding2_controller.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Onboarding2Controller>(
      () => Onboarding2Controller(),
    );
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
    );
  }
}
