import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/profile_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../../../../common/custom_button.dart';
import '../../../../common/custom_text_fields.dart';
import '../../../../common/widget/otp_field/otp_controller.dart';
import '../../../../common/widget/otp_field/otp_field.dart';
import '../../authentication/controllers/authentication_controller.dart';

class ModifyEmailView extends StatelessWidget {
  const ModifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    // Use AuthenticationController for form fields + logic
    final auth = Get.find<AuthenticationController>();

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
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Obx(() {
              return Column(
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

                  SizedBox(height: 24.h),

                  // CURRENT PASSWORD
                  CustomTextFiled(
                    controller: auth.currentPasswordCtrl,
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
                        auth.obscureText.value = !auth.obscureText.value;
                      },
                      child: Icon(
                        auth.obscureText.value
                            ? Icons.visibility_off_sharp
                            : Icons.visibility_sharp,
                        color: const Color(0xFFCDCDC0),
                      ),
                    ),
                    obscureText: auth.obscureText.value,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textIcons),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // NEW EMAIL
                  CustomTextFiled(
                    controller: auth.newEmailCtrl,
                    padding: EdgeInsets.all(16.r),
                    hintText: 'New email*',
                    hintStyle: TextStyle(
                      color: const Color(0xFF4B5563),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textIcons),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // REPEAT EMAIL
                  CustomTextFiled(
                    controller: auth.repeatNewEmailCtrl,
                    padding: EdgeInsets.all(16.r),
                    hintText: 'Repeat email*',
                    hintStyle: TextStyle(
                      color: const Color(0xFF4B5563),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textIcons),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),

                  SizedBox(height: 78.h),

                  // SUBMIT BUTTON
                  CustomButton(
                    text: auth.isLoading.value ? 'Please wait...' : 'Update email',
                    textSize: 16.sp,
                    textColor: AppColors.bgColor,
                    color: AppColors.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 48.w,
                      vertical: 12.h,
                    ),
                    onTap: auth.isLoading.value
                        ? null
                        : () async {
                      final currentPassword =
                      auth.currentPasswordCtrl.text.trim();
                      final newEmail = auth.newEmailCtrl.text.trim();
                      final repeatEmail =
                      auth.repeatNewEmailCtrl.text.trim();

                      if (currentPassword.isEmpty ||
                          newEmail.isEmpty ||
                          repeatEmail.isEmpty) {
                        Get.snackbar(
                          'Missing data',
                          'Please fill all the fields.',
                        );
                        return;
                      }

                      if (newEmail != repeatEmail) {
                        Get.snackbar(
                          'Email mismatch',
                          'New email and repeat email do not match.',
                        );
                        return;
                      }

                      // ✅ Call the API via AuthenticationController
                      await auth.modifyEmail(currentPassword, newEmail);
                      // On success, your modifyEmail() will show MailVerificationView
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}


class MailVerificationView extends StatelessWidget {
  const MailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final otpController = Get.put(OtpController(otpLength: 6));
    final auth = Get.find<AuthenticationController>();

    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 57.h),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Check your email',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),

              SizedBox(height: 35.h),

              Text(
                'We’ve sent you a code to verify your email. Please enter it below.',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 33.h),

              Row(
                children: [
                  OtpField(
                    boxWidth: 35.w,
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),

                  GestureDetector(
                    onTap: () async {
                      // Read the OTP from your OtpController
                      final code = otpController.otp; // adjust if your controller uses a different getter

                      if (code == null || code.toString().length != 6) {
                        Get.snackbar(
                          'Invalid OTP',
                          'Please enter the 6-digit code.',
                        );
                        return;
                      }

                      // ✅ Call verify API
                      await auth.verifyOtpModifyEmail(code.toString());
                      // On success, your AuthenticationController.verifyOtpModifyEmail()
                      // already does: snackbar + Get.back() + onClose()
                    },
                    child: Text(
                      'CONFIRM',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
