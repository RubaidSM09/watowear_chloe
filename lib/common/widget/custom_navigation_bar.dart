import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../../app/modules/dashboard/controllers/dashboard_controller.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    final List<Map<String, String>> navItems = [
      {
        'label': 'Home',
        'icon': 'assets/images/bottom_navigation_bar/home.png',
      },
      {
        'label': 'Generate',
        'icon': 'assets/images/bottom_navigation_bar/generate.png',
      },
      {
        'label': 'Menu',
        'icon': 'assets/images/bottom_navigation_bar/menu.png',
      },
      {
        'label': 'Library',
        'icon': 'assets/images/bottom_navigation_bar/library.png',
      },
      {
        'label': 'Profile',
        'icon': 'assets/images/bottom_navigation_bar/profile.png',
      },
    ];

    return SafeArea(
      child: Container(
        height: 91.h, // Set the desired height
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(navItems.length, (index) {
            final item = navItems[index];
            return GestureDetector(
              onTap: () => controller.updateIndex(index),
              child: Obx(() {
                final isSelected = index == controller.currentIndex.value;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  // padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200), // Smooth transition duration
                    transitionBuilder: (child, animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            item['icon']!,
                            scale: 4,
                            key: ValueKey('${item['label']}_$isSelected'),
                          ),
                        ),
                        SizedBox(height: 6.h,),
                        item['label'] != '' ?
                        Text(
                          item['label']!,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Colors.black
                          ),
                        ) : SizedBox.shrink(),
                      ],
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}
