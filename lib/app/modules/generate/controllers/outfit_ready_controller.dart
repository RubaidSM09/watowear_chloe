import 'package:get/get.dart';

class OutfitReadyController extends GetxController {
  RxList<RxBool> selectedEditMode = [false.obs, false.obs, false.obs].obs;

  // ====== OUTFIT DATA FROM BACKEND ======
  final RxMap<String, List<Map<String, dynamic>>> _sets =
      <String, List<Map<String, dynamic>>>{}.obs;

  final RxList<String> setKeys = <String>[].obs;
  final RxInt currentSetIndex = 0.obs;

  List<Map<String, dynamic>> get currentSetItems {
    if (setKeys.isEmpty) return const [];
    final key = setKeys[currentSetIndex.value];
    return _sets[key] ?? const [];
  }

  List<Map<String, dynamic>> setItemsAt(int index) {
    if (index < 0 || index >= setKeys.length) return const [];
    final key = setKeys[index];
    return _sets[key] ?? const [];
  }

  void selectEditMode (int index) {
    for (int i = 0; i < selectedEditMode.length; i++) {
      if (i == index) {
        selectedEditMode[i].value = true;
      } else {
        selectedEditMode[i].value = false;
      }
    }
  }

    void loadFromWs(List<dynamic> rawItems) {
    final Map<String, List<Map<String, dynamic>>> grouped = {};

    for (final raw in rawItems) {
      if (raw is Map<String, dynamic>) {
        final setName = raw['set']?.toString() ?? 'set';
        grouped.putIfAbsent(setName, () => []).add(raw);
      }
    }

    _sets.assignAll(grouped);
    setKeys.assignAll(grouped.keys.toList()..sort());
    currentSetIndex.value = 0;
  }

  void changeSet(int index) {
    if (index < 0 || index >= setKeys.length) return;
    currentSetIndex.value = index;
  }

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    // Read items passed from VoiceModeController via Get.arguments
    final args = Get.arguments;
    if (args is List) {
      loadFromWs(args);
    }
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
}
