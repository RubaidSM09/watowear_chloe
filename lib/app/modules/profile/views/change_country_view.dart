import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/settings_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import 'package:watowear_chloe/common/custom_text_fields.dart';

class ChangeCountryView extends GetView<SettingsController> {
  const ChangeCountryView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Change Country',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 51.h,),

                Text(
                  'Select your country',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 18.25.sp,
                  ),
                ),

                SizedBox(height: 18.h,),

                CustomTextFiled(
                  hintText: 'Search a country here',
                  hintStyle: TextStyle(
                    color: AppColors.textIcons.withAlpha(179),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),

                SizedBox(height: 18.h,),

                Column(
                  spacing: 14.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.countries.map((country) {
                    return Text(
                      country,
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: 58.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
