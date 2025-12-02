import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/about_yourself/controllers/about_yourself_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../../../../common/widget/color_wheel/color_wheel.dart';
import '../../../../common/widget/color_wheel/color_wheel_controller.dart';

class AboutYourself4View extends GetView<AboutYourselfController> {
  const AboutYourself4View({super.key});

  @override
  Widget build(BuildContext context) {
    // Two independent controllers: favorites & avoid
    // final fav = Get.put(ColorWheelController(), tag: 'fav');
    // final avoid = Get.put(ColorWheelController(), tag: 'avoid');
    //
    // const rings = 5;
    // const segments = 18;

    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.verticalSpace,
              Text(
                'Any Favorite Colors?',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),

              53.verticalSpace,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12.w,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.isLoveSelected.value = true;
                    },
                    child: Container(
                      width: 127.w,
                      height: 43.h,
                      decoration: BoxDecoration(
                        color: controller.isLoveSelected.value ? AppColors.primary : Colors.transparent,
                        border: controller.isLoveSelected.value ? null : Border.all(
                          color: Color(0xFFB0B0B0),
                          width: 0.71.r,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10.w,
                        children: [
                          Text(
                            'Love',
                            style: TextStyle(
                              color: controller.isLoveSelected.value ? Colors.white : Color(0xFF1F1F1F).withOpacity(0.7),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ),

                          if (controller.selectedLoveCount.value > 0)
                            Container(
                              padding: EdgeInsets.all(6.51.r),
                              decoration: BoxDecoration(
                                color: controller.isLoveSelected.value ? Colors.white.withOpacity(0.2) : AppColors.primary.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${controller.selectedLoveCount.value}',
                                style: TextStyle(
                                  color: controller.isLoveSelected.value ? Colors.white : AppColors.primary,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      controller.isLoveSelected.value = false;
                    },
                    child: Container(
                      width: 127.w,
                      height: 43.h,
                      decoration: BoxDecoration(
                        color: !controller.isLoveSelected.value ? AppColors.primary : Colors.transparent,
                        border: !controller.isLoveSelected.value ? null : Border.all(
                          color: Color(0xFFB0B0B0),
                          width: 0.71.r,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10.w,
                        children: [
                          Text(
                            'Avoid',
                            style: TextStyle(
                              color: !controller.isLoveSelected.value ? Colors.white : Color(0xFF1F1F1F).withOpacity(0.7),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ),

                          if (controller.selectedAvoidCount.value > 0)
                            Container(
                              padding: EdgeInsets.all(6.51.r),
                              decoration: BoxDecoration(
                                color: !controller.isLoveSelected.value ? Colors.white.withOpacity(0.2) : AppColors.primary.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${controller.selectedAvoidCount.value}',
                                style: TextStyle(
                                  color: !controller.isLoveSelected.value ? Colors.white : AppColors.primary,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 60.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.99.w,),
                child: Column(
                  spacing: 32.h,
                  children: [
                    Column(
                      spacing: 16.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          spacing: 2.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Basics',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),
                            Text(
                              'Wardrobe essentials',
                              style: TextStyle(
                                color: Color(0xFF1F1F1F).withOpacity(0.6),
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          spacing: 12.w,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPlate(
                                  index: 0,
                                  color: Colors.white,
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[0],
                                  selectedAvoid: controller.selectedAvoidColor[0],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 1,
                                  color: Color(0xFFD1D1D6),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[1],
                                  selectedAvoid: controller.selectedAvoidColor[1],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 2,
                                  color: Color(0xFF8E8E93),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[2],
                                  selectedAvoid: controller.selectedAvoidColor[2],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 3,
                                  color: Color(0xFF48484A),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[3],
                                  selectedAvoid: controller.selectedAvoidColor[3],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 4,
                                  color: Color(0xFF000000),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[4],
                                  selectedAvoid: controller.selectedAvoidColor[4],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 5,
                                  color: Color(0xFF2C3539),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[5],
                                  selectedAvoid: controller.selectedAvoidColor[5],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 6,
                                  color: Color(0xFF383838),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[6],
                                  selectedAvoid: controller.selectedAvoidColor[6],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPlate(
                                  index: 7,
                                  color: Color(0xFFF5F5DC),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[7],
                                  selectedAvoid: controller.selectedAvoidColor[7],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 8,
                                  color: Color(0xFFC8AD7F),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[8],
                                  selectedAvoid: controller.selectedAvoidColor[8],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 9,
                                  color: Color(0xFFA89174),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[9],
                                  selectedAvoid: controller.selectedAvoidColor[9],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 10,
                                  color: Color(0xFFD2B48C),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[10],
                                  selectedAvoid: controller.selectedAvoidColor[10],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 11,
                                  color: Color(0xFFB38B6D),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[11],
                                  selectedAvoid: controller.selectedAvoidColor[11],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 12,
                                  color: Color(0xFF63340D),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[12],
                                  selectedAvoid: controller.selectedAvoidColor[12],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 13,
                                  color: Color(0xFF3D2817),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[13],
                                  selectedAvoid: controller.selectedAvoidColor[13],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),
                              ],
                            ),
                          ],
                        ),

                        Divider(color: Colors.black.withOpacity(0.1),),
                      ],
                    ),

                    // ===== Reds & Pinks =====
                    Column(
                      spacing: 16.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          spacing: 2.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Reds & Pinks',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),

                            Text(
                              'From soft to passionate',
                              style: TextStyle(
                                color: Color(0xFF1F1F1F).withOpacity(0.6),
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          spacing: 12.w,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPlate(
                                  index: 14,
                                  color: Color(0xFFFFD6E8),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[14],
                                  selectedAvoid: controller.selectedAvoidColor[14],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 15,
                                  color: Color(0xFFFFB3BA),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[15],
                                  selectedAvoid: controller.selectedAvoidColor[15],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 16,
                                  color: Color(0xFFFF7F50),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[16],
                                  selectedAvoid: controller.selectedAvoidColor[16],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 17,
                                  color: Color(0xFFFF6B9D),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[17],
                                  selectedAvoid: controller.selectedAvoidColor[17],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 18,
                                  color: Color(0xFFFF007F),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[18],
                                  selectedAvoid: controller.selectedAvoidColor[18],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 19,
                                  color: Color(0xFFFF1493),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[19],
                                  selectedAvoid: controller.selectedAvoidColor[19],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 20,
                                  color: Color(0xFFDE3163),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[20],
                                  selectedAvoid: controller.selectedAvoidColor[20],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPlate(
                                  index: 21,
                                  color: Color(0xFFFF6B6B),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[21],
                                  selectedAvoid: controller.selectedAvoidColor[21],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 22,
                                  color: Color(0xFFDC143C),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[22],
                                  selectedAvoid: controller.selectedAvoidColor[22],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 23,
                                  color: Color(0xFFE0115F),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[23],
                                  selectedAvoid: controller.selectedAvoidColor[23],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 24,
                                  color: Color(0xFFD2042D),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[24],
                                  selectedAvoid: controller.selectedAvoidColor[24],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 25,
                                  color: Color(0xFF800020),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[25],
                                  selectedAvoid: controller.selectedAvoidColor[25],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 26,
                                  color: Color(0xFF722F37),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[26],
                                  selectedAvoid: controller.selectedAvoidColor[26],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 27,
                                  color: Color(0xFF5C0018),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[27],
                                  selectedAvoid: controller.selectedAvoidColor[27],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),
                              ],
                            ),
                          ],
                        ),

                        Divider(color: Colors.black.withOpacity(0.1),),
                      ],
                    ),

                    // ===== Oranges & Yellows =====
                    Column(
                      spacing: 16.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          spacing: 2.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Oranges & Yellows',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),

                            Text(
                              'Warmth and brightness',
                              style: TextStyle(
                                color: Color(0xFF1F1F1F).withOpacity(0.6),
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          spacing: 12.w,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPlate(
                                  index: 28,
                                  color: Color(0XFFFFFACD),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[28],
                                  selectedAvoid: controller.selectedAvoidColor[28],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 29,
                                  color: Color(0xFFFFE5B4),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[29],
                                  selectedAvoid: controller.selectedAvoidColor[29],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 30,
                                  color: Color(0xFFFFD9B3),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[30],
                                  selectedAvoid: controller.selectedAvoidColor[30],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 31,
                                  color: Color(0xFFFFF8DC),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[31],
                                  selectedAvoid: controller.selectedAvoidColor[31],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 32,
                                  color: Color(0xFFFFB347),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[32],
                                  selectedAvoid: controller.selectedAvoidColor[32],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 33,
                                  color: Color(0xFFFFD700),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[33],
                                  selectedAvoid: controller.selectedAvoidColor[33],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 34,
                                  color: Color(0xFFFFB300),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[34],
                                  selectedAvoid: controller.selectedAvoidColor[34],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPlate(
                                  index: 35,
                                  color: Color(0xFFFF8C00),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[35],
                                  selectedAvoid: controller.selectedAvoidColor[35],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 36,
                                  color: Color(0xFFFF6600),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[36],
                                  selectedAvoid: controller.selectedAvoidColor[36],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 37,
                                  color: Color(0xFFF28500),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[37],
                                  selectedAvoid: controller.selectedAvoidColor[37],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 38,
                                  color: Color(0xFFE2725B),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[38],
                                  selectedAvoid: controller.selectedAvoidColor[38],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 39,
                                  color: Color(0xFFB7410E),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[39],
                                  selectedAvoid: controller.selectedAvoidColor[39],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 40,
                                  color: Color(0xFFCC5500),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[40],
                                  selectedAvoid: controller.selectedAvoidColor[40],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 41,
                                  color: Color(0xFF6E5C4D),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[41],
                                  selectedAvoid: controller.selectedAvoidColor[41],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),
                              ],
                            ),
                          ],
                        ),

                        Divider(color: Colors.black.withOpacity(0.1),),
                      ],
                    ),

                    // ===== Greens =====
                    Column(
                      spacing: 16.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          spacing: 2.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Greens',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),

                            Text(
                              'Nature and freshness',
                              style: TextStyle(
                                color: Color(0xFF1F1F1F).withOpacity(0.6),
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          spacing: 12.w,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPlate(
                                  index: 42,
                                  color: Color(0xFFCBFFD3),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[42],
                                  selectedAvoid: controller.selectedAvoidColor[42],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 43,
                                  color: Color(0xFFC1FFC1),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[43],
                                  selectedAvoid: controller.selectedAvoidColor[43],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 44,
                                  color: Color(0xFF98FF98),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[44],
                                  selectedAvoid: controller.selectedAvoidColor[44],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 45,
                                  color: Color(0xFF93E9BE),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[45],
                                  selectedAvoid: controller.selectedAvoidColor[45],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 46,
                                  color: Color(0xFF32CD32),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[46],
                                  selectedAvoid: controller.selectedAvoidColor[46],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 47,
                                  color: Color(0xFF50C878),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[47],
                                  selectedAvoid: controller.selectedAvoidColor[47],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 48,
                                  color: Color(0xFF4CBB17),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[48],
                                  selectedAvoid: controller.selectedAvoidColor[48],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPlate(
                                  index: 49,
                                  color: Color(0xFF9CAF88),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[49],
                                  selectedAvoid: controller.selectedAvoidColor[49],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 50,
                                  color: Color(0xFF808000),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[50],
                                  selectedAvoid: controller.selectedAvoidColor[50],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 51,
                                  color: Color(0xFF8A9A5B),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[51],
                                  selectedAvoid: controller.selectedAvoidColor[51],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 52,
                                  color: Color(0xFF2F855A),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[52],
                                  selectedAvoid: controller.selectedAvoidColor[52],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 53,
                                  color: Color(0xFF355E3B),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[53],
                                  selectedAvoid: controller.selectedAvoidColor[53],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 54,
                                  color: Color(0xFF1B4D3E),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[54],
                                  selectedAvoid: controller.selectedAvoidColor[54],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 55,
                                  color: Color(0xFF013220),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[55],
                                  selectedAvoid: controller.selectedAvoidColor[55],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),
                              ],
                            ),
                          ],
                        ),

                        Divider(color: Colors.black.withOpacity(0.1),),
                      ],
                    ),

                    // ===== Blues & Aquas =====
                    Column(
                      spacing: 16.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          spacing: 2.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Blues & Aquas',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),

                            Text(
                              'Cool and serene',
                              style: TextStyle(
                                color: Color(0xFF1F1F1F).withOpacity(0.6),
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          spacing: 12.w,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPlate(
                                  index: 56,
                                  color: Color(0XFFB3E5FC),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[56],
                                  selectedAvoid: controller.selectedAvoidColor[56],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 57,
                                  color: Color(0xFFC7E9F0),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[57],
                                  selectedAvoid: controller.selectedAvoidColor[57],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 58,
                                  color: Color(0xFF87CEEB),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[58],
                                  selectedAvoid: controller.selectedAvoidColor[58],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 59,
                                  color: Color(0xFF89CFF0),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[59],
                                  selectedAvoid: controller.selectedAvoidColor[59],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 60,
                                  color: Color(0xFF40E0D0),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[60],
                                  selectedAvoid: controller.selectedAvoidColor[60],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 61,
                                  color: Color(0xFF00CED1),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[61],
                                  selectedAvoid: controller.selectedAvoidColor[61],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 62,
                                  color: Color(0xFF008080),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[62],
                                  selectedAvoid: controller.selectedAvoidColor[62],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPlate(
                                  index: 63,
                                  color: Color(0xFF0095FF),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[63],
                                  selectedAvoid: controller.selectedAvoidColor[63],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 64,
                                  color: Color(0xFF4A90E2),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[64],
                                  selectedAvoid: controller.selectedAvoidColor[64],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 65,
                                  color: Color(0xFF0047AB),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[65],
                                  selectedAvoid: controller.selectedAvoidColor[65],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 66,
                                  color: Color(0xFF0F52BA),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[66],
                                  selectedAvoid: controller.selectedAvoidColor[66],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 67,
                                  color: Color(0xFF002FA7),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[67],
                                  selectedAvoid: controller.selectedAvoidColor[67],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 68,
                                  color: Color(0xFF00008B),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[68],
                                  selectedAvoid: controller.selectedAvoidColor[68],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 69,
                                  color: Color(0xFF001F3F),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[69],
                                  selectedAvoid: controller.selectedAvoidColor[69],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),
                              ],
                            ),
                          ],
                        ),

                        Divider(color: Colors.black.withOpacity(0.1),),
                      ],
                    ),

                    // ===== Purples & Violets =====
                    Column(
                      spacing: 16.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          spacing: 2.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Purples & Violets',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),

                            Text(
                              'Elegance and mystery',
                              style: TextStyle(
                                color: Color(0xFF1F1F1F).withOpacity(0.6),
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          spacing: 12.w,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPlate(
                                  index: 70,
                                  color: Color(0xFFE6E6FA),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[70],
                                  selectedAvoid: controller.selectedAvoidColor[70],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 71,
                                  color: Color(0xFFD4C4FB),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[71],
                                  selectedAvoid: controller.selectedAvoidColor[71],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 72,
                                  color: Color(0xFFC8A2C8),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[72],
                                  selectedAvoid: controller.selectedAvoidColor[72],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 73,
                                  color: Color(0xFFCCCCFF),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[73],
                                  selectedAvoid: controller.selectedAvoidColor[73],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 74,
                                  color: Color(0xFFB19CD9),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[74],
                                  selectedAvoid: controller.selectedAvoidColor[74],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 75,
                                  color: Color(0xFFDA70D6),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[75],
                                  selectedAvoid: controller.selectedAvoidColor[75],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 76,
                                  color: Color(0xFF8F00FF),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[76],
                                  selectedAvoid: controller.selectedAvoidColor[76],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ColorPlate(
                                  index: 77,
                                  color: Color(0xFFFF00FF),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[77],
                                  selectedAvoid: controller.selectedAvoidColor[77],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 78,
                                  color: Color(0xFF9370DB),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[78],
                                  selectedAvoid: controller.selectedAvoidColor[78],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 79,
                                  color: Color(0xFF9D00FF),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[79],
                                  selectedAvoid: controller.selectedAvoidColor[79],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 80,
                                  color: Color(0xFF9966CC),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[80],
                                  selectedAvoid: controller.selectedAvoidColor[80],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 81,
                                  color: Color(0xFF8E4585),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[81],
                                  selectedAvoid: controller.selectedAvoidColor[81],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 82,
                                  color: Color(0xFF6F2DA8),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[82],
                                  selectedAvoid: controller.selectedAvoidColor[82],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),

                                ColorPlate(
                                  index: 83,
                                  color: Color(0xFF614051),
                                  isLoveSelected: controller.isLoveSelected,
                                  selectedLove: controller.selectedLoveColor[83],
                                  selectedAvoid: controller.selectedAvoidColor[83],
                                  selectLove: controller.selectLoveColor,
                                  selectAvoid: controller.selectAvoidColor,
                                ),
                              ],
                            ),
                          ],
                        ),

                        Divider(color: Colors.black.withOpacity(0.1),),
                      ],
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


class ColorPlate extends StatelessWidget {
  final int index;
  final Color color;
  final RxBool isLoveSelected;
  final RxBool selectedLove;
  final RxBool selectedAvoid;
  final void Function(int)? selectLove;
  final void Function(int)? selectAvoid;

  const ColorPlate({
    required this.index,
    required this.color,
    required this.isLoveSelected,
    required this.selectedLove,
    required this.selectedAvoid,
    required this.selectLove,
    required this.selectAvoid,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isLoveSelected.value) {
          selectLove?.call(index);
        } else {
          selectAvoid?.call(index);
        }
      },
      child: Obx(() {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(22.r),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 3.r,
                        offset: Offset(0.w, 1.h)
                    ),
                  ],
                border: ((isLoveSelected.value && selectedLove.value) || (!isLoveSelected.value && selectedAvoid.value)) ? Border.all(
                  color: Colors.black,
                  width: 1.41.r,
                ) : null,
              ),
            ),

            if ((isLoveSelected.value && selectedLove.value) || (!isLoveSelected.value && selectedAvoid.value))
              Positioned(
                left: 29.29.w,
                top: -5.27.h,
                child: Container(
                  width: 18.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12.r,
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
