import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../common/app_colors.dart';

class PrivacyPolicyView extends GetView {
  const PrivacyPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Privacy Policy',
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
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFDADADA),
              ),
            ),
            child: Text(
              ''
            ),
          ),
        ),
      ),
    );
  }
}
