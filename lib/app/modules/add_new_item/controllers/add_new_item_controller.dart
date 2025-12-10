import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart'; // 👈 NEW
import 'package:get/get.dart';

import 'package:watowear_chloe/app/data/model/closet_item.dart';
import 'package:watowear_chloe/app/data/services/api_services.dart';
import 'package:photo_manager/photo_manager.dart';

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

  // ---------- GALLERY STATE ----------
  final RxList<AssetEntity> galleryAssets = <AssetEntity>[].obs;
  final RxSet<String> selectedGalleryAssetIds = <String>{}.obs;
  final RxList<File> selectedGalleryFiles = <File>[].obs;

  // 👇 Pagination internals (latest → oldest logic)
  AssetPathEntity? _galleryPath;
  int _galleryTotal = 0;
  int _galleryLoaded = 0;
  final int _galleryPageSize = 60;
  bool _isLoadingGallery = false;
  bool _hasMoreGallery = true;

  // Scroll controller for infinite scroll
  late final ScrollController scrollController;

  // Selected files currently in the “Reframe” flow
  final RxList<File> reframeFiles = <File>[].obs;

  // Optional: show loading state while uploading to closet
  RxBool isUploadingCloset = false.obs;

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

    // Load gallery when Gallery tab is selected
    if (index == 1) {
      loadGalleryAssets();
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

      final initialCamera = isUsingFrontCamera.value
          ? frontCamera ?? backCamera
          : backCamera ?? frontCamera;

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

    final allItemsResponse = await _apiService.getAllItems();
    if (allItemsResponse.statusCode == 200) {
      final List<dynamic> data =
      jsonDecode(allItemsResponse.body) as List<dynamic>;
      final List<ClosetItem> items = data
          .map((e) => ClosetItem.fromJson(e as Map<String, dynamic>))
          .toList();

      if (items.isNotEmpty) {
        items.sort((a, b) => (b.id ?? 0).compareTo(a.id ?? 0));
        latestItem.value = items.first;
        return true;
      }
    }

    return false;
  }

  // ---------- GALLERY PAGINATION (LATEST → OLDEST) ----------

  Future<void> loadGalleryAssets() async {
    // Already initialized and we have some assets → don't reset, just keep loading more via scroll
    if (_galleryPath != null && galleryAssets.isNotEmpty) return;

    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (!ps.isAuth) {
      // Permission denied – handle if needed
      return;
    }

    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.image,
    );

    if (paths.isEmpty) return;

    _galleryPath = paths.first;
    _galleryTotal = await _galleryPath!.assetCountAsync;

    // Reset pagination
    _galleryLoaded = 0;
    _hasMoreGallery = true;
    galleryAssets.clear();
    selectedGalleryAssetIds.clear();

    await loadMoreGalleryAssets();
  }

  Future<void> loadMoreGalleryAssets() async {
    if (_galleryPath == null) return;
    if (!_hasMoreGallery || _isLoadingGallery) return;

    _isLoadingGallery = true;

    final int remaining = _galleryTotal - _galleryLoaded;
    if (remaining <= 0) {
      _hasMoreGallery = false;
      _isLoadingGallery = false;
      return;
    }

    final int size =
    remaining < _galleryPageSize ? remaining : _galleryPageSize;

    // We want latest → oldest globally, so we pull from the END of the list
    final int end = _galleryTotal - _galleryLoaded;
    final int start = end - size;

    final List<AssetEntity> page = await _galleryPath!.getAssetListRange(
      start: start,
      end: end,
    );

    // Inside each page, indices go older → newer, so reverse to have newest first
    galleryAssets.addAll(page.reversed);

    _galleryLoaded += size;
    _isLoadingGallery = false;
  }

  void toggleGallerySelection(AssetEntity asset) {
    final id = asset.id;
    if (selectedGalleryAssetIds.contains(id)) {
      selectedGalleryAssetIds.remove(id);
    } else {
      selectedGalleryAssetIds.add(id);
    }
    selectedGalleryAssetIds.refresh();
  }

  Future<List<File>> resolveSelectedGalleryFiles() async {
    final List<File> files = [];

    for (final asset in galleryAssets) {
      if (!selectedGalleryAssetIds.contains(asset.id)) continue;
      final File? f = await asset.file;
      if (f != null) {
        files.add(f);
      }
    }

    selectedGalleryFiles.assignAll(files);
    return files;
  }

  // ----------------------------------------------
  // Upload all reframe images to closet (one by one)
  // ----------------------------------------------
  Future<bool> uploadReframeFilesToCloset() async {
    if (reframeFiles.isEmpty) return false;

    isUploadingCloset.value = true;
    try {
      for (final file in reframeFiles) {
        final resp = await _apiService.addClosetItem(file);
        if (resp.statusCode != 200 && resp.statusCode != 201) {
          // stop on first failure
          return false;
        }
      }
      return true;
    } finally {
      isUploadingCloset.value = false;
    }
  }

  // Helper: clear everything related to current selection
  void discardSelection() {
    reframeFiles.clear();
    selectedGalleryFiles.clear();
    selectedGalleryAssetIds.clear();
  }

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Camera tab is default selected, so init camera
    initCamera();

    // Scroll controller for infinite scroll on Gallery tab
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!selectedMethod[1].value) return; // Only when Gallery tab is active
    if (!_hasMoreGallery || _isLoadingGallery) return;
    if (!scrollController.hasClients) return;

    final position = scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      // Near bottom → load more
      loadMoreGalleryAssets();
    }
  }

  @override
  void onClose() {
    cameraController?.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
