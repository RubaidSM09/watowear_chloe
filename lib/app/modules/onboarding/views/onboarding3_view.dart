import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class Onboarding3View extends GetView {
  const Onboarding3View({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
            top: 232.6.h,
            left: 57.w,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/onboarding/chloe_2.png',
                  fit: BoxFit.cover,
                  scale: 4,
                ),
                SizedBox(height: 56.h),
                Text(
                  'Meet Chloé',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.black,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp
                  ),
                  // style: titleStyle,
                ),
                SizedBox(height: 6.h),
                Text(
                  'Your personal style coach',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textIcons,
                    fontFamily: 'Comfortaa',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 31.5.h),
                SizedBox(
                  width: 341.w,
                  child: Text(
                    'Chloé, is your personal stylist and style BFF. She learns what you love and helps you wear it in new ways.',
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
        ]
    );
  }
}
