import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../common/widget/color_wheel/color_wheel_controller.dart';
import '../../../data/services/api_services.dart';
import '../../add_your_wardrobe/views/add_your_wardrobe_view.dart';

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

  // Overlay for gender dropdown
  OverlayEntry? _genderOverlay;

  // Page 2
  RxBool bodyShapeClicked = false.obs;
  RxList<RxBool> selectedBodyShape = List.generate(6, (_) => false.obs).obs;
  RxBool skinToneClicked = false.obs;
  RxList<RxBool> selectedSkinTone = List.generate(8, (_) => false.obs).obs;
  RxBool eyesClicked = false.obs;
  RxList<RxBool> selectedEyeColor = List.generate(6, (_) => false.obs).obs;
  RxList<RxBool> selectedHairColor = List.generate(6, (_) => false.obs).obs;

  // Page 3
  RxList<RxBool> selectedComfortZone = [false.obs, false.obs, false.obs].obs;

  // Page 4 - Colors
  RxBool isLoveSelected = true.obs;

  RxList<RxBool> selectedLoveColor = [
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
  ].obs;

  RxList<RxBool> selectedAvoidColor = [
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
    false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs,
  ].obs;

  RxInt selectedLoveCount = 0.obs;
  RxInt selectedAvoidCount = 0.obs;

  // Vibe
  RxList<RxBool> selectedWomenVibe = List.generate(12, (_) => false.obs).obs;
  RxList<RxBool> selectedMenVibe = List.generate(11, (_) => false.obs).obs;
  RxInt vibeCount = 0.obs;
  RxBool isWomenSelected = true.obs;

  // Body Preferences
  RxBool isHighlightSelected = true.obs;
  RxList<RxBool> selectedHighlight = List.generate(8, (_) => false.obs).obs;
  RxList<RxBool> selectedCover = List.generate(8, (_) => false.obs).obs;
  RxBool isWomenSelected2 = true.obs;

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

  // ====== GENDER DROPDOWN OVERLAY ======
  void toggleGenderDropdown(BuildContext context, GlobalKey key) {
    if (genderClicked.value) {
      _closeGenderDropdown();
    } else {
      _showGenderDropdown(context, key);
    }
  }

  void _showGenderDropdown(BuildContext context, GlobalKey key) {
    final renderBox = key.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    genderClicked.value = true;

    _genderOverlay = OverlayEntry(
      builder: (ctx) {
        return Stack(
          children: [
            // Tap outside to close
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _closeGenderDropdown,
              ),
            ),
            Positioned(
              left: offset.dx,
              top: offset.dy + size.height,
              width: size.width,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black87, width: 0.7),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _genderOption('Male', 0),
                      _genderOption('Female', 1),
                      _genderOption('Non binary', 2),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_genderOverlay!);
  }

  Widget _genderOption(String label, int index) {
    final isSelected = selectedGender[index].value;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        selectGender(index);
        _closeGenderDropdown();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        color: isSelected ? const Color(0xFFF4F1EB) : Colors.transparent,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  void _closeGenderDropdown() {
    _genderOverlay?.remove();
    _genderOverlay = null;
    genderClicked.value = false;
  }

  // ====== Selection Helpers ======
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

  void selectEyeColor(int index) {
    for (int i = 0; i < selectedEyeColor.length; i++) {
      selectedEyeColor[i].value = i == index;
    }
  }

  void selectHairColor(int index) {
    for (int i = 0; i < selectedHairColor.length; i++) {
      selectedHairColor[i].value = i == index;
    }
  }

  void selectComfortZone(int index) {
    for (int i = 0; i < selectedComfortZone.length; i++) {
      selectedComfortZone[i].value = i == index;
    }
  }

  void selectLoveColor (int index) {
    selectedLoveColor[index].value = !selectedLoveColor[index].value;
    if (selectedLoveColor[index].value) {
      selectedLoveCount.value++;
    } else {
      selectedLoveCount.value--;
    }
  }

  void selectAvoidColor (int index) {
    selectedAvoidColor[index].value = !selectedAvoidColor[index].value;
    if (selectedAvoidColor[index].value) {
      selectedAvoidCount.value++;
    } else {
      selectedAvoidCount.value--;
    }
  }

  void selectWomenVibe(int index) {
    selectedWomenVibe[index].value = !selectedWomenVibe[index].value;
    if (selectedWomenVibe[index].value) {
      vibeCount.value++;
    } else {
      vibeCount.value--;
    }
  }

  void selectMenVibe(int index) {
    selectedMenVibe[index].value = !selectedMenVibe[index].value;
    if (selectedMenVibe[index].value) {
      vibeCount.value++;
    } else {
      vibeCount.value--;
    }
  }

  void refineVibe() {
    for (int i = 0; i < selectedWomenVibe.length; i++) {
      selectedWomenVibe[i].value = false;
    }
    for (int i = 0; i < selectedMenVibe.length; i++) {
      selectedMenVibe[i].value = false;
    }
    vibeCount.value = 0;
    Get.back();
  }

  void selectHighlightCover(bool isHighlight, int index) {
    if (isHighlight) {
      selectedCover[index].value = false;
      selectedHighlight[index].value = !selectedHighlight[index].value;
    } else {
      selectedHighlight[index].value = false;
      selectedCover[index].value = !selectedCover[index].value;
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

  // ====== Get selected values ======
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
    final eyeColor = ['Black', 'Brown', 'Blonde', 'Red', 'Grey', 'Ginger'];
    final idx = selectedEyeColor.indexWhere((e) => e.value);
    return idx != -1 ? eyeColor[idx] : null;
  }

  String? get selectedHairColorValue {
    final hairColor = ['Brown', 'Hazel', 'Green', 'Blue', 'Grey', 'Black'];
    final idx = selectedHairColor.indexWhere((e) => e.value);
    return idx != -1 ? hairColor[idx] : null;
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

  // ====== Location, submit, etc (unchanged) ======
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
    // (your existing validation + API call logic, unchanged)
    // ...
    // keep this part as you already wrote
    // ...
    return false; // placeholder, keep your real return logic
  }

  @override
  void onClose() {
    pageController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    _closeGenderDropdown();
    super.onClose();
  }
}

class Styles {
  String name;
  String description;
  Styles(this.name, this.description);
}
