import 'package:get/get.dart';

import '../controllers/add_new_item_controller.dart';

class AddNewItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewItemController>(
      () => AddNewItemController(),
    );
  }
}
