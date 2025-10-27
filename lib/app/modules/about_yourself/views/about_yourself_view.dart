import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import 'package:watowear_chloe/common/custom_button.dart';

import '../controllers/about_yourself_controller.dart';
import 'about_yourself_1_view.dart';
import 'about_yourself_2_view.dart';

class AboutYourselfView extends GetView<AboutYourselfController> {
  const AboutYourselfView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AboutYourselfController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {  },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
            children: [
              Expanded(
                child: PageView(
                  children: [
                    AboutYourself1View(),
                    AboutYourself2View(),
                  ],
                ),
              ),

              SizedBox(height: 20.h,),

              CustomButton(
                padding: EdgeInsets.symmetric(
                  horizontal: 148.w,
                  vertical: 12.h,
                ),
                text: 'Next',
                textColor: AppColors.bgColor,
                textSize: 14.sp,
                color: AppColors.primary,
                onTap: () {  },
              ),

              SizedBox(height: 16.h,),

              CustomButton(
                padding: EdgeInsets.symmetric(
                  horizontal: 148.w,
                  vertical: 12.h,
                ),
                text: 'Back',
                textColor: AppColors.primary,
                textSize: 14.sp,
                onTap: () {  },
              ),

              SizedBox(height: 20.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8.w,
                children: [
                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: Color(0xFFCDCDC0),
                      shape: BoxShape.circle,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: Color(0xFFCDCDC0),
                      shape: BoxShape.circle,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: Color(0xFFCDCDC0),
                      shape: BoxShape.circle,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: Color(0xFFCDCDC0),
                      shape: BoxShape.circle,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: Color(0xFFCDCDC0),
                      shape: BoxShape.circle,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: Color(0xFFCDCDC0),
                      shape: BoxShape.circle,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: Color(0xFFCDCDC0),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 18.h,),
            ],
          ),
      ),
    );
  }
}
