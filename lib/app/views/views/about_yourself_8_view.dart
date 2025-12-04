import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/about_yourself/controllers/about_yourself_controller.dart';

import '../../../common/app_colors.dart';

class AboutYourself8View extends GetView<AboutYourselfController> {
  const AboutYourself8View({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h,),

              Text(
                'Your body preferences',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),

              SizedBox(height: 8.h,),

              Text(
                'Select areas you\'d like to highlight',
                style: TextStyle(
                  color: Color(0xFF1F1F1F).withOpacity(0.7),
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: 30.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 11.99.w,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.isHighlightSelected.value = true;
                    },
                    child: Container(
                      width: 170.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: controller.isHighlightSelected.value ? AppColors.primary : Colors.transparent,
                        border: controller.isHighlightSelected.value ? null : Border.all(
                          color: Color(0xFFB0B0B0),
                          width: 0.71.r,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Highlight',
                          style: TextStyle(
                            color: controller.isHighlightSelected.value ? Colors.white : Color(0xFF1F1F1F).withOpacity(0.7),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      controller.isHighlightSelected.value = false;
                    },
                    child: Container(
                      width: 170.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: !controller.isHighlightSelected.value ? AppColors.primary : Colors.transparent,
                        border: !controller.isHighlightSelected.value ? null : Border.all(
                          color: Color(0xFFB0B0B0),
                          width: 0.71.r,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Cover',
                          style: TextStyle(
                            color: !controller.isHighlightSelected.value ? Colors.white : Color(0xFF1F1F1F).withOpacity(0.7),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h,),
              
              Container(
                height: 548.34.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 37.39.w,
                  vertical: 36.25.h,
                ),
                color: Color(0xFFF9FAFB),
                child: Stack(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/about_yourself/body_preferences/women_body.svg',
                        // color: Colors.white,
                      ),
                    ),

                    BodyPreferencesMarkRight(
                      name: 'Neck',
                      left: 76,
                      top: 42.75,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}


class BodyPreferencesMarkRight extends StatelessWidget {
  final String name;
  final double left;
  final double top;

  const BodyPreferencesMarkRight({
    required this.name,
    required this.left,
    required this.top,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (98.61+left).w,
      top: top.h,
      child: Row(
        spacing: 6.w,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 66.w,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.7.r,
                )
            ),
          ),

          GestureDetector(
            onTap: () {  },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.5.w, vertical: 5.5.h,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.r),
                color: Colors.black.withOpacity(0.2),
              ),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
