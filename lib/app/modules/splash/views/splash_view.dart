import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../common/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: controller.anim,
            builder: (_, __) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  // Phase 1: Circular logo (scale + fade out)
                  /*Opacity(
                    opacity: controller.circleFade.value,
                    child: Transform.scale(
                      scale: controller.circleScale.value,
                      child: SvgPicture.asset(
                        'assets/images/onboarding/watowear_circular_logo.svg',
                        width: 146.w,
                        height: 156.h,
                      ),
                    ),
                  ),*/

                  // Phase 2: Wordmark (fade in)
                  Opacity(
                    opacity: controller.wordFade.value,
                    child: Image.asset(
                      'assets/images/onboarding/watowear_word_logo.png',
                      // width/height optional; the SVG can be sized by intrinsic viewBox
                      scale: 4,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
