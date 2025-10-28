import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/add_your_wardrobe/views/add_your_wardrobe_view.dart';

class AboutYourselfController extends GetxController {
  final pageController = PageController();
  final current = 0.obs;

  void onPageChanged(int i) => current.value = i;

  void skip() => Get.offAllNamed('/sign-in');

  void next() {
    if (current.value < 5) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Get.offAll(AddYourWardrobeView());
    }
  }

  void back() {
    if (current.value > 0) {
      pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Get.offAllNamed('/home');
    }
  }

  /// About Yourself 1
  RxBool genderClicked = false.obs;
  RxList<RxBool> selectedGender = [false.obs, false.obs, false.obs].obs;

  RxBool isCm = true.obs;
  RxBool isKg = true.obs;
  RxBool isLocationEnabled = false.obs;

  void selectGender(int index) {
    print(index);
    for (int i = 0; i < selectedGender.length; i++) {
      selectedGender[i].value = i == index;
    }
  }

  /// About Yourself 1
  RxBool bodyShapeClicked = false.obs;
  RxList<RxBool> selectedBodyShape = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;

  RxBool skinToneClicked = false.obs;
  RxList<RxBool> selectedSkinTone = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;

  RxBool eyesClicked = false.obs;
  RxList<RxBool> selectedEyes = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;

  void selectBodyShape(int index) {
    print(index);
    for (int i = 0; i < selectedBodyShape.length; i++) {
      selectedBodyShape[i].value = i == index;
    }
  }

  void selectSkinTone(int index) {
    print(index);
    for (int i = 0; i < selectedSkinTone.length; i++) {
      selectedSkinTone[i].value = i == index;
    }
  }

  void selectEyes(int index) {
    print(index);
    for (int i = 0; i < selectedEyes.length; i++) {
      selectedEyes[i].value = i == index;
    }
  }

  /// About Yourself 3
  RxList<RxBool> selectedComfortZone = [false.obs, false.obs, false.obs].obs;

  void selectComfortZone(int index) {
    print(index);
    for (int i = 0; i < selectedComfortZone.length; i++) {
      selectedComfortZone[i].value = i == index;
    }
  }

  /// About Yourself 5
  RxBool isMen = false.obs;
  RxList<RxBool> selectedMenStyles = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;
  RxList<RxBool> selectedWomenStyles = [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs].obs;

  void selectMenStyles(int index) {
    print(index);
    for (int i = 0; i < selectedMenStyles.length; i++) {
      selectedMenStyles[i].value = i == index;
    }
  }

  void selectWomenStyles(int index) {
    print(index);
    for (int i = 0; i < selectedWomenStyles.length; i++) {
      selectedWomenStyles[i].value = i == index;
    }
  }

  List<Styles> menStyles = [
    Styles('Timothée Chalamet', 'Effortless tailoring, fluid silhouettes, bold elegance'),
    Styles('Ryan Gosling', 'Classic modern: bomber jackets, denim, soft masculine tones'),
    Styles('Harry Styles', 'Playful retro, gender-fluid, bold prints'),
    Styles('David Beckham', 'Tailored streetwear, timeless basics, sport-luxe'),
    Styles('Steve McQueen', 'Heritage style: rugged classics, neutral layers'),
    Styles('Pharrell Williams', 'Street couture, statement accessories, avant-garde casual'),
  ];

  List<Styles> womenStyles = [
    Styles('Jennifer Aniston', 'Effortless basics, denim, knits, neutral palette'),
    Styles('Audrey Hepburn', 'Icon of elegance & refinement'),
    Styles('Hailey Bieber', 'Sporty luxe, minimalist streetwear'),
    Styles('Zoë Kravitz', 'Sleek monochrome, leather, edgy cuts'),
    Styles('Dua Lipa', 'Bold trends, Gen Z glam'),
    Styles('Tilda Swinton', 'Androgynous, avant-garde tailoring'),
  ];

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

class Styles {
  String name;
  String description;

  Styles(this.name, this.description);
}
