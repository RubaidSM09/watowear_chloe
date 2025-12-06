import 'package:get/get.dart';

import '../controllers/fashion_library_controller.dart';

class FashionLibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FashionLibraryController>(
      () => FashionLibraryController(),
    );
  }
}
