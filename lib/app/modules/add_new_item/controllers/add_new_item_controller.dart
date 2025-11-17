import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';

import 'package:watowear_chloe/app/data/model/closet_item.dart';
import 'package:watowear_chloe/app/data/services/api_services.dart';

import '../views/photo_preview_view.dart';

class AddNewItemController extends GetxController {
  final ApiService _apiService = ApiService();

  RxList<RxBool> selectedMethod = [true.obs, false.obs, false.obs].obs;

  RxBool isUploaded = false.obs;
  final RxDouble progress = 0.6.obs;

  // 👇 CAMERA STATE
  CameraController? cameraController;
  RxBool isCameraInitialized = false.obs;
  RxBool isUsingFrontCamera = false.obs;

  // 👇 CAPTURED IMAGE
  RxString capturedImagePath = ''.obs;

  // 👇 LAST ADDED ITEM (from GET /closet/items/)
  Rx<ClosetItem?> latestItem = Rx<ClosetItem?>(null);

  void setProgress(double value) {
    progress.value = value.clamp(0.0, 1.0);
  }

  void selectMethod(int index) {
    for (int i = 0; i < selectedMethod.length; i++) {
      selectedMethod[i].value = i == index;
    }

    // Initialize camera when camera tab is selected
    if (index == 0 && !isCameraInitialized.value) {
      initCamera();
    }
  }

  // -------- CAMERA LOGIC ----------

  Future<void> initCamera() async {
    try {
      final cameras = await availableCameras();

      // back camera first
      CameraDescription? backCamera;
      CameraDescription? frontCamera;

      for (final c in cameras) {
        if (c.lensDirection == CameraLensDirection.back) {
          backCamera ??= c;
        } else if (c.lensDirection == CameraLensDirection.front) {
          frontCamera ??= c;
        }
      }

      final initialCamera =
      isUsingFrontCamera.value ? frontCamera ?? backCamera : backCamera ?? frontCamera;

      if (initialCamera == null) return;

      cameraController?.dispose();

      cameraController = CameraController(
        initialCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await cameraController!.initialize();
      isCameraInitialized.value = true;
    } catch (e) {
      isCameraInitialized.value = false;
      // you can log error if needed
    }
  }

  Future<void> switchCamera() async {
    isUsingFrontCamera.value = !isUsingFrontCamera.value;
    await initCamera();
  }

  Future<void> captureAndGoToPreview() async {
    if (cameraController == null || !cameraController!.value.isInitialized) return;

    try {
      final XFile file = await cameraController!.takePicture();
      capturedImagePath.value = file.path;

      Get.to(const PhotoPreviewView());
    } catch (e) {
      // handle error if needed
    }
  }

  // ---------- UPLOAD + FETCH LATEST ITEM ----------

  Future<bool> uploadCurrentPhotoAndFetchLatest() async {
    if (capturedImagePath.value.isEmpty) return false;

    final file = File(capturedImagePath.value);

    final uploadResponse = await _apiService.addClosetItem(file);

    if (uploadResponse.statusCode != 200 &&
        uploadResponse.statusCode != 201) {
      return false;
    }

    // Now fetch all items and pick the latest one
    final allItemsResponse = await _apiService.getAllItems();
    if (allItemsResponse.statusCode == 200) {
      final List<dynamic> data =
      jsonDecode(allItemsResponse.body) as List<dynamic>;
      final List<ClosetItem> items =
      data.map((e) => ClosetItem.fromJson(e as Map<String, dynamic>)).toList();

      if (items.isNotEmpty) {
        // assuming newest is first; otherwise pick max id
        items.sort((a, b) => (b.id ?? 0).compareTo(a.id ?? 0));
        latestItem.value = items.first;
        return true;
      }
    }

    return false;
  }

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Camera tab is default selected, so init camera
    initCamera();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
