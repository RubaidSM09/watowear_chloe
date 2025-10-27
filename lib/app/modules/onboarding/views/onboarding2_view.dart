import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import '../controllers/onboarding2_controller.dart';

class Onboarding2View extends GetView<Onboarding2Controller> {
  const Onboarding2View({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure controller is available (or bind it in your route binding)
    Get.lazyPut(() => Onboarding2Controller(), fenix: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 127.h),

        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Text(
            'Upload your wardrobe in\nseconds',
            style: TextStyle(
              color: AppColors.textIcons,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
            ),
          ),
        ),

        SizedBox(height: 28.h),

        // Carousel with reactive scaling
        SizedBox(
          height: 256.h,
          child: Obx(() {
            final pv = controller.pageValue.value;
            return PageView.builder(
              controller: controller.pageController,
              itemBuilder: (context, i) {
                final index = i % controller.items.length;

                // distance from center page
                final delta = (pv - i).abs();

                // Center = 1.0, sides ≈ 0.82 (tweak to taste)
                final scale = (1.0 - (delta * 0.35)).clamp(0.7, 1.0);
                final translateY = (1 - scale) * 60.h; // subtle lift

                return Transform.translate(
                  offset: Offset(0, translateY),
                  child: Transform.scale(
                    scale: scale,
                    alignment: Alignment.center,
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.asset(controller.items[index], scale: 4,),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),

        SizedBox(height: 150.h),

        // Body copy
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'Easily snap, upload, and organize your wardrobe in just seconds. Keep all your outfits in one place, anytime, anywhere.',
            style: TextStyle(
              color: AppColors.textIcons,
              fontFamily: 'Comfortaa',
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
