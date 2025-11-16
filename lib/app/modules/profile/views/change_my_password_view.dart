import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/profile_controller.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_button.dart';
import '../../../../common/custom_text_fields.dart';

class ChangeMyPasswordView extends GetView<ProfileController> {
  const ChangeMyPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    AuthenticationController authController = Get.put(AuthenticationController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Change My Password',
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
                  'Enter your current password',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 24.h,),

                Obx(() => CustomTextFiled(
                    controller: authController.currentPasswordCtrl,
                    padding: EdgeInsets.all(16.r),
                    hintText: 'Your password',
                    hintStyle: TextStyle(
                      color: AppColors.textIcons.withAlpha(179),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.obscureText3.value = !controller.obscureText3.value;
                      },
                      child: Icon(
                        controller.obscureText3.value ? Icons.visibility_off_sharp : Icons.visibility_sharp,
                        color: Color(0xFFCDCDC0),
                      ),
                    ),
                    obscureText: controller.obscureText3.value,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.textIcons
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),

                SizedBox(height: 52.h,),

                Text(
                  'Enter your new password',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 24.h,),

                Obx(() => CustomTextFiled(
                    controller: authController.newPasswordCtrl,
                    padding: EdgeInsets.all(16.r),
                    hintText: 'Your new password',
                    hintStyle: TextStyle(
                      color: AppColors.textIcons.withAlpha(179),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.obscureText4.value = !controller.obscureText4.value;
                      },
                      child: Icon(
                        controller.obscureText4.value ? Icons.visibility_off_sharp : Icons.visibility_sharp,
                        color: Color(0xFFCDCDC0),
                      ),
                    ),
                    obscureText: controller.obscureText4.value,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.textIcons
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),

                SizedBox(height: 24.h,),

                Obx(() => CustomTextFiled(
                    controller: authController.confirmNewPasswordCtrl,
                    padding: EdgeInsets.all(16.r),
                    hintText: 'Confirm your password',
                    hintStyle: TextStyle(
                      color: AppColors.textIcons.withAlpha(179),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.obscureText5.value = !controller.obscureText5.value;
                      },
                      child: Icon(
                        controller.obscureText5.value ? Icons.visibility_off_sharp : Icons.visibility_sharp,
                        color: Color(0xFFCDCDC0),
                      ),
                    ),
                    obscureText: controller.obscureText5.value,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.textIcons
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),

                SizedBox(height: 78.h,),

                CustomButton(
                  text: 'Change Password',
                  textSize: 16.sp,
                  textColor: AppColors.bgColor,
                  color: AppColors.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  onTap: () {
                    if (authController.newPasswordCtrl.text.trim() == authController.confirmNewPasswordCtrl.text.trim()) {
                      authController.changePassword(
                        authController.currentPasswordCtrl.text.trim(),
                        authController.newPasswordCtrl.text.trim(),
                      );
                    } else {
                      Get.snackbar('Error', 'New Password and Confirm New Password must be same');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
