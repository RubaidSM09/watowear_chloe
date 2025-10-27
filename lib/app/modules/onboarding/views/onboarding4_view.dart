import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class Onboarding4View extends GetView {
  const Onboarding4View({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
            top: 127.h,
            left: 25.w,
            child: SizedBox(
              width: 392.w,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Get Personalized Outfit\nSuggestions',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.black,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w700,
                            fontSize: 24.sp
                        ),
                        // style: titleStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 21.h),
                  Image.asset('assets/images/onboarding/onboarding_4_updated.png', height: 446.h, width: 320.w,),
                  SizedBox(height: 25.h),
                  Text(
                    'AI-powered styling just for you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textIcons,
                      fontFamily: 'Comfortaa',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 341.w,
                    child: Text(
                      'Based on your mood, occasion, and personal style preferences.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.textIcons,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Comfortaa'
                      ),
                      // style: bodyStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
    );
  }
}
