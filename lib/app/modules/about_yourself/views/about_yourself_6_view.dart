import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class AboutYourself6View extends GetView {
  const AboutYourself6View({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/onboarding/chloe_2.png',
            scale: 4,
          ),

          SizedBox(height: 65.h,),

          Row(
            children: [
              Text(
                'Amazing Thanks for Sharing!',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h,),

          Row(
            children: [
              Text(
                'This helps me adapt suggestions as your\nstyle evolves.',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
