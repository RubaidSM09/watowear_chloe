import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/profile_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../../../../common/custom_button.dart';
import '../../../../common/custom_text_fields.dart';

class ModifyEmailView extends GetView<ProfileController> {
  const ModifyEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Modify Email',
          style: TextStyle(
            color: AppColors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your new email',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'Current password*',
                  hintStyle: TextStyle(
                    color: AppColors.textIcons.withAlpha(179),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.obscureText.value = !controller.obscureText.value;
                    },
                    child: Icon(
                      controller.obscureText.value ? Icons.visibility_off_sharp : Icons.visibility_sharp,
                      color: Color(0xFFCDCDC0),
                    ),
                  ),
                  obscureText: controller.obscureText.value,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'New email*',
                  hintStyle: TextStyle(
                    color: Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'repeat email*',
                  hintStyle: TextStyle(
                    color: Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 78.h,),

                CustomButton(
                  text: 'Update email',
                  textSize: 16.sp,
                  textColor: AppColors.bgColor,
                  color: AppColors.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  onTap: () => Get.back(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
