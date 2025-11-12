import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/add_your_wardrobe/views/add_your_wardrobe_view.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../common/widget/color_wheel/color_wheel_controller.dart';
import '../../../data/services/api_services.dart';

class AboutYourselfController extends GetxController {
  final pageController = PageController();
  final current = 0.obs;
  final ApiService _apiService = Get.find<ApiService>(); // Ensure ApiService is injected

  // Page 1
  RxBool genderClicked = false.obs;
  RxList<RxBool> selectedGender = [false.obs, false.obs, false.obs].obs;
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  RxBool isCm = true.obs;
  final weightController = TextEditingController();
  RxBool isKg = true.obs;
  RxBool isLocationEnabled = false.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  // Page 2
  RxBool bodyShapeClicked = false.obs;
  RxList<RxBool> selectedBodyShape = List.generate(6, (_) => false.obs).obs;
  RxBool skinToneClicked = false.obs;
  RxList<RxBool> selectedSkinTone = List.generate(8, (_) => false.obs).obs;
  RxBool eyesClicked = false.obs;
  RxList<RxBool> selectedEyes = List.generate(5, (_) => false.obs).obs;

  // Page 3
  RxList<RxBool> selectedComfortZone = [false.obs, false.obs, false.obs].obs;

  // Page 4 - Colors
  late ColorWheelController favColorsCtrl;
  late ColorWheelController avoidColorsCtrl;

  // Page 5 - Muses
  RxBool isMen = false.obs;
  RxList<RxBool> selectedMenStyles = List.generate(6, (_) => false.obs).obs;
  RxList<RxBool> selectedWomenStyles = List.generate(6, (_) => false.obs).obs;

  final menStyles = [
    Styles('Timothée Chalamet', 'Effortless tailoring, fluid silhouettes, bold elegance'),
    Styles('Ryan Gosling', 'Classic modern: bomber jackets, denim, soft masculine tones'),
    Styles('Harry Styles', 'Playful retro, gender-fluid, bold prints'),
    Styles('David Beckham', 'Tailored streetwear, timeless basics, sport-luxe'),
    Styles('Steve McQueen', 'Heritage style: rugged classics, neutral layers'),
    Styles('Pharrell Williams', 'Street couture, statement accessories, avant-garde casual'),
  ];

  final womenStyles = [
    Styles('Jennifer Aniston', 'Effortless basics, denim, knits, neutral palette'),
    Styles('Audrey Hepburn', 'Icon of elegance & refinement'),
    Styles('Hailey Bieber', 'Sporty luxe, minimalist streetwear'),
    Styles('Zoë Kravitz', 'Sleek monochrome, leather, edgy cuts'),
    Styles('Dua Lipa', 'Bold trends, Gen Z glam'),
    Styles('Tilda Swinton', 'Androgynous, avant-garde tailoring'),
  ];

  @override
  void onInit() {
    super.onInit();
    favColorsCtrl = Get.put(ColorWheelController(), tag: 'fav');
    avoidColorsCtrl = Get.put(ColorWheelController(), tag: 'avoid');
  }

  void onPageChanged(int i) => current.value = i;

  void skip() => Get.offAllNamed('/sign-in');

