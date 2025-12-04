import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/about_yourself/controllers/about_yourself_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class AboutYourself7View extends GetView<AboutYourselfController> {
  const AboutYourself7View({super.key});
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
                'Which vibes feel the most like you?',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),

              SizedBox(height: 24.h,),

              Column(
                spacing: 5.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Touch a card to select, max 3 styles.',
                    style: TextStyle(
                      color: Color(0xFF1F1F1F).withOpacity(0.6),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                  ),

                  Row(
                    spacing: 8.w,
                    children: [
                      Row(
                        spacing: 3.99.w,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 13.5.w, vertical: 8.h,),
                            decoration: BoxDecoration(
                              color: controller.vibeCount.value > 0 ? AppColors.primary : Colors.white,
                              border: Border.all(
                                color: Color(0xFF1F1F1F).withOpacity(0.2),
                              ),
                            ),
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: controller.vibeCount.value > 0 ? Colors.white : Color(0xFF1F1F1F).withOpacity(0.4),
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 13.5.w, vertical: 8.h,),
                            decoration: BoxDecoration(
                              color: controller.vibeCount.value > 1 ? AppColors.primary : Colors.white,
                              border: Border.all(
                                color: Color(0xFF1F1F1F).withOpacity(0.2),
                              ),
                            ),
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: controller.vibeCount.value > 1 ? Colors.white : Color(0xFF1F1F1F).withOpacity(0.4),
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 13.5.w, vertical: 8.h,),
                            decoration: BoxDecoration(
                              color: controller.vibeCount.value > 2 ? AppColors.primary : Colors.white,
                              border: Border.all(
                                color: Color(0xFF1F1F1F).withOpacity(0.2),
                              ),
                            ),
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: controller.vibeCount.value > 2 ? Colors.white : Color(0xFF1F1F1F).withOpacity(0.4),
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Text(
                        'No style selected',
                        style: TextStyle(
                          color: Color(0xFF1F1F1F).withOpacity(0.7),
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                        ),
                      )
                    ],
                  ),
                ],
              ),

              SizedBox(height: 23.h,),

              if (controller.selectedGender[2].value)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12.w,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.isWomenSelected.value = true;
                      },
                      child: Container(
                        width: 127.w,
                        height: 43.h,
                        decoration: BoxDecoration(
                          color: controller.isWomenSelected.value ? AppColors.primary : Colors.transparent,
                          border: controller.isWomenSelected.value ? null : Border.all(
                            color: Color(0xFFB0B0B0),
                            width: 0.71.r,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Women',
                            style: TextStyle(
                              color: controller.isWomenSelected.value ? Colors.white : Color(0xFF1F1F1F).withOpacity(0.7),
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
                        controller.isWomenSelected.value = false;
                      },
                      child: Container(
                        width: 127.w,
                        height: 43.h,
                        decoration: BoxDecoration(
                          color: !controller.isWomenSelected.value ? AppColors.primary : Colors.transparent,
                          border: !controller.isWomenSelected.value ? null : Border.all(
                            color: Color(0xFFB0B0B0),
                            width: 0.71.r,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Men',
                            style: TextStyle(
                              color: !controller.isWomenSelected.value ? Colors.white : Color(0xFF1F1F1F).withOpacity(0.7),
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

              if (controller.selectedGender[1].value || (controller.selectedGender[2].value && controller.isWomenSelected.value))
                Column(
                  spacing: 16.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VibeCard(
                          index: 0,
                          image: 'assets/images/about_yourself/vibes/female/classic_chic.png',
                          title: 'Classic Chic',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedWomenVibe[0],
                          select: controller.selectWomenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),

                        VibeCard(
                          index: 1,
                          image: 'assets/images/about_yourself/vibes/female/bohemian.png',
                          title: 'Bohemian',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedWomenVibe[1],
                          select: controller.selectWomenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VibeCard(
                          index: 2,
                          image: 'assets/images/about_yourself/vibes/female/streetwear_urban.png',
                          title: 'Streetwear / Urban',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedWomenVibe[2],
                          select: controller.selectWomenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),

                        VibeCard(
                          index: 3,
                          image: 'assets/images/about_yourself/vibes/female/romantic_feminine.png',
                          title: 'Romantic / Feminine',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedWomenVibe[3],
                          select: controller.selectWomenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VibeCard(
                          index: 4,
                          image: 'assets/images/about_yourself/vibes/female/edgy.png',
                          title: 'Avant-garde / Edgy',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedWomenVibe[4],
                          select: controller.selectWomenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),

                        VibeCard(
                          index: 5,
                          image: 'assets/images/about_yourself/vibes/female/minimalist.png',
                          title: 'Minimalist',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedWomenVibe[5],
                          select: controller.selectWomenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VibeCard(
                          index: 6,
                          image: 'assets/images/about_yourself/vibes/female/vintage_retro.png',
                          title: 'Vintage / Retro',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedWomenVibe[6],
                          select: controller.selectWomenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),

                        VibeCard(
                          index: 7,
                          image: 'assets/images/about_yourself/vibes/female/glamourous.png',
                          title: 'Glamourous',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedWomenVibe[7],
                          select: controller.selectWomenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VibeCard(
                          index: 8,
                          image: 'assets/images/about_yourself/vibes/female/athleisure.png',
                          title: 'Sporty / Athleisure',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedWomenVibe[8],
                          select: controller.selectWomenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),

                        VibeCard(
                          index: 9,
                          image: 'assets/images/about_yourself/vibes/female/eclectic.png',
                          title: 'Artsy / Eclectic',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedWomenVibe[9],
                          select: controller.selectWomenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VibeCard(
                          index: 10,
                          image: 'assets/images/about_yourself/vibes/female/grunge.png',
                          title: 'Rocker / Grunge',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedWomenVibe[10],
                          select: controller.selectWomenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),

                        VibeCard(
                          index: 11,
                          image: 'assets/images/about_yourself/vibes/female/polished.png',
                          title: 'Preppy / Polished',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedWomenVibe[11],
                          select: controller.selectWomenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),
                      ],
                    ),
                  ],
                ),

              if (controller.selectedGender[0].value || (controller.selectedGender[2].value && !controller.isWomenSelected.value))
                Column(
                  spacing: 16.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VibeCard(
                          index: 0,
                          image: 'assets/images/about_yourself/vibes/male/classic_chic.png',
                          title: 'Classic Chic',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedMenVibe[0],
                          select: controller.selectMenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),

                        VibeCard(
                          index: 1,
                          image: 'assets/images/about_yourself/vibes/male/bohemian.png',
                          title: 'Bohemian',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedMenVibe[1],
                          select: controller.selectMenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VibeCard(
                          index: 2,
                          image: 'assets/images/about_yourself/vibes/male/streetwear_urban.png',
                          title: 'Streetwear / Urban',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedMenVibe[2],
                          select: controller.selectMenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),

                        VibeCard(
                          index: 3,
                          image: 'assets/images/about_yourself/vibes/male/romantic_feminine.png',
                          title: 'Romantic / Feminine',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedMenVibe[3],
                          select: controller.selectMenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VibeCard(
                          index: 4,
                          image: 'assets/images/about_yourself/vibes/male/avant_garde_edgy.png',
                          title: 'Avant-garde / Edgy',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedMenVibe[4],
                          select: controller.selectMenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),

                        VibeCard(
                          index: 5,
                          image: 'assets/images/about_yourself/vibes/male/minimalist.png',
                          title: 'Minimalist',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedMenVibe[5],
                          select: controller.selectMenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VibeCard(
                          index: 6,
                          image: 'assets/images/about_yourself/vibes/male/vintage_retro.png',
                          title: 'Vintage / Retro',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedMenVibe[6],
                          select: controller.selectMenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),

                        VibeCard(
                          index: 7,
                          image: 'assets/images/about_yourself/vibes/male/glamourous.png',
                          title: 'Glamourous',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedMenVibe[7],
                          select: controller.selectMenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VibeCard(
                          index: 8,
                          image: 'assets/images/about_yourself/vibes/male/sporty_athleisure.png',
                          title: 'Sporty / Athleisure',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedMenVibe[8],
                          select: controller.selectMenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),

                        VibeCard(
                          index: 9,
                          image: 'assets/images/about_yourself/vibes/male/artsy_eclectic.png',
                          title: 'Artsy / Eclectic',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedMenVibe[9],
                          select: controller.selectMenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VibeCard(
                          index: 10,
                          image: 'assets/images/about_yourself/vibes/male/rocker_grunge.png',
                          title: 'Rocker / Grunge',
                          subtitle: 'Relaxed, artistic freedom,  flowing fabrics, earthy tones, and handcrafted textures that tell stories of travel and self-expression.',
                          isSelected: controller.selectedMenVibe[10],
                          select: controller.selectMenVibe,
                          isDisabled: controller.vibeCount.value > 2
                              ? true.obs
                              : false.obs,
                        ),
                      ],
                    ),
                  ],
                ),

              SizedBox(height: 16.h,),
            ],
          ),
        ),
      );
    });
  }
}


class VibeCard extends StatelessWidget {
  final int index;
  final String image;
  final String title;
  final String subtitle;
  final RxBool isSelected;
  final void Function(int)? select;
  final RxBool isDisabled;

  const VibeCard({
    required this.index,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.select,
    required this.isDisabled,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isDisabled.value && !isSelected.value) {
          Get.dialog(MagicNumberDialog());
        } else {
          select?.call(index);
        }
      },
      child: Obx(() {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: isSelected.value ? Border.all(
                  color: Colors.black,
                ) : null,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF1F1F1F).withOpacity(0.1),
                    spreadRadius: 1.r,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 9.01.w,
                          right: 9.01.w,
                          top: 7.79.h,
                          bottom: 188.21.h,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.0),
                            ],
                            begin: AlignmentGeometry.bottomCenter,
                            end: AlignmentGeometry.topCenter,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              image,
                            ),
                            scale: 4,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          spacing: 125.01.w,
                          children: [
                            GestureDetector(
                              onTap: () {  },
                              child: Image.asset(
                                'assets/images/about_yourself/vibes/info.png',
                                scale: 4,
                              ),
                            ),

                            Container(
                              width: 23.99.w,
                              height: 23.99.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected.value ? Colors.black : Colors.white,
                              ),
                              child: Icon(
                                Icons.check,
                                size: 14.r,
                                color: isSelected.value ? Colors.white : Colors.transparent,
                              ),
                            )
                          ],
                        ),
                      ),

                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.0),
                              ],
                              begin: AlignmentGeometry.bottomCenter,
                              end: AlignmentGeometry.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 11.11.h,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: AppColors.textIcons,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            if (isDisabled.value && !isSelected.value)
              Positioned.fill(
                child: Container(
                  color: AppColors.bgColor.withOpacity(0.5),
                ),
              ),
          ],
        );
      }),
    );
  }
}


class MagicNumberDialog extends GetView<AboutYourselfController> {
  const MagicNumberDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bgColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 67.h,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 20.r,
                  ),
                )
              ],
            ),

            SizedBox(height: 15.h,),

            Text(
              'Three’s the magic number',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),

            SizedBox(height: 15.h,),

            Text(
              'To keep your wardrobe suggestions\nbeautifully balanced, we recommend focusing\non up to three style vibes.\n\nWould you like to replace one?',
              style: TextStyle(
                color: Color(0xFF6F767E),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 26.h,),

            Row(
              spacing: 18.w,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.refineVibe();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          'Refine my vibes',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          'Keep my selection',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
