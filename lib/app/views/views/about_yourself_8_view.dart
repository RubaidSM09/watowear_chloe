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

              if (controller.selectedGender[2].value)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12.w,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.isWomenSelected2.value = true;
                      },
                      child: Container(
                        width: 127.w,
                        height: 43.h,
                        decoration: BoxDecoration(
                          color: controller.isWomenSelected2.value ? AppColors.primary : Colors.transparent,
                          border: controller.isWomenSelected2.value ? null : Border.all(
                            color: Color(0xFFB0B0B0),
                            width: 0.71.r,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Women',
                            style: TextStyle(
                              color: controller.isWomenSelected2.value ? Colors.white : Color(0xFF1F1F1F).withOpacity(0.7),
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
                        controller.isWomenSelected2.value = false;
                      },
                      child: Container(
                        width: 127.w,
                        height: 43.h,
                        decoration: BoxDecoration(
                          color: !controller.isWomenSelected2.value ? AppColors.primary : Colors.transparent,
                          border: !controller.isWomenSelected2.value ? null : Border.all(
                            color: Color(0xFFB0B0B0),
                            width: 0.71.r,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Men',
                            style: TextStyle(
                              color: !controller.isWomenSelected2.value ? Colors.white : Color(0xFF1F1F1F).withOpacity(0.7),
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

              if (controller.selectedGender[2].value)
                SizedBox(height: 23.h,),

              if (controller.selectedGender[1].value || (controller.selectedGender[2].value && controller.isWomenSelected2.value))
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
                      index: 0,
                      name: 'Neck',
                      left: 76,
                      top: 42.75,
                      width: 66,
                      isHighlight: controller.isHighlightSelected,
                      isHighlightSelected: controller.selectedHighlight[0],
                      isCoverSelected: controller.selectedCover[0],
                      select: controller.selectHighlightCover,
                    ),

                    BodyPreferencesMarkRight(
                      index: 1,
                      name: 'Chest',
                      left: 77,
                      top: 98.75,
                      width: 65,
                      isHighlight: controller.isHighlightSelected,
                      isHighlightSelected: controller.selectedHighlight[1],
                      isCoverSelected: controller.selectedCover[1],
                      select: controller.selectHighlightCover,
                    ),

                    BodyPreferencesMarkLeft(
                      index: 2,
                      name: 'Arms',
                      left: -0.39,
                      top: 116.75,
                      width: 48,
                      isHighlight: controller.isHighlightSelected,
                      isHighlightSelected: controller.selectedHighlight[2],
                      isCoverSelected: controller.selectedCover[2],
                      select: controller.selectHighlightCover,
                    ),

                    BodyPreferencesMarkLeft(
                      index: 3,
                      name: 'Waist',
                      left: -0.39,
                      top: 153.75,
                      width: 84,
                      isHighlight: controller.isHighlightSelected,
                      isHighlightSelected: controller.selectedHighlight[3],
                      isCoverSelected: controller.selectedCover[3],
                      select: controller.selectHighlightCover,
                    ),

                    BodyPreferencesMarkLeft(
                      index: 4,
                      name: 'Buttocks',
                      left: -0.39,
                      top: 197.75,
                      width: 48.5,
                      isHighlight: controller.isHighlightSelected,
                      isHighlightSelected: controller.selectedHighlight[4],
                      isCoverSelected: controller.selectedCover[4],
                      select: controller.selectHighlightCover,
                    ),

                    BodyPreferencesMarkRight(
                      index: 5,
                      name: 'Hips',
                      left: 93,
                      top: 199.75,
                      width: 49,
                      isHighlight: controller.isHighlightSelected,
                      isHighlightSelected: controller.selectedHighlight[5],
                      isCoverSelected: controller.selectedCover[5],
                      select: controller.selectHighlightCover,
                    ),

                    BodyPreferencesMarkLeft(
                      index: 6,
                      name: 'Thighs',
                      left: -0.39,
                      top: 252.75,
                      width: 72,
                      isHighlight: controller.isHighlightSelected,
                      isHighlightSelected: controller.selectedHighlight[6],
                      isCoverSelected: controller.selectedCover[6],
                      select: controller.selectHighlightCover,
                    ),

                    BodyPreferencesMarkRight(
                      index: 7,
                      name: 'Calves',
                      left: 76,
                      top: 358.75,
                      width: 66,
                      isHighlight: controller.isHighlightSelected,
                      isHighlightSelected: controller.selectedHighlight[7],
                      isCoverSelected: controller.selectedCover[7],
                      select: controller.selectHighlightCover,
                    ),
                  ],
                ),
              ),

              if (controller.selectedGender[0].value || (controller.selectedGender[2].value && !controller.isWomenSelected2.value))
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
                          'assets/images/about_yourself/body_preferences/men_body.svg',
                          // color: Colors.white,
                        ),
                      ),

                      BodyPreferencesMarkRight(
                        index: 0,
                        name: 'Neck',
                        left: 76,
                        top: 42.75,
                        width: 66,
                        isHighlight: controller.isHighlightSelected,
                        isHighlightSelected: controller.selectedHighlight[0],
                        isCoverSelected: controller.selectedCover[0],
                        select: controller.selectHighlightCover,
                      ),

                      BodyPreferencesMarkRight(
                        index: 1,
                        name: 'Chest',
                        left: 77,
                        top: 98.75,
                        width: 65,
                        isHighlight: controller.isHighlightSelected,
                        isHighlightSelected: controller.selectedHighlight[1],
                        isCoverSelected: controller.selectedCover[1],
                        select: controller.selectHighlightCover,
                      ),

                      BodyPreferencesMarkLeft(
                        index: 2,
                        name: 'Arms',
                        left: -0.39,
                        top: 116.75,
                        width: 48,
                        isHighlight: controller.isHighlightSelected,
                        isHighlightSelected: controller.selectedHighlight[2],
                        isCoverSelected: controller.selectedCover[2],
                        select: controller.selectHighlightCover,
                      ),

                      BodyPreferencesMarkLeft(
                        index: 3,
                        name: 'Waist',
                        left: -0.39,
                        top: 153.75,
                        width: 84,
                        isHighlight: controller.isHighlightSelected,
                        isHighlightSelected: controller.selectedHighlight[3],
                        isCoverSelected: controller.selectedCover[3],
                        select: controller.selectHighlightCover,
                      ),

                      BodyPreferencesMarkLeft(
                        index: 4,
                        name: 'Buttocks',
                        left: -0.39,
                        top: 197.75,
                        width: 48.5,
                        isHighlight: controller.isHighlightSelected,
                        isHighlightSelected: controller.selectedHighlight[4],
                        isCoverSelected: controller.selectedCover[4],
                        select: controller.selectHighlightCover,
                      ),

                      BodyPreferencesMarkRight(
                        index: 5,
                        name: 'Hips',
                        left: 93,
                        top: 199.75,
                        width: 49,
                        isHighlight: controller.isHighlightSelected,
                        isHighlightSelected: controller.selectedHighlight[5],
                        isCoverSelected: controller.selectedCover[5],
                        select: controller.selectHighlightCover,
                      ),

                      BodyPreferencesMarkLeft(
                        index: 6,
                        name: 'Thighs',
                        left: -0.39,
                        top: 252.75,
                        width: 72,
                        isHighlight: controller.isHighlightSelected,
                        isHighlightSelected: controller.selectedHighlight[6],
                        isCoverSelected: controller.selectedCover[6],
                        select: controller.selectHighlightCover,
                      ),

                      BodyPreferencesMarkRight(
                        index: 7,
                        name: 'Calves',
                        left: 76,
                        top: 358.75,
                        width: 66,
                        isHighlight: controller.isHighlightSelected,
                        isHighlightSelected: controller.selectedHighlight[7],
                        isCoverSelected: controller.selectedCover[7],
                        select: controller.selectHighlightCover,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}


class BodyPreferencesMarkRight extends StatelessWidget {
  final int index;
  final String name;
  final double left;
  final double top;
  final double width;
  final RxBool isHighlight;
  final RxBool isHighlightSelected;
  final RxBool isCoverSelected;
  final void Function(bool, int)? select;

  const BodyPreferencesMarkRight({
    required this.index,
    required this.name,
    required this.left,
    required this.top,
    required this.width,
    required this.isHighlight,
    required this.isHighlightSelected,
    required this.isCoverSelected,
    required this.select,
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
            width: width.w,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.7.r,
                )
            ),
          ),

          Obx(() {
            return GestureDetector(
              onTap: () => select?.call(isHighlight.value, index),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.5.w, vertical: 5.5.h,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.r),
                  color: isHighlightSelected.value ? AppColors.primary : isCoverSelected.value ? AppColors.accent : Colors.black.withOpacity(0.2),
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
            );
          })
        ],
      ),
    );
  }
}



class BodyPreferencesMarkLeft extends StatelessWidget {
  final int index;
  final String name;
  final double left;
  final double top;
  final double width;
  final RxBool isHighlight;
  final RxBool isHighlightSelected;
  final RxBool isCoverSelected;
  final void Function(bool, int)? select;

  const BodyPreferencesMarkLeft({
    required this.index,
    required this.name,
    required this.left,
    required this.top,
    required this.width,
    required this.isHighlight,
    required this.isHighlightSelected,
    required this.isCoverSelected,
    required this.select,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left.w,
      top: top.h,
      child: Row(
        spacing: 6.w,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            return GestureDetector(
              onTap: () => select?.call(isHighlight.value, index),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.5.w, vertical: 5.5.h,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.r),
                  color: isHighlightSelected.value ? AppColors.primary : isCoverSelected.value ? AppColors.accent : Colors.black.withOpacity(0.2),
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
            );
          }),

          Container(
            width: width.w,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.7.r,
                )
            ),
          ),
        ],
      ),
    );
  }
}
