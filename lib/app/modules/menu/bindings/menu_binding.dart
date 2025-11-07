import 'package:get/get.dart';

import 'package:watowear_chloe/app/modules/menu/controllers/faq_controller.dart';
import 'package:watowear_chloe/app/modules/menu/controllers/shop_controller.dart';

import '../controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqController>(
      () => FaqController(),
    );
    Get.lazyPut<ShopController>(
      () => ShopController(),
    );
    Get.lazyPut<MenuController>(
      () => MenuController(),
    );
  }
}
