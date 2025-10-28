import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../controllers/about_yourself_controller.dart';

class AboutYourself5View extends GetView<AboutYourselfController> {
  const AboutYourself5View({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Whose style inspires you?',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
              ),
            ),

            SizedBox(height: 13.h,),

            Text(
              'I’ll keep them in mind.',
              style: TextStyle(
                color: AppColors.textIcons.withAlpha(128),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),

            SizedBox(height: 23.h,),

            Row(
              spacing: 17.w,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.isMen.value = true;
                  },
                  child: Text(
                    'Men',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Comfortaa',
                      fontWeight: controller.isMen.value ? FontWeight.w900 : FontWeight.w600,
                      fontSize: controller.isMen.value ? 18.sp : 14.sp,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    controller.isMen.value = false;
                  },
                  child: Text(
                    'Women',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Comfortaa',
                      fontWeight: !controller.isMen.value ? FontWeight.w900 : FontWeight.w600,
                      fontSize: !controller.isMen.value ? 18.sp : 14.sp,
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 57.h,),

            Column(
              spacing: 90.h,
              children: [
                IntrinsicHeight(
                  child: Row(
                    spacing: 18.w,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isMen.value ? controller.selectMenStyles(0) : controller.selectWomenStyles(0);
                        },
                        child: Container(
                          width: 185.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 13.w,
                            vertical: 54.h,
                          ),
                          color: controller.isMen.value
                              ?
                          controller.selectedMenStyles[0].value
                              ?
                          AppColors.primary : Colors.black
                              :
                          controller.selectedWomenStyles[0].value
                              ?
                          AppColors.primary : Colors.black,
                              
                          child: Column(
                            spacing: 12.h,
                            children: [
                              Text(
                                controller.isMen.value ? controller.menStyles[0].name : controller.womenStyles[0].name,
                                style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              Text(
                                controller.isMen.value ? controller.menStyles[0].description : controller.womenStyles[0].description,
                                style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                              
                      GestureDetector(
                        onTap: () {
                          controller.isMen.value ? controller.selectMenStyles(1) : controller.selectWomenStyles(1);
                        },
                        child: Container(
                          width: 185.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 13.w,
                            vertical: 54.h,
                          ),
                          color: controller.isMen.value
                              ?
                          controller.selectedMenStyles[1].value
                              ?
                          AppColors.primary : Colors.black
                              :
                          controller.selectedWomenStyles[1].value
                              ?
                          AppColors.primary : Colors.black,
                              
                          child: Column(
                            spacing: 12.h,
                            children: [
                              Text(
                                controller.isMen.value ? controller.menStyles[1].name : controller.womenStyles[1].name,
                                style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              Text(
                                controller.isMen.value ? controller.menStyles[1].description : controller.womenStyles[1].description,
                                style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            
                IntrinsicHeight(
                  child: Row(
                    spacing: 18.w,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isMen.value ? controller.selectMenStyles(2) : controller.selectWomenStyles(2);
                        },
                        child: Container(
                          width: 185.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 13.w,
                            vertical: 54.h,
                          ),
                          color: controller.isMen.value
                              ?
                          controller.selectedMenStyles[2].value
                              ?
                          AppColors.primary : Colors.black
                              :
                          controller.selectedWomenStyles[2].value
                              ?
                          AppColors.primary : Colors.black,
                              
                          child: Column(
                            spacing: 12.h,
                            children: [
                              Text(
                                controller.isMen.value ? controller.menStyles[2].name : controller.womenStyles[2].name,
                                style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              Text(
                                controller.isMen.value ? controller.menStyles[2].description : controller.womenStyles[2].description,
                                style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                              
                      GestureDetector(
                        onTap: () {
                          controller.isMen.value ? controller.selectMenStyles(3) : controller.selectWomenStyles(3);
                        },
                        child: Container(
                          width: 185.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 13.w,
                            vertical: 54.h,
                          ),
                          color: controller.isMen.value
                              ?
                          controller.selectedMenStyles[3].value
                              ?
                          AppColors.primary : Colors.black
                              :
                          controller.selectedWomenStyles[3].value
                              ?
                          AppColors.primary : Colors.black,
                              
                          child: Column(
                            spacing: 12.h,
                            children: [
                              Text(
                                controller.isMen.value ? controller.menStyles[3].name : controller.womenStyles[3].name,
                                style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              Text(
                                controller.isMen.value ? controller.menStyles[3].description : controller.womenStyles[3].description,
                                style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            
                IntrinsicHeight(
                  child: Row(
                    spacing: 18.w,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isMen.value ? controller.selectMenStyles(4) : controller.selectWomenStyles(4);
                        },
                        child: Container(
                          width: 185.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 13.w,
                            vertical: 54.h,
                          ),
                          color: controller.isMen.value
                              ?
                          controller.selectedMenStyles[4].value
                              ?
                          AppColors.primary : Colors.black
                              :
                          controller.selectedWomenStyles[4].value
                              ?
                          AppColors.primary : Colors.black,
                              
                          child: Column(
                            spacing: 12.h,
                            children: [
                              Text(
                                controller.isMen.value ? controller.menStyles[4].name : controller.womenStyles[4].name,
                                style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              Text(
                                controller.isMen.value ? controller.menStyles[4].description : controller.womenStyles[4].description,
                                style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                              
                      GestureDetector(
                        onTap: () {
                          controller.isMen.value ? controller.selectMenStyles(5) : controller.selectWomenStyles(5);
                        },
                        child: Container(
                          width: 185.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 13.w,
                            vertical: 54.h,
                          ),
                          color: controller.isMen.value
                              ?
                          controller.selectedMenStyles[5].value
                              ?
                          AppColors.primary : Colors.black
                              :
                          controller.selectedWomenStyles[5].value
                              ?
                          AppColors.primary : Colors.black,
                              
                          child: Column(
                            spacing: 12.h,
                            children: [
                              Text(
                                controller.isMen.value ? controller.menStyles[5].name : controller.womenStyles[5].name,
                                style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              Text(
                                controller.isMen.value ? controller.menStyles[5].description : controller.womenStyles[5].description,
                                style: TextStyle(
                                  color: AppColors.bgColor,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
