import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/profile_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import 'package:watowear_chloe/common/custom_button.dart';

import '../controllers/badges_controller.dart';

class BadgesView extends GetView<ProfileController> {
  final String badgeType;

  const BadgesView({
    required this.badgeType,
    super.key
  });
  @override
  Widget build(BuildContext context) {
    if (badgeType == 'Refiner') {
      controller.selectBadge(0);
    } else if (badgeType == 'Curator') {
      controller.selectBadge(1);
    } else if (badgeType == 'Connaisseur') {
      controller.selectBadge(2);
    } else if (badgeType == 'Couture Insider') {
      controller.selectBadge(3);
    } else {
      controller.selectBadge(0);
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        scrolledUnderElevation: 0,
        title: Text(
          badgeType,
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
              BadgeInfoSection(
                index: 0,
                badgeType: 'Refiner',
                objectives: [
                  {
                    'title': 'Upload 25 wardrobe items',
                    'isClickable': false,
                  },
                  {
                    'title': 'Give feedback on 10 outfit suggestions',
                    'isClickable': false,
                  },
                  {
                    'title': 'Invite 3 friends',
                    'isClickable': false,
                  },
                  {
                    'title': 'Complete 2 missions',
                    'isClickable': true,
                  },
                ],
                rewards: [
                  {
                    'title': 'Welcome Reward',
                    'subtitle': 'ndjksjkjfbsjdjfhzdnkjnfkchdznfcjckhuhikherfhndhfjbjkjhhbdfkvhuifdyi!quoiiyfgiuzdh',
                  },
                  {
                    'title': 'Birthday Reward',
                    'subtitle': 'ndjksjkjfbsjdjfhzdnkjnfkchdznfcjckhuhikherfhndhfjbjkjhhbdfkvhuifdyi!quoiiyfgiuzdh',
                  },
                  {
                    'title': 'Exclusive Reward',
                    'subtitle': 'ndjksjkjfbsjdjfhzdnkjnfkchdznfcjckhuhikherfhndhfjbjkjhhbdfkvhuifdyi!quoiiyfgiuzdh',
                  },
                ],
                selectedBadge: controller.selectedBadge,
                selectBadge: controller.selectBadge,
              ),

              BadgeInfoSection(
                index: 1,
                badgeType: 'Curator',
                objectives: [
                  {
                    'title': 'Upload 25 wardrobe items',
                    'isClickable': false,
                  },
                  {
                    'title': 'Give feedback on 10 outfit suggestions',
                    'isClickable': false,
                  },
                  {
                    'title': 'Invite 3 friends',
                    'isClickable': false,
                  },
                  {
                    'title': 'Complete 2 missions',
                    'isClickable': true,
                  },
                ],
                rewards: [
                  {
                    'title': 'All the refiner rewards',
                    'subtitle': 'ndjksjkjfbsjdjfhzdnkjnfkchdznfcjckhuhikherfhndhfjbjkjhhbdfkvhuifdyi!quoiiyfgiuzdh',
                  },
                  {
                    'title': 'Birthday Reward',
                    'subtitle': 'ndjksjkjfbsjdjfhzdnkjnfkchdznfcjckhuhikherfhndhfjbjkjhhbdfkvhuifdyi!quoiiyfgiuzdh',
                  },
                  {
                    'title': 'Exclusive Reward',
                    'subtitle': 'ndjksjkjfbsjdjfhzdnkjnfkchdznfcjckhuhikherfhndhfjbjkjhhbdfkvhuifdyi!quoiiyfgiuzdh',
                  },
                ],
                selectedBadge: controller.selectedBadge,
                selectBadge: controller.selectBadge,
              ),

              BadgeInfoSection(
                index: 2,
                badgeType: 'Connaisseur',
                objectives: [
                  {
                    'title': 'Upload 25 wardrobe items',
                    'isClickable': false,
                  },
                  {
                    'title': 'Give feedback on 10 outfit suggestions',
                    'isClickable': false,
                  },
                  {
                    'title': 'Invite 3 friends',
                    'isClickable': false,
                  },
                  {
                    'title': 'Complete 2 missions',
                    'isClickable': true,
                  },
                ],
                rewards: [
                  {
                    'title': 'All the curator rewards',
                    'subtitle': 'ndjksjkjfbsjdjfhzdnkjnfkchdznfcjckhuhikherfhndhfjbjkjhhbdfkvhuifdyi!quoiiyfgiuzdh',
                  },
                  {
                    'title': 'Birthday Reward',
                    'subtitle': 'ndjksjkjfbsjdjfhzdnkjnfkchdznfcjckhuhikherfhndhfjbjkjhhbdfkvhuifdyi!quoiiyfgiuzdh',
                  },
                  {
                    'title': 'Exclusive Reward',
                    'subtitle': 'ndjksjkjfbsjdjfhzdnkjnfkchdznfcjckhuhikherfhndhfjbjkjhhbdfkvhuifdyi!quoiiyfgiuzdh',
                  },
                ],
                selectedBadge: controller.selectedBadge,
                selectBadge: controller.selectBadge,
              ),

              BadgeInfoSection(
                index: 3,
                badgeType: 'Couture Insider',
                objectives: [
                  {
                    'title': 'Upload 25 wardrobe items',
                    'isClickable': false,
                  },
                  {
                    'title': 'Give feedback on 10 outfit suggestions',
                    'isClickable': false,
                  },
                  {
                    'title': 'Invite 3 friends',
                    'isClickable': false,
                  },
                  {
                    'title': 'Complete 2 missions',
                    'isClickable': true,
                  },
                ],
                rewards: [
                  {
                    'title': 'All the connaisseur rewards',
                    'subtitle': 'ndjksjkjfbsjdjfhzdnkjnfkchdznfcjckhuhikherfhndhfjbjkjhhbdfkvhuifdyi!quoiiyfgiuzdh',
                  },
                  {
                    'title': 'Birthday Reward',
                    'subtitle': 'ndjksjkjfbsjdjfhzdnkjnfkchdznfcjckhuhikherfhndhfjbjkjhhbdfkvhuifdyi!quoiiyfgiuzdh',
                  },
                  {
                    'title': 'Exclusive Reward',
                    'subtitle': 'ndjksjkjfbsjdjfhzdnkjnfkchdznfcjckhuhikherfhndhfjbjkjhhbdfkvhuifdyi!quoiiyfgiuzdh',
                  },
                ],
                selectedBadge: controller.selectedBadge,
                selectBadge: controller.selectBadge,
              ),

              SizedBox(height: 44.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  spacing: 6.h,
                  children: [
                    Text(
                      'Step into your personal style library',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),

                    Text(
                      'Browse over 5,000 timeless pieces curated to match your style, your body, and your wardrobe. and add them seamlessly to your digital closet.',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Image.asset(
                  'assets/images/profile/personal_style_library.png',
                  scale: 4,
                ),
              ),

              SizedBox(height: 32.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 57.1.w,
                      vertical: 16.67.h,
                    ),
                    color: Colors.black,
                    text: 'Explore',
                    textColor: Colors.white,
                    textSize: 18.sp,
                    onTap: () {  },
                  ),
                ],
              ),

              SizedBox(height: 64.h,),
            ],
          ),
        ),
      ),
    );
  }
}


