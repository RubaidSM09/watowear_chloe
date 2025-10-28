import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../common/app_colors.dart';
import '../controllers/about_yourself_controller.dart';

class AboutYourself3View extends GetView<AboutYourselfController> {
  const AboutYourself3View({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do you want to stay in your comfort zone, or try new things?',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
              ),
            ),

            SizedBox(height: 12.h),

            Text(
              'I can keep it safe, or we can explore some fresh ideas together.',
              style: TextStyle(
                color: AppColors.textIcons.withAlpha(128),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),

            SizedBox(height: 67.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Safe',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                    ),

                    Text(
                      'Stay with what you know',
                      style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: () {
                    controller.selectComfortZone(0);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.textIcons),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.selectedComfortZone[0].value ? AppColors.textIcons : Colors.transparent,
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 40.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'A bit adventurous',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                    ),

                    Text(
                      'Mix familiar with new',
                      style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: () {
                    controller.selectComfortZone(1);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.textIcons),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.selectedComfortZone[1].value ? AppColors.textIcons : Colors.transparent,
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 40.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Surprise me!',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                    ),

                    Text(
                      'I\'m ready for anything',
                      style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: () {
                    controller.selectComfortZone(2);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.textIcons),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.selectedComfortZone[2].value ? AppColors.textIcons : Colors.transparent,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
