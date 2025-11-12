import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/authentication/views/account_created_view.dart';
import 'package:watowear_chloe/app/modules/authentication/views/password_recovery_view.dart';
import 'package:watowear_chloe/app/modules/dashboard/views/dashboard_view.dart';
import 'package:watowear_chloe/common/custom_button.dart';
import 'package:watowear_chloe/common/custom_text_fields.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/widget/otp_field/otp_controller.dart';
import '../../../../common/widget/otp_field/otp_field.dart';
import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Sign in/ Create Account',
          style: TextStyle(
            color: AppColors.textIcons,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 62.5.h,),

              !controller.isSignIn.value ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    icon: 'assets/images/authentication/google_logo.png',
                    padding: EdgeInsets.symmetric(horizontal: 83.12.w, vertical: 13.21.h,),
                    border: Border.all(
                      color: AppColors.textIcons,
                      width: 1.04.r,
                    ),
                    onTap: () {  },
                  ),
                  CustomButton(
                    icon: 'assets/images/authentication/apple_logo.png',
                    padding: EdgeInsets.symmetric(horizontal: 83.12.w, vertical: 13.21.h,),
                    border: Border.all(
                      color: AppColors.textIcons,
                      width: 1.04.r,
                    ),
                    onTap: () {  },
                  ),
                ],
              ) : SizedBox.shrink(),

              !controller.isSignIn.value ? SizedBox(height: 34.h,) : SizedBox.shrink(),

              Column(
                spacing: 31.h,
                children: [
                  Row(
                    spacing: 8.w,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isSignIn.value = !controller.isSignIn.value;
                        },
                        child: Container(
                          padding: EdgeInsets.all(7.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primary,
                            )
                          ),
                          child: Container(
                            padding: EdgeInsets.all(5.5.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.isSignIn.value ? AppColors.primary : Colors.transparent,
                            ),
                          ),
                        ),
                      ),

                      Text(
                        'I have an account',
                        style: TextStyle(
                          color: AppColors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.57.sp,
                        ),
                      )
                    ],
                  ),

                  Row(
                    spacing: 8.w,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isSignIn.value = !controller.isSignIn.value;
                        },
                        child: Container(
                          padding: EdgeInsets.all(7.r),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.primary,
                              )
                          ),
                          child: Container(
                            padding: EdgeInsets.all(5.5.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: !controller.isSignIn.value ? AppColors.primary : Colors.transparent,
                            ),
                          ),
                        ),
                      ),

                      Text(
                        'I want to register for an account',
                        style: TextStyle(
                          color: AppColors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.57.sp,
                        ),
                      )
                    ],
                  ),
                ],
              ),

              SizedBox(height: 30.h,),

              Column(
                spacing: 16.h,
                children: [
                  CustomTextFiled(
                    controller: controller.emailCtrl,
                    padding: EdgeInsets.all(16.r),
                    hintText: 'Email Address',
                    hintStyle: TextStyle(
                      color: Color(0xFF4B5563),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.textIcons
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),

                  CustomTextFiled(
                    controller: controller.passwordCtrl,
                    padding: EdgeInsets.all(16.r),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Color(0xFF4B5563),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
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
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.textIcons
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),

                  ?!controller.isSignIn.value ? CustomTextFiled(
                    controller: controller.nameCtrl,
                    padding: EdgeInsets.all(16.r),
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      color: Color(0xFF4B5563),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.textIcons
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                  ) : null,

                  ?!controller.isSignIn.value ? CustomTextFiled(
                    controller: controller.surnameCtrl,
                    padding: EdgeInsets.all(16.r),
                    hintText: 'Surname',
                    hintStyle: TextStyle(
                      color: Color(0xFF4B5563),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.textIcons
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                  ) : null,
                ],
              ),

              SizedBox(height: 12.h,),

              Column(
                spacing: 12.h,
                children: [
                  ?!controller.isSignIn.value ? Row(
                    spacing: 7.w,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isSelected2.value = !controller.isSelected2.value;
                        },
                        child: Icon(
                          controller.isSelected2.value ? Icons.check_box_rounded : Icons.check_box_outline_blank_outlined,
                          size: 20.r,
                          color: AppColors.black,
                        ),
                      ),

                      Text(
                        'I agree to the Terms & Conditions and Privacy Policy',
                        style: TextStyle(
                          color: AppColors.textIcons,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  ) : null,

                  ?!controller.isSignIn.value ? Row(
                    spacing: 7.w,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isSelected3.value = !controller.isSelected3.value;
                        },
                        child: Icon(
                          controller.isSelected3.value ? Icons.check_box_rounded : Icons.check_box_outline_blank_outlined,
                          size: 20.r,
                          color: AppColors.black,
                        ),
                      ),

                      Text(
                        'Receive news, updates, and special offers.',
                        style: TextStyle(
                          color: AppColors.textIcons,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  ) : null,

                  ?controller.isSignIn.value ? Row(
                    spacing: 7.w,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isSelected1.value = !controller.isSelected1.value;
                        },
                        child: Icon(
                          controller.isSelected1.value ? Icons.check_box_rounded : Icons.check_box_outline_blank_outlined,
                          size: 20.r,
                          color: AppColors.black,
                        ),
                      ),

                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: AppColors.textIcons,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  ) : null,
                ],
              ),

              SizedBox(height: 71.h,),

              !controller.isSignIn.value ? CustomButton(
                text: 'Create Account',
                textSize: 14.sp,
                textColor: AppColors.bgColor,
                color: AppColors.primary,
                padding: EdgeInsets.symmetric(
                  horizontal: 120.w,
                  vertical: 12.h,
                ),
                onTap: () {
                  controller.signUp(
                    controller.emailCtrl.text.trim(),
                    controller.passwordCtrl.text.trim(),
                    controller.nameCtrl.text.trim(),
                    controller.surnameCtrl.text.trim(),
                  );
                },
              ) : CustomButton(
                text: 'Sign In',
                textSize: 14.sp,
                textColor: AppColors.bgColor,
                color: AppColors.primary,
                padding: EdgeInsets.symmetric(
                  horizontal: 150.w,
                  vertical: 12.h,
                ),
                onTap: () => Get.offAll(DashboardView()),
              ),

              controller.isSignIn.value ? SizedBox(height: 6.h,) : SizedBox.shrink(),

              controller.isSignIn.value ? Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.dialog(PasswordRecoveryView()),
                    child: Text(
                      '   Forgotten your Password?',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ) : SizedBox.shrink(),
            ],
          ),
        ),
      )),
    );
  }
}


class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key, required this.email}); // ADD
  final String email; // ADD

  @override
  Widget build(BuildContext context) {
    final otpController = Get.put(OtpController(otpLength: 6));
    final auth = Get.find<AuthenticationController>(); // ADD

    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 57.h,),
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

              SizedBox(height: 35.h,),

              Text(
                'We’ve sent you a code to verify your email. Please enter it below.',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 33.h,),

              Row(
                children: [
                  OtpField(
                    boxWidth: 35.w,
                  ),
                ],
              ),

              SizedBox(height: 30.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox.shrink(),

                  GestureDetector(
                    onTap: () async {
                      // READ the OTP from your OtpController
                      // NOTE: replace `.text` with the correct getter if your OtpController exposes a different one.
                      final code = otpController.otp; // <-- if your controller uses .code/.value, use that instead
                      if (code == null || code.toString().length != 6) {
                        Get.snackbar('Invalid OTP', 'Please enter the 6-digit code.');
                        return;
                      }
                      await auth.otpVerification(email, code.toString());
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
