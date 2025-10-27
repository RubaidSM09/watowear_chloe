import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/authentication/views/set_new_password_view.dart';
import 'package:watowear_chloe/common/widget/otp_field/otp_controller.dart';
import 'package:watowear_chloe/common/widget/otp_field/otp_field.dart';

import '../../../../common/app_colors.dart';

class CheckYourEmailView extends GetView {
  const CheckYourEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    final otpController = Get.put(OtpController(otpLength: 4));

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
                'We’ve sent you a code to reset your password. Please enter it below.',
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
                  OtpField(),
                ],
              ),

              SizedBox(height: 30.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox.shrink(),

                  GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.dialog(SetNewPasswordView());
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
