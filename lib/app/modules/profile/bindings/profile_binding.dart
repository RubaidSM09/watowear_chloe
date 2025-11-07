import 'package:get/get.dart';

import 'package:watowear_chloe/app/modules/profile/controllers/help_controller.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/notifications_controller.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/rewards_controller.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/settings_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RewardsController>(
      () => RewardsController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.lazyPut<HelpController>(
      () => HelpController(),
    );
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
