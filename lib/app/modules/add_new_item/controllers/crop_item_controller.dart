import 'dart:io';
import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:watowear_chloe/app/modules/add_new_item/controllers/add_new_item_controller.dart';

class CropItemController extends GetxController {
  final CropController cropController = CropController();

  final Rxn<Uint8List> imageBytes = Rxn<Uint8List>();
  final RxBool isCropping = false.obs;

  late final int index;
  late final AddNewItemController addController;

  @override
  void onInit() {
    super.onInit();
    // index is passed via Get.to(..., arguments: index)
    index = Get.arguments as int;
    addController = Get.find<AddNewItemController>();
    _loadImageBytes();
  }

  Future<void> _loadImageBytes() async {
    final file = addController.reframeFiles[index];
    final bytes = await file.readAsBytes();
    imageBytes.value = bytes;
  }

  Future<void> _onCropped(Uint8List data) async {
    final tempDir = await getTemporaryDirectory();
    final file = File(
      '${tempDir.path}/cropped_${DateTime.now().millisecondsSinceEpoch}.png',
    );
    await file.writeAsBytes(data);

    // replace in AddNewItemController
    addController.reframeFiles[index] = file;
    addController.reframeFiles.refresh();

    isCropping.value = false;
    Get.back(); // back to ReframeView
  }

  /// Adapter for crop_your_image ^2.0.0
  void handleCropResult(CropResult result) {
    if (result is CropSuccess) {
      _onCropped(result.croppedImage);
    } else if (result is CropFailure) {
      isCropping.value = false;
      Get.snackbar(
        'Error',
        'Failed to crop image: ${result.cause}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void startCrop() {
    if (imageBytes.value == null || isCropping.value) return;
    isCropping.value = true;
    cropController.crop();
  }
}
