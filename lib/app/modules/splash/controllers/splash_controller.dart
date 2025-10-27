import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/home/views/home_view.dart';
import 'package:watowear_chloe/app/modules/onboarding/views/onboarding_view.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController anim;

  // Animations
  late final Animation<double> circleScale;
  late final Animation<double> circleFade;
  late final Animation<double> wordFade;

  @override
  void onInit() {
    super.onInit();

    anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3600),
    );

    // Phase 1 (0.00–0.65): scale up then down
    circleScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.85, end: 1.12).chain(CurveTween(curve: Curves.easeOut)), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.12, end: 0.96).chain(CurveTween(curve: Curves.easeIn)),  weight: 50),
    ]).animate(CurvedAnimation(parent: anim, curve: const Interval(0.0, 0.65)));

    // Fade the circle out (0.65–0.85)
    circleFade = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: anim, curve: const Interval(0.65, 0.85, curve: Curves.easeOut)),
    );

    // Phase 2 (0.75–1.00): wordmark fades in
    wordFade = CurvedAnimation(
      parent: anim,
      curve: const Interval(0.75, 1.0, curve: Curves.easeIn),
    );

    anim.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goNext();
      }
    });

    anim.forward();
  }

  Future<void> _goNext() async {
    // TODO: replace with real auth/init checks if needed
    final bool isLoggedIn = await _fakeAuthCheck();
    if (isLoggedIn) {
      Get.offAll(() => HomeView());
    } else {
      Get.offAll(() => OnboardingView());
    }
  }

  Future<bool> _fakeAuthCheck() async => false;

  @override
  void onClose() {
    anim.dispose();
    super.onClose();
  }
}
