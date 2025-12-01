import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                'Tell us about yourself',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),

              SizedBox(height: 8.h,),

              Text(
                'This helps us personalize your style',
                style: TextStyle(
                  color: Color(0xFF1F1F1F).withOpacity(0.7),
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: 24.h),

              Text(
                'Eye Color',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: 16.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EyeColorCard(
                    index: 0,
                    color: Color(0xFF5C4033),
                    name: 'Brown',
                    isSelected: controller.selectedEyeColor[0],
                    select: controller.selectEyeColor,
                  ),

                  EyeColorCard(
                    index: 1,
                    color: Color(0xFF8E7618),
                    name: 'Hazel',
                    isSelected: controller.selectedEyeColor[1],
                    select: controller.selectEyeColor,
                  ),

                  EyeColorCard(
                    index: 2,
                    color: Color(0xFF2E8B57),
                    name: 'Green',
                    isSelected: controller.selectedEyeColor[2],
                    select: controller.selectEyeColor,
                  ),

                  EyeColorCard(
                    index: 3,
                    color: Color(0xFF4A90E2),
                    name: 'Blue',
                    isSelected: controller.selectedEyeColor[3],
                    select: controller.selectEyeColor,
                  ),

                  EyeColorCard(
                    index: 4,
                    color: Color(0xFF708090),
                    name: 'Gray',
                    isSelected: controller.selectedEyeColor[4],
                    select: controller.selectEyeColor,
                  ),

                  EyeColorCard(
                    index: 5,
                    color: Color(0xFF000000),
                    name: 'Black',
                    isSelected: controller.selectedEyeColor[5],
                    select: controller.selectEyeColor,
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              Text(
                'Body Shape',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: 16.h),

              Wrap(
                spacing: 16.w,
                runSpacing: 16.h,
                children: [
                  BodyShapeCard(
                    index: 0,
                    icon: 'assets/images/about_yourself/body_shape/apple.svg',
                    name: 'Apple',
                    isSelected: controller.selectedBodyShape[0],
                    select: controller.selectBodyShape,
                  ),

                  BodyShapeCard(
                    index: 1,
                    icon: 'assets/images/about_yourself/body_shape/pear.svg',
                    name: 'Pear',
                    isSelected: controller.selectedBodyShape[1],
                    select: controller.selectBodyShape,
                  ),

                  BodyShapeCard(
                    index: 2,
                    icon: 'assets/images/about_yourself/body_shape/hourglass.svg',
                    name: 'Hourglass',
                    isSelected: controller.selectedBodyShape[2],
                    select: controller.selectBodyShape,
                  ),

                  BodyShapeCard(
                    index: 3,
                    icon: 'assets/images/about_yourself/body_shape/rectangle.svg',
                    name: 'Rectangle',
                    isSelected: controller.selectedBodyShape[3],
                    select: controller.selectBodyShape,
                  ),

                  BodyShapeCard(
                    index: 4,
                    icon: 'assets/images/about_yourself/body_shape/inverted_triangle.svg',
                    name: 'Inverted\nTriangle',
                    isSelected: controller.selectedBodyShape[4],
                    select: controller.selectBodyShape,
                  ),

                  BodyShapeCard(
                    index: 5,
                    icon: 'assets/images/about_yourself/body_shape/not_sure.svg',
                    name: 'I\'m not sure',
                    isSelected: controller.selectedBodyShape[5],
                    select: controller.selectBodyShape,
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              Text(
                'Skin Tone',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: 16.h),

              Column(
                spacing: 16.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkinToneCard(
                        index: 0,
                        color: Color(0xFFFEFCE8),
                        name: 'Fair',
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 2.r,
                            offset: Offset(0.w, 1.h),
                          ),

                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 3.r,
                            offset: Offset(0.w, 1.h),
                          ),
                        ],
                        isSelected: controller.selectedSkinTone[0],
                        select: controller.selectSkinTone,
                      ),

                      SkinToneCard(
                        index: 1,
                        color: Color(0xFFFEF3C7),
                        name: 'Light',
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 2.r,
                            offset: Offset(0.w, 1.h),
                          ),

                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 3.r,
                            offset: Offset(0.w, 1.h),
                          ),
                        ],
                        isSelected: controller.selectedSkinTone[1],
                        select: controller.selectSkinTone,
                      ),

                      SkinToneCard(
                        index: 2,
                        color: Color(0xFFFED7AA),
                        name: 'Medium',
                        isSelected: controller.selectedSkinTone[2],
                        select: controller.selectSkinTone,
                      ),

                      SkinToneCard(
                        index: 3,
                        color: Color(0xFFCA8A04),
                        name: 'Olive',
                        isSelected: controller.selectedSkinTone[3],
                        select: controller.selectSkinTone,
                      ),

                      SkinToneCard(
                        index: 4,
                        color: Color(0xFFD97706),
                        name: 'Tan',
                        isSelected: controller.selectedSkinTone[4],
                        select: controller.selectSkinTone,
                      ),

                      SkinToneCard(
                        index: 5,
                        color: Color(0xFF92400E),
                        name: 'Deep',
                        isSelected: controller.selectedSkinTone[5],
                        select: controller.selectSkinTone,
                      ),
                    ],
                  ),

                  Row(
                    spacing: 20.w,
                    children: [
                      SkinToneCard(
                        index: 6,
                        color: Color(0xFF713F12),
                        name: 'Dark',
                        isSelected: controller.selectedSkinTone[6],
                        select: controller.selectSkinTone,
                      ),

                      Column(
                        spacing: 8.h,
                        children: [
                          GestureDetector(
                            onTap: () => controller.selectSkinTone(7),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 45.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFF2F2F2),
                                    border: controller.selectedSkinTone[7].value ? Border.all(
                                      color: Colors.black,
                                      width: 1.41.r,
                                    ) : null,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/about_yourself/skin_tone/not_sure.svg',
                                  ),
                                ),

                                if (controller.selectedSkinTone[7].value)
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
                            ),
                          ),

                          Text(
                            'I\'m not sure',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(height: 24.h),

              Text(
                'Hair Color',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: 16.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HairColorCard(
                    index: 0,
                    color: Color(0xFF1C1C1C),
                    name: 'Black',
                    isSelected: controller.selectedHairColor[0],
                    select: controller.selectHairColor,
                  ),

                  HairColorCard(
                    index: 1,
                    color: Color(0xFF6F4E37),
                    name: 'Brown',
                    isSelected: controller.selectedHairColor[1],
                    select: controller.selectHairColor,
                  ),

                  HairColorCard(
                    index: 2,
                    color: Color(0xFFF5DEB3),
                    name: 'Blonde',
                    isSelected: controller.selectedHairColor[2],
                    select: controller.selectHairColor,
                  ),

                  HairColorCard(
                    index: 3,
                    color: Color(0xFFB94E48),
                    name: 'Red',
                    isSelected: controller.selectedHairColor[3],
                    select: controller.selectHairColor,
                  ),

                  HairColorCard(
                    index: 4,
                    color: Color(0xFFB0B0B0),
                    name: 'Gray',
                    isSelected: controller.selectedHairColor[4],
                    select: controller.selectHairColor,
                  ),

                  HairColorCard(
                    index: 5,
                    color: Color(0xFFCD7C1F),
                    name: 'Ginger',
                    isSelected: controller.selectedHairColor[5],
                    select: controller.selectHairColor,
                  ),
                ],
              ),

              /*Text(
                'What about your vibes',
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}


class EyeColorCard extends StatelessWidget {
  final int index;
  final Color color;
  final String name;
  final RxBool isSelected;
  final void Function(int)? select;

  const EyeColorCard({
    required this.index,
    required this.color,
    required this.name,
    required this.isSelected,
    required this.select,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        GestureDetector(
          onTap: () => select?.call(index),
          child: Obx(() {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(22.5.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    border: isSelected.value ? Border.all(
                      color: Colors.black,
                      width: 1.41.r,
                    ) : null,
                  ),
                ),

                if (isSelected.value)
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
        ),

        Text(
          name,
          style: TextStyle(
            color: Color(0xFF666666),
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        )
      ],
    );
  }
}


class BodyShapeCard extends StatelessWidget {
  final int index;
  final String icon;
  final String name;
  final RxBool isSelected;
  final void Function(int)? select;

  const BodyShapeCard({
    required this.index,
    required this.icon,
    required this.name,
    required this.isSelected,
    required this.select,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.34.w,),
      child: Column(
        spacing: 8.h,
        children: [
          GestureDetector(
            onTap: () => select?.call(index),
            child: Obx(() {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.all(11.99.r),
                    decoration: BoxDecoration(
                      color: Color(0xFFF9FAFB),
                      border: isSelected.value ? Border.all(
                        color: Colors.black,
                        width: 1.41.r,
                      ) : null,
                    ),
                    child: SvgPicture.asset(
                      icon,
                    ),
                  ),

                  if (isSelected.value)
                    Positioned(
                      right: -5.27.w,
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
          ),

          Text(
            name,
            style: TextStyle(
              color: Color(0xFF666666),
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}


class SkinToneCard extends StatelessWidget {
  final int index;
  final Color color;
  final String name;
  final List<BoxShadow>? boxShadow;
  final RxBool isSelected;
  final void Function(int)? select;

  const SkinToneCard({
    required this.index,
    required this.color,
    required this.name,
    this.boxShadow,
    required this.isSelected,
    required this.select,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        GestureDetector(
          onTap: () => select?.call(index),
          child: Obx(() {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(22.5.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    boxShadow: boxShadow,
                    border: isSelected.value ? Border.all(
                      color: Colors.black,
                      width: 1.41.r,
                    ) : null,
                  ),
                ),

                if (isSelected.value)
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
        ),

        Text(
          name,
          style: TextStyle(
            color: Color(0xFF666666),
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}


class HairColorCard extends StatelessWidget {
  final int index;
  final Color color;
  final String name;
  final RxBool isSelected;
  final void Function(int)? select;

  const HairColorCard({
    required this.index,
    required this.color,
    required this.name,
    required this.isSelected,
    required this.select,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => select?.call(index),
      child: Column(
        spacing: 8.h,
        children: [
          Obx(() {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(22.5.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    border: isSelected.value ? Border.all(
                      color: Colors.black,
                      width: 1.41.r,
                    ) : null,
                  ),
                ),

                if (isSelected.value)
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

          Text(
            name,
            style: TextStyle(
              color: Color(0xFF666666),
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          )
        ],
      ),
    );
  }
}
