import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:watowear_chloe/app/modules/dashboard/views/dashboard_view.dart';

import 'package:watowear_chloe/app/modules/menu/controllers/shop_controller.dart';
import 'package:watowear_chloe/app/modules/menu/views/brands_section_view.dart';
import 'package:watowear_chloe/app/modules/menu/views/categories_section_view.dart';
import 'package:watowear_chloe/app/modules/menu/views/editorial_section_view.dart';
import 'package:watowear_chloe/app/modules/menu/views/new_in_section_view.dart';
import 'package:watowear_chloe/app/modules/menu/views/shop_section_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../../../../common/custom_button.dart';
import 'editorial_filter_view.dart';

class ShopView extends GetView<ShopController> {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    // ❌ Remove this, controller should be provided via bindings/routes:
    Get.put(ShopController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                final dashboardController = Get.put(DashboardController());
                dashboardController.currentIndex.value = 0;
                Get.to(DashboardView());
              },
              child: Image.asset(
                'assets/images/onboarding/watowear_word_logo.png',
                scale: 8,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 25.r,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
                () {
              return Column(
                children: [
                  // ----------------- TAB ROW -----------------
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _spacer(),
                          _tabItem('Shop', 0),
                          _spacer(),
                          _tabItem('New In', 1),
                          _spacer(),
                          _tabItem('Categories', 2),
                          _spacer(),
                          _tabItem('Brands', 3),
                          _spacer(),
                          _tabItem('Editorial', 4),
                          _spacer(),
                          _tabItem('Closet', 5),
                          _spacer(),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 6.h),

                  if (controller.selectedTab[0].value)
                    ShopSectionView(),

                  if (controller.selectedTab[1].value)
                    NewInSectionView(),

                  if (controller.selectedTab[2].value)
                    CategoriesSectionView(),

                  if (controller.selectedTab[3].value)
                    BrandsSectionView(),

                  if (controller.selectedTab[4].value)
                    EditorialSectionView(),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: controller.selectedTab[4].value ? GestureDetector(
        onTap: () => Get.to(EditorialFilterView()),
        child: Image.asset(
          'assets/images/editorial/editorial_floating_button.png',
          scale: 4,
        ),
      ) : null,
    );
  }

  // ----------------- Helpers -----------------
  Widget _spacer() {
    return Container(
      width: 17.w,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.secondaryBg,
          ),
        ),
      ),
      child: Text(
        '',
        style: TextStyle(
          color: const Color(0xFF1F1F1F),
          fontFamily: 'Comfortaa',
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
      ),
    );
  }

  Widget _tabItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        controller.selectTab(index);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: controller.selectedTab[index].value
                  ? AppColors.textIcons
                  : AppColors.secondaryBg,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: const Color(0xFF1F1F1F),
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
