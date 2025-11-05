import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/settings_controller.dart';
import 'package:watowear_chloe/common/custom_button.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_text_fields.dart';

class PrivacyPreferenceCenterView extends GetView<SettingsController> {
  const PrivacyPreferenceCenterView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Privacy Preference Center',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 54.h,),

                Text(
                  'We use cookies and similar technologies to ensure your experience feels effortless, personal, and seamless.  Their purpose? To make your browsing smoother, enhance our services, and refine our platform so that every interaction feels tailored to you. Some cookies are essential,  they keep everything running beautifully. Others help us understand how you use the platform or bring you more relevant experiences and style inspiration across our channels. You can customise your preferences below at any time. For full details, please see our Cookies Policy.',
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),

                SizedBox(height: 40.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      padding: EdgeInsets.symmetric(horizontal: 54.w, vertical: 16.h,),
                      border: Border.all(
                        color: AppColors.textIcons,
                        width: 1.04.r,
                      ),
                      text: 'Allow All',
                      textSize: 16.sp,
                      textColor: AppColors.textIcons,
                      onTap: () {  },
                    ),

                    CustomButton(
                      padding: EdgeInsets.symmetric(horizontal: 54.w, vertical: 16.h,),
                      border: Border.all(
                        color: AppColors.textIcons,
                        width: 1.04.r,
                      ),
                      text: 'Reject All',
                      textSize: 16.sp,
                      textColor: AppColors.textIcons,
                      onTap: () {  },
                    ),
                  ],
                ),

                SizedBox(height: 30.h,),

                Text(
                  'Manage Your Preferences',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 54.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 232.w,
                      child: Text(
                        'Strictly Necessary Cookies',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),

                    Row(
                      spacing: 5.w,
                      children: [
                        Text(
                          'Always Active',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {  },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.r,
                            color: AppColors.primary,
                          ),
                        )
                      ],
                    )
                  ],
                ),

                SizedBox(height: 18.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 232.w,
                      child: Text(
                        'Functionality & Customisation Cookies',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),

                    Row(
                      spacing: 5.w,
                      children: [
                        Image.asset(
                          'assets/images/profile/settings/cookies_bar.png',
                          scale: 4,
                        ),

                        GestureDetector(
                          onTap: () {  },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.r,
                            color: AppColors.primary,
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 18.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 232.w,
                      child: Text(
                        'Analysis Cookies',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),

                    Row(
                      spacing: 5.w,
                      children: [
                        Image.asset(
                          'assets/images/profile/settings/cookies_bar.png',
                          scale: 4,
                        ),

                        GestureDetector(
                          onTap: () {  },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.r,
                            color: AppColors.primary,
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 18.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 232.w,
                      child: Text(
                        'Advertising Cookies',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),

                    Row(
                      spacing: 5.w,
                      children: [
                        Image.asset(
                          'assets/images/profile/settings/cookies_bar.png',
                          scale: 4,
                        ),

                        GestureDetector(
                          onTap: () {  },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.r,
                            color: AppColors.primary,
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 166.h,),

                Divider(color: Color(0xFFDADADA), thickness: 0.5.r,),

                SizedBox(height: 46.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h),
                  color: AppColors.primary,
                  textColor: Colors.white,
                  textSize: 16.sp,
                  text: 'Confirm Choices',
                  onTap: () {  },
                ),

                SizedBox(height: 107.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
