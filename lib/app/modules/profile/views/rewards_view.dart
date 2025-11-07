import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/rewards_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class RewardsView extends GetView {
  const RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    final RewardsController controller = Get.put(RewardsController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'My Rewards',
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
              SizedBox(height: 53.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/onboarding/watowear_word_logo.png',
                      scale: 6,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'At WATOWEAR we celebrate your style journey with simple milestones, earning badges and insights as you rediscover your wardrobe and make it uniquely yours.',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w300,
                        fontSize: 18.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 33.h),

              /// Rewards list
              Obx(
                    () => Column(
                  children: List.generate(
                    controller.rewards.length,
                        (index) => _RewardTile(
                      data: controller.rewards[index],
                      onTap: () => controller.toggleExpansion(index),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RewardTile extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onTap;

  const _RewardTile({
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool rxExpanded = data['isExpanded'] as RxBool;
    final bool isExpanded = rxExpanded.value;
    final Color color = data['color'] as Color;
    final String title = data['title'] as String;
    final String subtitle = data['subtitle'] as String;
    final List<String> tasks = List<String>.from(data['tasks'] as List);
    final List<String> rewards = List<String>.from(data['rewards'] as List);

    return Obx(
          () => Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            InkWell(
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 18.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w300,
                              fontSize: 13.sp,
                              color: AppColors.textIcons,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),

            /// Expanded Section
            if (rxExpanded.value)
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ✅ TASKS SECTION (white background)
                    Padding(
                      padding: EdgeInsets.fromLTRB(26.w, 12.h, 26.w, 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(tasks.length, (i) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: Text(
                                '${i + 1}. ${tasks[i]}',
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),

                    /// ✅ REWARDS HEADER SECTION (tier color)
                    Container(
                      width: double.infinity,
                      color: color, // <- tier color background
                      padding: EdgeInsets.fromLTRB(26.w, 12.h, 26.w, 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rewards',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Benefits unlock upon completion',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                              color: AppColors.textIcons,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// ✅ REWARD POINTS SECTION (white background)
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(26.w, 12.h, 26.w, 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(rewards.length, (i) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 6.h),
                              child: Text(
                                '${i + 1}. ${rewards[i]}',
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
