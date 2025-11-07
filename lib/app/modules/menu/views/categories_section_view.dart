import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/menu/controllers/shop_controller.dart';
import 'package:watowear_chloe/app/modules/menu/views/categories_list_view.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_button.dart';

class CategoriesSectionView extends GetView<ShopController> {
  const CategoriesSectionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ----------------- MARQUEE TEXT -----------------
        SizedBox(
          height: 30.h,
          width: double.infinity,
          child: ClipRect(
            child: Obx(
                  () => Transform.translate(
                offset: Offset(controller.xOffset.value, 0),
                child: Text(
                  controller.marqueeText.value,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    color: AppColors.textIcons,
                    fontSize: 13.3.sp,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 14.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            spacing: 14.h,
            children: [
              CategoriesCard(
                image: 'assets/images/shop/categories/new_in.png',
                onTap: () {  },
              ),

              CategoriesCard(
                image: 'assets/images/shop/categories/clothing.png',
                onTap: () => Get.to(CategoriesListView(category: 'Clothing',)),
              ),

              CategoriesCard(
                image: 'assets/images/shop/categories/shoes.png',
                onTap: () => Get.to(CategoriesListView(category: 'Shoes',)),
              ),

              CategoriesCard(
                image: 'assets/images/shop/categories/bags.png',
                onTap: () => Get.to(CategoriesListView(category: 'Bags',)),
              ),

              CategoriesCard(
                image: 'assets/images/shop/categories/accessories.png',
                onTap: () => Get.to(CategoriesListView(category: 'Accessories',)),
              ),

              CategoriesCard(
                image: 'assets/images/shop/categories/editorial.png',
                onTap: () {  },
              ),

              CategoriesCard(
                image: 'assets/images/shop/categories/special_offers.png',
                onTap: () {  },
              ),
            ],
          ),
        ),

        SizedBox(height: 30.h),
      ],
    );
  }
}


class CategoriesCard extends StatelessWidget {
  final String image;
  final void Function()? onTap;

  const CategoriesCard({
    required this.image,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        image,
        scale: 4,
      ),
    );
  }
}
