import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:watowear_chloe/app/modules/authentication/views/check_your_email_view.dart';
import 'package:watowear_chloe/app/modules/authentication/views/password_updated_view.dart';

import '../../../../common/app_colors.dart';

class SetNewPasswordView extends GetView {
  final String email;
  final String otp;

  const SetNewPasswordView({
    required this.email,
    required this.otp,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    AuthenticationController c = Get.find<AuthenticationController>();

    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 61.h,),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set New Password',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),

              SizedBox(height: 39.h,),

              Obx(() => TextField(
                controller: c.newPasswordCtrl,
                  decoration: InputDecoration(
                    hintText: 'New Password:',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),

                    suffixIcon: GestureDetector(
                      onTap: () {
                        c.newPassObscureText.value = !c.newPassObscureText.value;
                      },
                      child: Icon(
                        c.newPassObscureText.value ? Icons.visibility_off_sharp : Icons.visibility_sharp,
                        color: Color(0xFFCDCDC0),
                      ),
                    ),
                  ),

                  obscureText: c.newPassObscureText.value,
                ),
              ),

              SizedBox(height: 39.h,),

              Obx(() => TextField(
                controller: c.confirmNewPasswordCtrl,
                  decoration: InputDecoration(
                    hintText: 'Confirm New Password:',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),

                    suffixIcon: GestureDetector(
                      onTap: () {
                        c.confirmNewPassObscureText.value = !c.confirmNewPassObscureText.value;
                      },
                      child: Icon(
                        c.confirmNewPassObscureText.value ? Icons.visibility_off_sharp : Icons.visibility_sharp,
                        color: Color(0xFFCDCDC0),
                      ),
                    ),
                  ),

                  obscureText: c.confirmNewPassObscureText.value,
                ),
              ),

              SizedBox(height: 61.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      if (c.newPasswordCtrl.text.trim() == c.confirmNewPasswordCtrl.text.trim()) {
                        c.resetPassword(email, otp, c.newPasswordCtrl.text.trim());
                      } else {
                        Get.snackbar('Error', 'New Password and Confirm New Password must be same');
                      }
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
