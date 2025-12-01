import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding2Controller extends GetxController {
  final items = const [
    'assets/images/onboarding/shirt.png',
    'assets/images/onboarding/coat.png',
    'assets/images/onboarding/pant.png',
  ];

  static const int kStart = 1000;

  late final PageController pageController;
  final pageValue = kStart.toDouble().obs;
  Timer? _auto;

  @override
  void onInit() {
    super.onInit();

    // 👇 Closer spacing — increase viewportFraction
    pageController = PageController(
      viewportFraction: 0.3, // try 0.80–0.85 range for your preferred look
      initialPage: kStart,
    );

    pageController.addListener(() {
      final v = pageController.page ?? kStart.toDouble();
      pageValue.value = v;
    });

    _auto = Timer.periodic(const Duration(milliseconds: 1800), (_) {
      if (pageController.positions.isNotEmpty) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void onClose() {
    _auto?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
