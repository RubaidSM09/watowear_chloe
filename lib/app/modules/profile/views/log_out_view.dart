import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/authentication/views/authentication_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../../../../common/custom_button.dart';

class LogOutView extends GetView {
  const LogOutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/onboarding/watowear_word_logo.png',
                  scale: 5,
                ),

                Text(
                  'You’ve stepped out of your closet.',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                ),

                SizedBox(height: 16.h,),

                Text(
                  'We’ll be right here when you’re ready to \nrediscover your style.',
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),

                SizedBox(height: 48.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h,),
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  text: 'Log back in',
                  textSize: 16.sp,
                  textColor: AppColors.bgColor,
                  onTap: () => Get.offAll(AuthenticationView()),
                ),

                SizedBox(height: 20.h,),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 9.h,
                      children: [
                        GestureDetector(
                          onTap: () {  },
                          child: Text(
                            'Need help?',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),

                        Text(
                          'Contact : contact@watowear.com',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
