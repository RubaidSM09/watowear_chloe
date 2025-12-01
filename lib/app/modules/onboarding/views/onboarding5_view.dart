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
              left: 24.w,
              right: 24.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/onboarding/wtw_word_logo_2.png',
                  scale: 4,
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
                    Expanded(
                      child: CustomButton(
                        text: 'Create Account',
                        padding: EdgeInsets.symmetric(
                          // horizontal: 35.w,
                          vertical: 12.h,
                        ),
                        textColor: AppColors.textIcons,
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                        textSize: 14.sp,
                        onTap: () => Get.to(AuthenticationView()),
                      ),
                    ),

                    Expanded(
                      child: CustomButton(
                        text: 'Sign In',
                        padding: EdgeInsets.symmetric(
                          // horizontal: 48.w,
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
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 30.h,),

          // ---- FIX: don't use Positioned.fill inside Column ----
          // Use a container (or Align) to display the image instead.
          SizedBox(
            width: double.infinity,
            // keep same visual scale/size as before; adjust height if needed
            child: Image.asset(
              'assets/images/onboarding/onboarding_5_updated.png',
              scale: 4,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