class BadgeInfoSection extends StatelessWidget {
  final int index;
  final String badgeType;
  final List<Map<String, dynamic>> objectives;
  final List<Map<String, String>> rewards;
  final RxList<RxBool> selectedBadge;
  final void Function(int) selectBadge;

  const BadgeInfoSection({
    required this.index,
    required this.badgeType,
    required this.objectives,
    required this.rewards,
    required this.selectedBadge,
    required this.selectBadge,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          selectBadge(index);
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 37.h,),
              color: badgeType == 'Refiner' ? Color(0xFFFCF2E2).withAlpha(173)
                  :
              badgeType == 'Curator' ? Color(0xFFEFEFEF)
                  :
              badgeType == 'Connaisseur' ? Color(0xFFF8D8C3)
                  :
              badgeType == 'Couture Insider' ? Color(0xFFC28561)
                  :
              Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    badgeType == 'Refiner' ? 'Bronze – Refiner'
                        :
                    badgeType == 'Curator' ? 'Silver – Curator'
                        :
                    badgeType == 'Connaisseur' ? 'Gold – Connaisseur'
                        :
                    badgeType == 'Couture Insider'
                        ? 'Platinum – Couture Insider'
                        :
                    '',
                    style: TextStyle(
                      color: AppColors.textIcons,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                  ),

                  Icon(
                    selectedBadge[index].value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Color(0xFF111111),
                    size: 20.r,
                  )
                ],
              ),
            ),

            if (selectedBadge[index].value)
              Column(
              children: [
                SizedBox(height: 16.h,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: objectives.map((objective) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '• ${objective['title']}',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp,
                              decoration: objective['isClickable'] ? TextDecoration
                                  .underline : TextDecoration.none,
                            ),
                          ),

                          if (objective['isClickable'])
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.primary,
                              size: 20.r,
                            ),
                        ],
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: 56.h,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 25.h,),
                  color: badgeType == 'Refiner' ? Color(0xFFFCF2E2).withAlpha(173)
                      :
                  badgeType == 'Curator' ? Color(0xFFEFEFEF)
                      :
                  badgeType == 'Connaisseur' ? Color(0xFFF8D8C3)
                      :
                  badgeType == 'Couture Insider' ? Color(0xFFC28561)
                      :
                  Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        badgeType == 'Refiner' ? 'Refiner'
                            :
                        badgeType == 'Curator' ? 'Curator'
                            :
                        badgeType == 'Connaisseur' ? 'Connaisseur'
                            :
                        badgeType == 'Couture Insider' ? 'Couture Insider'
                            :
                        '',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),
                      ),

                      SizedBox(height: 13.h,),

                      Column(
                        spacing: 13.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: rewards.map((reward) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reward['title']!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                ),
                              ),

                              SizedBox(height: 8.h,),

                              Text(
                                reward['subtitle']!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
