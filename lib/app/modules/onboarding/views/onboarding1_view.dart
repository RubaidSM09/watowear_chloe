import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class Onboarding1View extends GetView {
  const Onboarding1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/onboarding/onboarding1.png', fit: BoxFit.cover,),
        Positioned(
          top: 416.6.h,
          left: 67.w,
          child: Column(
            children: [
              Image.asset(
                'assets/images/onboarding/onboarding1Text.png',
                scale: 4,
                color: AppColors.primary,
              ),
              SizedBox(height: 4.h),
              Text(
                'Your personal AI stylist. Discover\noutfits that match your unique style.',
                style: TextStyle(color: Color(0xFFE5E7EB), fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: 'Comfortaa',),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
