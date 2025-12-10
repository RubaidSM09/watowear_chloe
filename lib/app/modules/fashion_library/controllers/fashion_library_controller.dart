import 'dart:convert';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/data/services/api_services.dart';

import '../../../data/model/models/library_item.dart';

class FashionLibraryController extends GetxController {
  RxBool isMultipleSelected = false.obs;

  final ApiService _apiService = Get.find<ApiService>();

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxList<LibraryItem> items = <LibraryItem>[].obs;
  RxList<LibraryItem> filteredLibraryItems = <LibraryItem>[].obs;

  final selectedItemIds = <int>{}.obs;

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


        filteredLibraryItems.value =
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

  void toggleItemSelection(int id, bool isSelected) {
    final set = selectedItemIds.value;
    if (isSelected) {
      set.add(id);
    } else {
      set.remove(id);
    }
    selectedItemIds.refresh();
  }

  void clearSelections() {
    selectedItemIds.value.clear();
    selectedItemIds.refresh();
  }

  Future<bool> addSelectedItemsToCloset() async {
    final ids = selectedItemIds.value.toList();

    if (ids.isEmpty) {
      return false; // view will handle "no selection" message
    }

    bool allSuccess = true;

    for (final id in ids) {
      final response = await _apiService.addLibraryItemToCloset(id);
      if (response.statusCode != 200 && response.statusCode != 201) {
        allSuccess = false;
      }
    }

    if (allSuccess) {
      clearSelections();
    }

    return allSuccess;
  }



  // ---------- FILTER HELPERS ----------

// Clear all category-related selections
  void clearCategoryFilters() {
    for (final rx in selectedCategory) {
      rx.value = false;
    }
    for (final rx in selectedClothingCategory) {
      rx.value = false;
    }
    for (final rx in selectedShoesCategory) {
      rx.value = false;
    }
    for (final rx in selectedBagsCategory) {
      rx.value = false;
    }
    for (final rx in selectedAccessoriesCategory) {
      rx.value = false;
    }
  }

// Clear all color selections
  void clearColorFilters() {
    for (final rx in selectedColor) {
      rx.value = false;
    }
  }

// Clear all style selections
  void clearStyleFilters() {
    for (final rx in selectedStyle) {
      rx.value = false;
    }
  }

// Build a set of high-level category keywords based on selectedCategory[]
  Set<String> _buildCategoryFilters() {
    final filters = <String>{};

    // index: 0=Clothing, 1=Shoes, 2=Bags, 3=Accessories
    if (selectedCategory[0].value) filters.add('clothing');
    if (selectedCategory[1].value) filters.add('shoes');
    if (selectedCategory[2].value) filters.add('bags');
    if (selectedCategory[3].value) filters.add('accessories');

    return filters;
  }

// Build a set of color names based on selectedColor[]
  Set<String> _buildColorFilters() {
    final filters = <String>{};

    // Titles in the same order as ColorsRow indices
    const titles = [
      'Animal Print', // 0
      'Black',        // 1
      'Blue',         // 2
      'Brown',        // 3
      'Burgundy',     // 4
      'Cream',        // 5
      'Ecru',         // 6
      'Gold',         // 7
      'Gray',         // 8
      'Green',        // 9
      'Ivary',        // 10 (typo in UI, keep same)
      'Metallic',     // 11
      'Multi',        // 12
      'Natural',      // 13
      'Off-white',    // 14
      'Red',          // 15
      'Orange',       // 16
      'Silver',       // 17
      'Yellow',       // 18
      'Light blue',   // 19
      'Khaki',        // 20
      'Dark blue',    // 21
    ];

    for (int i = 0; i < selectedColor.length && i < titles.length; i++) {
      if (selectedColor[i].value) {
        filters.add(titles[i].toLowerCase());
      }
    }

    return filters;
  }

// Build a set of style names based on selectedStyle[]
  Set<String> _buildStyleFilters() {
    final filters = <String>{};

    const titles = [
      'All',                 // 0
      'Classic Chic',        // 1
      'Bohemian',            // 2
      'Streetwear/Urban',    // 3
      'Romantic/Feminine',   // 4
      'Avant-Garde/Edgy',    // 5
      'Preppy/Polished',     // 6
      'Minimalist',          // 7
      'Vintage/Retro',       // 8
      'Glamorous',           // 9
      'Sporty/Athleisure',   // 10
      'Artsy/Eclectic',      // 11
      'Casual/Laid-back',    // 12
      'Rocker/Grunge',       // 13
    ];

    // If "All" (index 0) is selected, we treat it as "no style filter"
    if (selectedStyle[0].value) {
      return filters; // empty set => no filtering by style
    }

    for (int i = 0; i < selectedStyle.length && i < titles.length; i++) {
      if (selectedStyle[i].value) {
        filters.add(titles[i].toLowerCase());
      }
    }

    return filters;
  }

// Main apply function, called from the FilterClosetView "Apply" button
  void applyFilters() {
    List<LibraryItem> filtered = List<LibraryItem>.from(items);
    // ----- CATEGORY FILTER -----
    final categoryFilters = _buildCategoryFilters();
    if (categoryFilters.isNotEmpty) {
      filtered = filtered.where((item) {
        final cat = (item.category ?? '').toLowerCase();
        final sub = (item.subcategory ?? '').toLowerCase();
        if (cat.isEmpty && sub.isEmpty) return false;
        // match if any keyword appears in category or subcategory
        return categoryFilters.any(
              (f) => cat.contains(f) || sub.contains(f),
        );
      }).toList();
    }
    // ----- COLOR FILTER -----
    final colorFilters = _buildColorFilters();
    if (colorFilters.isNotEmpty) {
      filtered = filtered.where((item) {
        final c = (item.colour ?? '').toLowerCase();
        if (c.isEmpty) return false;
        return colorFilters.any((f) => c.contains(f));
      }).toList();
    }
    // ----- STYLE FILTER -----
    final styleFilters = _buildStyleFilters();
    if (styleFilters.isNotEmpty) {
      filtered = filtered.where((item) {
        final s = (item.style ?? '').toLowerCase();
        if (s.isEmpty) return false;
        return styleFilters.any((f) => f.contains(s));
      }).toList();
    }
    // final result
    filteredLibraryItems.assignAll(filtered);
  }
}