  Future<void> next() async {
    if (current.value < 5) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      // Final page → Submit profile
      if (await _validateAndSubmit()) {
        Get.offAll(() => AddYourWardrobeView());
      }
    }
  }

  void back() {
    if (current.value > 0) {
      pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Get.offAllNamed('/home');
    }
  }

  // Selection Helpers
  void selectGender(int index) {
    for (int i = 0; i < selectedGender.length; i++) {
      selectedGender[i].value = i == index;
    }
  }

  void selectBodyShape(int index) {
    for (int i = 0; i < selectedBodyShape.length; i++) {
      selectedBodyShape[i].value = i == index;
    }
  }

  void selectSkinTone(int index) {
    for (int i = 0; i < selectedSkinTone.length; i++) {
      selectedSkinTone[i].value = i == index;
    }
  }

  void selectEyes(int index) {
    for (int i = 0; i < selectedEyes.length; i++) {
      selectedEyes[i].value = i == index;
    }
  }

  void selectComfortZone(int index) {
    for (int i = 0; i < selectedComfortZone.length; i++) {
      selectedComfortZone[i].value = i == index;
    }
  }

  void selectMenStyles(int index) {
    for (int i = 0; i < selectedMenStyles.length; i++) {
      selectedMenStyles[i].value = i == index;
    }
  }

  void selectWomenStyles(int index) {
    for (int i = 0; i < selectedWomenStyles.length; i++) {
      selectedWomenStyles[i].value = i == index;
    }
  }

  // Get selected values
  String? get selectedGenderValue {
    if (selectedGender[0].value) return 'Male';
    if (selectedGender[1].value) return 'Female';
    if (selectedGender[2].value) return 'Non binary';
    return null;
  }

  String? get selectedBodyShapeValue {
    final shapes = ['Apple', 'Pear', 'Hourglass', 'Rectangle', 'Inverted Triangle', 'I am not sure'];
    final idx = selectedBodyShape.indexWhere((e) => e.value);
    return idx != -1 ? shapes[idx] : null;
  }

  String? get selectedSkinToneValue {
    final tones = ['Fair', 'Light', 'Medium', 'Olive', 'Tan', 'Deep', 'Dark', 'I\'m not sure'];
    final idx = selectedSkinTone.indexWhere((e) => e.value);
    return idx != -1 ? tones[idx] : null;
  }

  String? get selectedEyeColorValue {
    final eyes = ['Black', 'Brown', 'Blue', 'Grey', 'Green'];
    final idx = selectedEyes.indexWhere((e) => e.value);
    return idx != -1 ? eyes[idx] : null;
  }

  String? get selectedComfortZoneValue {
    final zones = ['Safe', 'A bit adventurous', 'Surprise me!'];
    final idx = selectedComfortZone.indexWhere((e) => e.value);
    return idx != -1 ? zones[idx] : null;
  }

  List<String> get selectedMuses {
    final list = <String>[];
    if (isMen.value) {
      for (int i = 0; i < selectedMenStyles.length; i++) {
        if (selectedMenStyles[i].value) list.add(menStyles[i].name);
      }
    } else {
      for (int i = 0; i < selectedWomenStyles.length; i++) {
        if (selectedWomenStyles[i].value) list.add(womenStyles[i].name);
      }
    }
    return list;
  }

  Future<bool> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return false;
    }

    if (permission == LocationPermission.deniedForever) return false;

    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _validateAndSubmit() async {
    // Validate required fields
    if (selectedGenderValue == null) {
      Get.snackbar('Error', 'Please select gender');
      return false;
    }
    if (ageController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter age');
      return false;
    }
    if (heightController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter height');
      return false;
    }
    if (weightController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter weight');
      return false;
    }
    if (selectedBodyShapeValue == null) {
      Get.snackbar('Error', 'Please select body shape');
      return false;
    }
    if (selectedSkinToneValue == null) {
      Get.snackbar('Error', 'Please select skin tone');
      return false;
    }
    if (selectedEyeColorValue == null) {
      Get.snackbar('Error', 'Please select eye color');
      return false;
    }
    if (selectedComfortZoneValue == null) {
      Get.snackbar('Error', 'Please select comfort zone');
      return false;
    }
    if (selectedMuses.isEmpty) {
      Get.snackbar('Error', 'Please select at least one muse');
      return false;
    }

    // Convert height
    double heightCm = double.tryParse(heightController.text) ?? 0;
    if (!isCm.value) {
      heightCm *= 30.48; // ft to cm
    }

    // Convert weight
    double weightKg = double.tryParse(weightController.text) ?? 0;
    if (!isKg.value) {
      weightKg *= 0.453592; // lbs to kg
    }

    // Location
    bool locationOk = true;
    if (isLocationEnabled.value) {
      locationOk = await _getLocation();
      if (!locationOk) {
        Get.snackbar('Location', 'Failed to get location. Using defaults.');
        latitude.value = 48.8566;
        longitude.value = 2.3522;
      }
    } else {
      latitude.value = 0.0;
      longitude.value = 0.0;
    }

    // Colors
    const rings = 5, segments = 18;
    final favoriteColors = favColorsCtrl.selectedColors(rings, segments).map((c) => '#${c.value.toRadixString(16).padLeft(8, '0').substring(2)}').toList();
    final avoidedColors = avoidColorsCtrl.selectedColors(rings, segments).map((c) => '#${c.value.toRadixString(16).padLeft(8, '0').substring(2)}').toList();

    // API Call
    try {
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

      final response = await _apiService.profileSetup(
        selectedGenderValue!,
        int.parse(ageController.text),
        heightCm,
        weightKg,
        isLocationEnabled.value,
        latitude.value,
        longitude.value,
        selectedBodyShapeValue!,
        selectedSkinToneValue!,
        selectedEyeColorValue!,
        selectedComfortZoneValue!,
        favoriteColors,
        avoidedColors,
        selectedMuses,
      );

      Get.back(); // close loading

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Profile saved successfully!');
        return true;
      } else {
        Get.snackbar('Error', 'Failed to save profile: ${response.body}');
        return false;
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', 'Network error: $e');
      return false;
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.onClose();
  }
}

class Styles {
  String name;
  String description;
  Styles(this.name, this.description);
}