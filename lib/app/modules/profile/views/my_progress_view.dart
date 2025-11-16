import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/about_yourself/views/badges/views/badges_view.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/add_new_item_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/rewards_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import 'package:watowear_chloe/common/custom_button.dart';

import '../controllers/my_progress_controller.dart';

class MyProgressView extends GetView {
  const MyProgressView({super.key});
  @override
  Widget build(BuildContext context) {
    final myProgressController = Get.put(MyProgressController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'My Progress',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w,),
                child: Row(
                  spacing: 18.w,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          'assets/images/profile/profile_image.png',
                          scale: 4.75,
                        ),

                        Positioned(
                          top: 54.h,
                          left: 48.w,
                          child: Container(
                            padding: EdgeInsets.all(6.84.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                            child: SvgPicture.asset(
                              'assets/images/profile/camera.svg',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      spacing: 9.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MATHIEU PERIGNON',
                          style: TextStyle(
                            color: AppColors.textIcons,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 20.53.sp,
                          ),
                        ),

                        Obx(() {
                          final itemCount = myProgressController.itemCount;
                          final outfitCount = myProgressController.outfitFeedbackCount;
                          final inviteCount = myProgressController.inviteCount;

                          return Text(
                            '$itemCount Items . $outfitCount Outfit Feedback. $inviteCount \nInvite',
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                              fontSize: 15.96.sp,
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w,),
                child: Column(
                  children: [
                    Obx(() {
                      final percentage = myProgressController.progressPercentage;
                      final nextBadge = myProgressController.nextBadgeName;

                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 6.w,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.r),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xFFFDF6EC),
                                      border: Border.all(
                                        color: AppColors.secondaryBg,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    nextBadge,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.96.sp,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                '$percentage%',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              )
                            ],
                          ),

                          SizedBox(height: 11.h,),

                          LayoutBuilder(
                            builder: (context, constraints) {
                              final fullWidth = constraints.maxWidth;
                              final filledWidth =
                                  fullWidth * (percentage.clamp(0, 100) / 100.0);

                              return Container(
                                height: 3.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  color: AppColors.secondaryBg,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    height: 3.h,
                                    width: filledWidth,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.r),
                                      color: AppColors.textIcons,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }),

                    SizedBox(height: 13.h,),

                    Row(
                      children: [
                        CustomButton(
                          padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 12.h,),
                          color: AppColors.primary,
                          text: 'Get my reward ',
                          textColor: Colors.white,
                          textSize: 14.sp,
                          onTap: () {  },
                        ),
                      ],
                    ),

                    SizedBox(height: 34.h,),

                    Column(
                      spacing: 24.h,
                      children: [
                        MyProgressActionRow(
                          icon: 'assets/images/profile/add_new_item.svg',
                          text: 'Add a new Item',
                          onTap: () => Get.to(AddNewItemView()),
                        ),

                        MyProgressActionRow(
                          icon: 'assets/images/profile/recommend_app.svg',
                          text: 'Recommend our app',
                          onTap: () {  },
                        ),

                        MyProgressActionRow(
                          icon: 'assets/images/profile/view_missions.svg',
                          text: 'View missions',
                          onTap: () => Get.to(RewardsView()),
                        ),

                        MyProgressActionRow(
                          icon: 'assets/images/profile/feedback.svg',
                          text: 'Give feedback',
                          onTap: () {  },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 21.h,),
              
              Divider(
                color: AppColors.black.withAlpha(31),
              ),

              SizedBox(height: 23.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w,),
                child: Column(
                  spacing: 12.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Unlock Your Next Badge',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),

                    Text(
                      'The more you enrich your closet and complete style missions, the more exclusive badges you’ll unlock. It’s your journey, elegantly rewarded.',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F).withAlpha(179),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w300,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 26.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w,),
                child: Obx(() {
                  final levels = myProgressController.badgeLevels;

                  if (levels.isEmpty) {
                    return Column(
                      spacing: 24.h,
                      children: [
                        UnlockNextBadgeRow(
                          text: 'Refiner',
                          onTap: () => Get.to(BadgesView(badgeType: 'Refiner')),
                        ),
                        UnlockNextBadgeRow(
                          text: 'Curator',
                          onTap: () => Get.to(BadgesView(badgeType: 'Curator')),
                        ),
                        UnlockNextBadgeRow(
                          text: 'Connoisseur',
                          onTap: () => Get.to(BadgesView(badgeType: 'Connoisseur')),
                        ),
                        UnlockNextBadgeRow(
                          text: 'Couture Insider',
                          onTap: () => Get.to(BadgesView(badgeType: 'Couture Insider')),
                        ),
                      ],
                    );
                  }

                  return Column(
                    spacing: 24.h,
                    children: levels.map((badge) {
                      final name = badge.name ?? '';
                      return UnlockNextBadgeRow(
                        text: name,
                        onTap: () => Get.to(BadgesView(badgeType: name)),
                      );
                    }).toList(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyProgressActionRow extends StatelessWidget {
  final String icon;
  final String text;
  final void Function()? onTap;

  const MyProgressActionRow({
    required this.icon,
    required this.text,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        spacing: 5.w,
        children: [
          SvgPicture.asset(
            icon,
            color: AppColors.textIcons,
          ),

          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w300,
              fontSize: 16.sp,
            ),
          )
        ],
      ),
    );
  }
}


class UnlockNextBadgeRow extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UnlockNextBadgeRow({
    required this.text,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),

          Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF111111),
            size: 20.r,
          )
        ],
      ),
    );
  }
}
