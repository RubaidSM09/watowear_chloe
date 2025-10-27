import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_button.dart';

class PasswordUpdatedView extends GetView {
  const PasswordUpdatedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 28.h,),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(
                Icons.check,
                size: 49.r,
                color: Color(0xFF141B34),
              ),

              SizedBox(height: 15.h,),

              Text(
                'Password Updated',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),

              SizedBox(height: 5.h,),

              Text(
                'Your password has been updated successfully.',
                style: TextStyle(
                  color: AppColors.textIcons.withAlpha(128),
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
