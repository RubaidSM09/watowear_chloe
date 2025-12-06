import 'dart:convert';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/data/services/api_services.dart';

import '../../../data/model/models/library_item.dart';

class FashionLibraryController extends GetxController {
  RxBool isMultipleSelected = false.obs;

  final count = 0.obs;

  final ApiService _apiService = Get.find<ApiService>();

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxList<LibraryItem> items = <LibraryItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLibraryItems();
  }

  Future<void> fetchLibraryItems() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await _apiService.getFashionLibraryItems();

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
        items.value =
            jsonList.map((e) => LibraryItem.fromJson(e as Map<String, dynamic>)).toList();
      } else {
        errorMessage.value = 'Failed to load items (${response.statusCode}).';
      }
    } catch (e) {
      errorMessage.value = 'Something went wrong while loading items.';
    } finally {
      isLoading.value = false;
    }
  }

  void increment() => count.value++;
}
