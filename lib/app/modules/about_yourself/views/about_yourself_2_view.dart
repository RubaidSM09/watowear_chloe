import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../common/app_colors.dart';
import '../controllers/about_yourself_controller.dart';

class AboutYourself2View extends GetView<AboutYourselfController> {
  const AboutYourself2View({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How would you describe your body shape.',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),

              SizedBox(height: 26.h),

              Text(
                'Tell us about your body shape',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 12.h),

              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: controller.bodyShapeClicked.value ? 48.h + 300.h : 48.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textIcons.withAlpha(128),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.selectedBodyShape[0].value
                                ? 'Apple'
                                : controller.selectedBodyShape[1].value
                                ? 'Pear'
                                : controller.selectedBodyShape[2].value
                                ? 'Hourglass'
                                : controller.selectedBodyShape[3].value
                                ? 'Rectangle'
                                : controller.selectedBodyShape[4].value
                                ? 'Inverted Triangle'
                                : controller.selectedBodyShape[5].value
                                ? 'I am not sure'
                                : 'Select here',
                            style: TextStyle(
                              color: AppColors.textIcons,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.bodyShapeClicked.value = !controller.bodyShapeClicked.value;
                              controller.skinToneClicked.value = false;
                            },
                            child: Icon(
                              controller.bodyShapeClicked.value
                                  ? Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_down_outlined,
                              size: 20.r,
                              color: const Color(0xFF141B34),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Make sure the popup lives inside the Stack's hit-test area
                    if (controller.bodyShapeClicked.value)
                      Positioned(
                        top: 48.h,
                        left: 0,
                        right: 0, // ⬅️ fill width for reliable taps
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 19.h),
                          color: const Color(0xFFF4F1EB),
                          child: Column(
                            spacing: 24.h,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Apple',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectBodyShape(0);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              controller.selectedBodyShape[0].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Pear',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectBodyShape(1);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedBodyShape[1].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Hourglass',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectBodyShape(2);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedBodyShape[2].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rectangle',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectBodyShape(3);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedBodyShape[3].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Inverted Triangle',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectBodyShape(4);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedBodyShape[4].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'I am not sure',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectBodyShape(5);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedBodyShape[5].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(height: 12.h),

              Text(
                'Tell me about your skin tone',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 12.h),

              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: controller.skinToneClicked.value ? 48.h + 500.h : 48.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textIcons.withAlpha(128),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.selectedSkinTone[0].value
                                ? 'Fair'
                                : controller.selectedSkinTone[1].value
                                ? 'Light'
                                : controller.selectedSkinTone[2].value
                                ? 'Medium'
                                : controller.selectedSkinTone[3].value
                                ? 'Olive'
                                : controller.selectedSkinTone[4].value
                                ? 'Tan'
                                : controller.selectedSkinTone[5].value
                                ? 'Deep'
                                : controller.selectedSkinTone[6].value
                                ? 'Dark'
                                : controller.selectedSkinTone[7].value
                                ? 'I\'m not sure'
                                : 'Select here',
                            style: TextStyle(
                              color: AppColors.textIcons,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          GestureDetector(onTap: () {
                            controller.skinToneClicked.value = !controller.skinToneClicked.value;
                            controller.bodyShapeClicked.value = false;
                          },
                            child: Icon(
                              controller.skinToneClicked.value
                                  ? Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_down_outlined,
                              size: 20.r,
                              color: const Color(0xFF141B34),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Make sure the popup lives inside the Stack's hit-test area
                    if (controller.skinToneClicked.value)
                      Positioned(
                        top: 48.h,
                        left: 0,
                        right: 0, // ⬅️ fill width for reliable taps
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 19.h),
                          color: const Color(0xFFF4F1EB),
                          child: Column(
                            spacing: 24.h,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 16.w,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16.r),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFEFCE8),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFFFEF08A),
                                          )
                                        ),
                                      ),

                                      Text(
                                        'Fair',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectSkinTone(0);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedSkinTone[0].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 16.w,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16.r),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFEF3C7),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFFDE68A),
                                            )
                                        ),
                                      ),

                                      Text(
                                        'Light',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectSkinTone(1);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedSkinTone[1].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 16.w,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16.r),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFED7AA),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFFDBA74),
                                            )
                                        ),
                                      ),

                                      Text(
                                        'Medium',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectSkinTone(2);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedSkinTone[2].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 16.w,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16.r),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFCA8A04),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFA16207),
                                            )
                                        ),
                                      ),

                                      Text(
                                        'Olive',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectSkinTone(3);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedSkinTone[3].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 16.w,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16.r),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFD97706),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFB45309),
                                            )
                                        ),
                                      ),

                                      Text(
                                        'Tan',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectSkinTone(4);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedSkinTone[4].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 16.w,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16.r),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF92400E),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFF78350F),
                                            )
                                        ),
                                      ),

                                      Text(
                                        'Deep',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectSkinTone(5);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedSkinTone[5].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 16.w,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16.r),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF713F12),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFF422006),
                                            )
                                        ),
                                      ),

                                      Text(
                                        'Dark',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectSkinTone(6);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedSkinTone[6].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 16.w,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16.r),
                                        child: Text(
                                          '?',
                                          style: TextStyle(
                                            color: AppColors.textIcons.withAlpha(153),
                                            fontFamily: 'Comfortaa',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.75.sp,
                                          ),
                                        ),
                                      ),

                                      Text(
                                        'I\'m not sure',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectSkinTone(7);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedSkinTone[7].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(height: 12.h),

              Text(
                'What about your eyes',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 12.h),

              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: controller.eyesClicked.value ? 48.h + 550.h : 48.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textIcons.withAlpha(128),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.selectedEyes[0].value
                                ? 'Classic Chic'
                                : controller.selectedEyes[1].value
                                ? 'Bohemian'
                                : controller.selectedEyes[2].value
                                ? 'Streetwear/Urban'
                                : controller.selectedEyes[3].value
                                ? 'Romantic/Feminine'
                                : controller.selectedEyes[4].value
                                ? 'Avant-garde/Edgy'
                                : controller.selectedEyes[5].value
                                ? 'Minimalist'
                                : controller.selectedEyes[6].value
                                ? 'Vintage/Retro'
                                : controller.selectedEyes[7].value
                                ? 'Glamorous'
                                : controller.selectedEyes[8].value
                                ? 'Sporty/Athleisure'
                                : controller.selectedEyes[9].value
                                ? 'Artsy/Eclectic'
                                : controller.selectedEyes[10].value
                                ? 'Rocker/Grunge'
                                : 'Select here',
                            style: TextStyle(
                              color: AppColors.textIcons,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.eyesClicked.value = !controller.eyesClicked.value;
                              controller.skinToneClicked.value = false;
                              controller.bodyShapeClicked.value = false;
                            },
                            child: Icon(
                              controller.eyesClicked.value
                                  ? Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_down_outlined,
                              size: 20.r,
                              color: const Color(0xFF141B34),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Make sure the popup lives inside the Stack's hit-test area
                    if (controller.eyesClicked.value)
                      Positioned(
                        top: 48.h,
                        left: 0,
                        right: 0, // ⬅️ fill width for reliable taps
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 19.h),
                          color: const Color(0xFFF4F1EB),
                          child: Column(
                            spacing: 24.h,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Classic Chic',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectEyes(0);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedEyes[0].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Bohemian',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectEyes(1);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedEyes[1].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Streetwear/Urban',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectEyes(2);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedEyes[2].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Romantic/Feminine',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectEyes(3);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedEyes[3].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Avant-garde/Edgy',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectEyes(4);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedEyes[4].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Minimalist',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectEyes(5);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedEyes[5].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Vintage/Retro',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectEyes(6);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedEyes[6].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Glamorous',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectEyes(7);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedEyes[7].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sporty/Athleisure',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectEyes(8);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedEyes[8].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Artsy/Eclectic',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectEyes(9);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedEyes[9].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rocker/Grunge',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.selectEyes(10);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textIcons,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          controller.selectedEyes[10].value
                                              ? AppColors.textIcons
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
