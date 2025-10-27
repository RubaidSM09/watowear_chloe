import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/authentication/views/authentication_view.dart';
import 'package:watowear_chloe/common/custom_button.dart';

import '../../../../common/app_colors.dart';

class Onboarding5View extends GetView {
  const Onboarding5View({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 17.w,
                right: 17.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/onboarding/watowear_word_logo.png',
                    scale: 6,
                  ),
        
                  SizedBox(height: 30.76.h,),
        
                  Text(
                    'Create your account and start',
                    style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp
                    ),
                  ),
        
                  SizedBox(height: 7.h,),
        
                  Text(
                    'Unlock all the amazing outfit ideas in\nyour wardrobe by signing up.',
                    style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp
                    ),
                  ),
        
                  SizedBox(height: 20.h,),
        
                  Row(
                    spacing: 20.w,
                    children: [
                      CustomButton(
                        text: 'Create Account',
                        padding: EdgeInsets.symmetric(
                          horizontal: 35.w,
                          vertical: 12.h,
                        ),
                        textColor: AppColors.textIcons,
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                        textSize: 14.sp,
                        onTap: () => Get.to(AuthenticationView()),
                      ),
        
                      CustomButton(
                        text: 'Sign In',
                        padding: EdgeInsets.symmetric(
                          horizontal: 65.w,
                          vertical: 12.h,
                        ),
                        textColor: AppColors.bgColor,
                        color: AppColors.primary,
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                        textSize: 14.sp,
                        onTap: () => Get.to(AuthenticationView()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        
            SizedBox(height: 30.h,),
        
            Positioned.fill(
              child: Image.asset(
                'assets/images/onboarding/onboarding_5_updated.png',
                scale: 4,
              ),
            )
          ],
        ),
      );
  }
}
