import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:watowear_chloe/app/modules/about_yourself/views/about_yourself_3_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import 'package:watowear_chloe/common/custom_button.dart';

import '../controllers/about_yourself_controller.dart';
import 'about_yourself_1_view.dart';
import 'about_yourself_2_view.dart';
import 'about_yourself_4_view.dart';
import 'about_yourself_5_view.dart';
import 'about_yourself_6_view.dart';

class AboutYourselfView extends GetView<AboutYourselfController> {
  const AboutYourselfView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AboutYourselfController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {  },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  children: [
                    AboutYourself1View(),
                    AboutYourself2View(),
                    AboutYourself3View(),
                    AboutYourself4View(),
                    AboutYourself5View(),
                    AboutYourself6View(),
                  ],
                ),
              ),

              SizedBox(height: 20.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Obx(() => CustomButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: controller.current.value == 5 ? 74 : 148.w,
                      vertical: 12.h,
                    ),
                    text: controller.current.value == 5 ? 'Start Building my closet' : 'Next',
                    textColor: AppColors.bgColor,
                    textSize: 14.sp,
                    color: AppColors.primary,
                    onTap: () => controller.next(),
                  ),
                ),
              ),

              SizedBox(height: 16.h,),

              CustomButton(
                padding: EdgeInsets.symmetric(
                  horizontal: 148.w,
                  vertical: 12.h,
                ),
                text: 'Back',
                textColor: AppColors.primary,
                textSize: 14.sp,
                onTap: () => controller.back(),
              ),

              SizedBox(height: 20.h,),

              Obx(() {
                final idx = controller.current.value;
                return AnimatedSmoothIndicator(
                    activeIndex: idx,
                    count: 6,
                    effect: WormEffect(
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                      spacing: 8.w,
                      activeDotColor: AppColors.primary,
                      dotColor: Color(0xFFD9D4C9),
                    ),
                  );
              }),

              SizedBox(height: 18.h,),
            ],
          ),
      ),
    );
  }
}
