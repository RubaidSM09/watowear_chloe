import 'package:get/get.dart';

import 'package:watowear_chloe/app/modules/add_new_item/controllers/crop_item_controller.dart';

import '../controllers/add_new_item_controller.dart';

class AddNewItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CropItemController>(
      () => CropItemController(),
    );
    Get.lazyPut<AddNewItemController>(
      () => AddNewItemController(),
    );
  }
}
