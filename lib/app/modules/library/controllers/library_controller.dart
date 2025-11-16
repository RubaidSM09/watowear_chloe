import 'dart:convert';
import 'package:get/get.dart';

import 'package:watowear_chloe/app/data/model/closet_item.dart';
import 'package:watowear_chloe/app/data/services/api_services.dart';

class LibraryController extends GetxController {
  final ApiService _apiService = ApiService();

  RxBool isEmpty = false.obs;
  RxBool isLoading = false.obs;

  RxList<ClosetItem> closetItems = <ClosetItem>[].obs;

  RxList<RxBool> selectedFilter = [false.obs, false.obs, false.obs].obs;

  RxList<RxBool> selectedCategory = [false.obs, false.obs, false.obs, false.obs].obs;
  RxList<RxBool> selectedClothingCategory = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;
  RxList<RxBool> selectedShoesCategory = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;
  RxList<RxBool> selectedBagsCategory = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;
  RxList<RxBool> selectedAccessoriesCategory = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;

  RxList<RxBool> selectedColor = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;

  RxList<RxBool> selectedStyle = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;

  void selectFilter(int index) {
    for (int i = 0; i < selectedFilter.length; i++) {
      if (i == index) {
        selectedFilter[i].value = true;
      } else {
        selectedFilter[i].value = false;
      }
    }
  }

  void selectCategory(int index) {
    for (int i = 0; i < selectedCategory.length; i++) {
      if (i == index) {
        selectedCategory[i].value = !selectedCategory[i].value;
      } else {
        selectedCategory[i].value = false;
      }
    }
  }

  void selectClothingCategory(int index) {
    selectedClothingCategory[index].value = !selectedClothingCategory[index].value;
  }

  void selectShoesCategory(int index) {
    selectedShoesCategory[index].value = !selectedShoesCategory[index].value;
  }

  void selectBagsCategory(int index) {
    selectedBagsCategory[index].value = !selectedBagsCategory[index].value;
  }

  void selectAccessoriesCategory(int index) {
    selectedAccessoriesCategory[index].value = !selectedAccessoriesCategory[index].value;
  }

  void selectColor(int index) {
    selectedColor[index].value = !selectedColor[index].value;
  }

  void selectStyle(int index) {
    selectedStyle[index].value = !selectedStyle[index].value;
  }

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchClosetItems(); // 👈 fetch on init
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> fetchClosetItems() async {
    try {
      isLoading.value = true;

      final response = await _apiService.getAllItems();

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        final List<ClosetItem> items =
        data.map((e) => ClosetItem.fromJson(e as Map<String, dynamic>)).toList();

        closetItems.assignAll(items);
        isEmpty.value = closetItems.isEmpty;
      } else {
        // If API fails, keep existing UI logic
        isEmpty.value = true;
      }
    } catch (e) {
      isEmpty.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
