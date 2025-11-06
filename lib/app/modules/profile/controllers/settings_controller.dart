import 'package:get/get.dart';

class SettingsController extends GetxController {
  List<String> countries = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
  ];

  RxBool isFuncCustomCookiesActive = true.obs;
  RxBool isAnalysisCookiesActive = true.obs;
  RxBool isAdvertisingCookiesActive = true.obs;

  RxInt current = 0.obs;

  void nextTnC(int index) {
    if (index == 0) {
      current.value = 1;
      return;
    } else if (index == 1) {
      current.value = 2;
      return;
    } else if (index == 2) {
      current.value = 3;
      return;
    } else if (index == 3) {
      current.value = 4;
      return;
    } else if (index == 4) {
      current.value = 5;
      return;
    } else {
      return;
    }
  }

  void previousTnC(int index) {
    if (index == 1) {
      current.value = 0;
      return;
    } else if (index == 2) {
      current.value = 1;
      return;
    } else if (index == 3) {
      current.value = 2;
      return;
    } else if (index == 4) {
      current.value = 3;
      return;
    } else if (index == 5) {
      current.value = 4;
      return;
    } else {
      return;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
