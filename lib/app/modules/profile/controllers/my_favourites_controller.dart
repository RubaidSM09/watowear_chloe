import 'dart:convert';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/data/model/closet_item.dart';
import 'package:watowear_chloe/app/data/services/api_services.dart';

class MyFavouritesController extends GetxController {
  final ApiService _apiService = ApiService();

  RxBool isFavouriteEmpty = false.obs;
  RxBool isLoading = false.obs;

  RxList<ClosetItem> favouriteItems = <ClosetItem>[].obs;
  RxList<ClosetItem> recentItems = <ClosetItem>[].obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavouriteItems();
    fetchRecentItems();
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

  // ✅ GET /closet/items/?filter=favorites
  Future<void> fetchFavouriteItems() async {
    try {
      isLoading.value = true;

      final response = await _apiService.getFavoriteItems();

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        final items = data
            .map((e) => ClosetItem.fromJson(e as Map<String, dynamic>))
            .toList();

        favouriteItems.assignAll(items);
        isFavouriteEmpty.value = favouriteItems.isEmpty;
      } else {
        isFavouriteEmpty.value = true;
      }
    } catch (e) {
      isFavouriteEmpty.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ POST /closet/items/$id/favorite/ (toggle)
  Future<void> toggleFavourite(int itemId) async {
    final response = await _apiService.toggleFavorite(itemId);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // 🔁 Re-fetch list so removal/addition is reflected
      await fetchFavouriteItems();
    } else {
      // optional: show error through snackbar
    }
  }

  Future<void> fetchRecentItems() async {
    try {
      final response = await _apiService.getRecentItems();

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        final items = data
            .map((e) => ClosetItem.fromJson(e as Map<String, dynamic>))
            .toList();

        recentItems.assignAll(items);
      } else {
        recentItems.clear();
      }
    } catch (e) {
      recentItems.clear();
    }
  }
}
