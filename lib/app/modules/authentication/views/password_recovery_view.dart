import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/authentication/views/check_your_email_view.dart';

import '../../../../common/app_colors.dart';

class PasswordRecoveryView extends GetView {
  const PasswordRecoveryView({super.key});
  @override
  Widget build(BuildContext context) {
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
                  'Password Recovery',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),

                SizedBox(height: 39.h,),

                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email Address:',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
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
                        Get.back();
                        Get.dialog(CheckYourEmailView());
                      },
                      child: Text(
                        'CHANGE PASSWORD',
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
