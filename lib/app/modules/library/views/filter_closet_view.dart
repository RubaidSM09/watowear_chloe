import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/custom_button.dart';

import '../../../../common/app_colors.dart';
import '../controllers/library_controller.dart';

class FilterClosetView extends GetView<LibraryController> {
  const FilterClosetView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LibraryController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.bgColor,
        title: Row(
          children: [
            Text('My Closet'),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 46.h,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Filter and sort',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp,
                        ),
                      ),

                      SizedBox(height: 25.h,),

                      Obx(() {
                        final sort = controller.selectedSort.value;

                        Widget buildChip({
                          required String label,
                          required String key,
                        }) {
                          final bool isSelected = sort == key;

                          return GestureDetector(
                            onTap: () {
                              controller.setSort(key);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primary : AppColors.bgColor,
                                borderRadius: BorderRadius.circular(1.r),
                                border: Border.all(
                                  color: AppColors.secondaryBg,
                                ),
                              ),
                              child: Text(
                                label,
                                style: TextStyle(
                                  color: isSelected
                                      ? AppColors.bgColor
                                      : AppColors.textIcons.withAlpha(179),
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          );
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildChip(label: 'Recommended', key: 'recommended'),
                            buildChip(label: 'Last added', key: 'last_added'),
                            buildChip(label: 'Favourites', key: 'favorites'),
                          ],
                        );
                      }),
                    ],
                  ),
                ),

                SizedBox(height: 22.h,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'CATEGORIES',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              controller.clearCategoryFilters();
                            },
                            child: Text(
                              'Clear All',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h,),

                      GestureDetector(
                        onTap: () {
                          controller.selectFilter(0);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 33.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F0F0),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Text(
                            'All',
                            style: TextStyle(
                              color: AppColors.textIcons.withAlpha(179),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),

                      controller.selectedFilter[0].value ? Column(
                        children: [
                          SizedBox(height: 25.h,),

                          Column(
                            spacing: 24.h,
                            children: [
                              CategoriesRow(
                                index: 0,
                                title: 'Clothing',
                                count: 176,
                                selectedCategory: controller.selectedCategory,
                                selectCategory: controller.selectCategory,
                              ),

                              if (controller.selectedCategory[0].value)
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Column(
                                    spacing: 16.h,
                                    children: [
                                      ClothingRow(
                                        index: 0,
                                        title: 'All',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 1,
                                        title: 'Coats and Jackets',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 2,
                                        title: 'Sweatshirts and Hoodies',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 3,
                                        title: 'Blazers and Suits',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 4,
                                        title: 'Dresses',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 5,
                                        title: 'Skirts',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 6,
                                        title: 'Tops and T-shirts',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 7,
                                        title: 'Jeans',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 8,
                                        title: 'Pants and Leggings',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 9,
                                        title: 'Shorts',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 10,
                                        title: 'Jumpsuits and Rompers',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 11,
                                        title: 'Swimwear',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 12,
                                        title: 'Lingerie and Pyjamas',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 13,
                                        title: 'Activewear',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),

                                      ClothingRow(
                                        index: 14,
                                        title: 'Other Clothing',
                                        selectedClothingCategory: controller.selectedClothingCategory,
                                        selectClothingCategory: controller.selectClothingCategory,
                                      ),
                                    ],
                                  ),
                                ),

                              CategoriesRow(
                                index: 1,
                                title: 'Shoes',
                                count: 176,
                                selectedCategory: controller.selectedCategory,
                                selectCategory: controller.selectCategory,
                              ),

                              if (controller.selectedCategory[1].value)
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Column(
                                    spacing: 16.h,
                                    children: [
                                      ShoesRow(
                                        index: 0,
                                        title: 'All',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 1,
                                        title: 'Ballet Flats',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 2,
                                        title: 'Boots',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 3,
                                        title: 'Espadrilles',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 4,
                                        title: 'Heels',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 5,
                                        title: 'Loafers and Boat Shoes',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 6,
                                        title: 'Lace-up Shoes',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 7,
                                        title: 'Mary Janes',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 8,
                                        title: 'Mules and Clogs',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 9,
                                        title: 'Slides and Flip-flops',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 10,
                                        title: 'Sandals',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 11,
                                        title: 'Slippers',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 12,
                                        title: 'Sneakers',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),

                                      ShoesRow(
                                        index: 13,
                                        title: 'Sports Shoes',
                                        selectedShoesCategory: controller.selectedShoesCategory,
                                        selectShoesCategory: controller.selectShoesCategory,
                                      ),
                                    ],
                                  ),
                                ),

                              CategoriesRow(
                                index: 2,
                                title: 'Bags',
                                count: 176,
                                selectedCategory: controller.selectedCategory,
                                selectCategory: controller.selectCategory,
                              ),

                              if (controller.selectedCategory[2].value)
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Column(
                                    spacing: 16.h,
                                    children: [
                                      BagsRow(
                                        index: 0,
                                        title: 'All',
                                        selectedBagsCategory: controller.selectedBagsCategory,
                                        selectBagsCategory: controller.selectBagsCategory,
                                      ),

                                      BagsRow(
                                        index: 1,
                                        title: 'Bucket Bags',
                                        selectedBagsCategory: controller.selectedBagsCategory,
                                        selectBagsCategory: controller.selectBagsCategory,
                                      ),

                                      BagsRow(
                                        index: 2,
                                        title: 'Belt Bags',
                                        selectedBagsCategory: controller.selectedBagsCategory,
                                        selectBagsCategory: controller.selectBagsCategory,
                                      ),

                                      BagsRow(
                                        index: 3,
                                        title: 'Clutches',
                                        selectedBagsCategory: controller.selectedBagsCategory,
                                        selectBagsCategory: controller.selectBagsCategory,
                                      ),

                                      BagsRow(
                                        index: 4,
                                        title: 'Crossbody Bags',
                                        selectedBagsCategory: controller.selectedBagsCategory,
                                        selectBagsCategory: controller.selectBagsCategory,
                                      ),

                                      BagsRow(
                                        index: 5,
                                        title: 'Garment Bags',
                                        selectedBagsCategory: controller.selectedBagsCategory,
                                        selectBagsCategory: controller.selectBagsCategory,
                                      ),

                                      BagsRow(
                                        index: 6,
                                        title: 'Gym Bags',
                                        selectedBagsCategory: controller.selectedBagsCategory,
                                        selectBagsCategory: controller.selectBagsCategory,
                                      ),

                                      BagsRow(
                                        index: 7,
                                        title: 'Handbags',
                                        selectedBagsCategory: controller.selectedBagsCategory,
                                        selectBagsCategory: controller.selectBagsCategory,
                                      ),

                                      BagsRow(
                                        index: 8,
                                        title: 'Shoulder Bags',
                                        selectedBagsCategory: controller.selectedBagsCategory,
                                        selectBagsCategory: controller.selectBagsCategory,
                                      ),

                                      BagsRow(
                                        index: 9,
                                        title: 'Tote Bags',
                                        selectedBagsCategory: controller.selectedBagsCategory,
                                        selectBagsCategory: controller.selectBagsCategory,
                                      ),
                                    ],
                                  ),
                                ),

                              CategoriesRow(
                                index: 3,
                                title: 'Accessories',
                                count: 199,
                                selectedCategory: controller.selectedCategory,
                                selectCategory: controller.selectCategory,
                              ),

                              if (controller.selectedCategory[3].value)
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Column(
                                    spacing: 16.h,
                                    children: [
                                      AccessoriesRow(
                                        index: 0,
                                        title: 'All',
                                        selectedAccessoriesCategory: controller.selectedAccessoriesCategory,
                                        selectAccessoriesCategory: controller.selectAccessoriesCategory,
                                      ),

                                      AccessoriesRow(
                                        index: 1,
                                        title: 'Hair Scarves and Bandanas',
                                        selectedAccessoriesCategory: controller.selectedAccessoriesCategory,
                                        selectAccessoriesCategory: controller.selectAccessoriesCategory,
                                      ),

                                      AccessoriesRow(
                                        index: 2,
                                        title: 'Belts',
                                        selectedAccessoriesCategory: controller.selectedAccessoriesCategory,
                                        selectAccessoriesCategory: controller.selectAccessoriesCategory,
                                      ),

                                      AccessoriesRow(
                                        index: 3,
                                        title: 'Gloves',
                                        selectedAccessoriesCategory: controller.selectedAccessoriesCategory,
                                        selectAccessoriesCategory: controller.selectAccessoriesCategory,
                                      ),

                                      AccessoriesRow(
                                        index: 4,
                                        title: 'Hair Accessories',
                                        selectedAccessoriesCategory: controller.selectedAccessoriesCategory,
                                        selectAccessoriesCategory: controller.selectAccessoriesCategory,
                                      ),

                                      AccessoriesRow(
                                        index: 5,
                                        title: 'Pocket Squares',
                                        selectedAccessoriesCategory: controller.selectedAccessoriesCategory,
                                        selectAccessoriesCategory: controller.selectAccessoriesCategory,
                                      ),

                                      AccessoriesRow(
                                        index: 6,
                                        title: 'Hats and Caps',
                                        selectedAccessoriesCategory: controller.selectedAccessoriesCategory,
                                        selectAccessoriesCategory: controller.selectAccessoriesCategory,
                                      ),

                                      AccessoriesRow(
                                        index: 7,
                                        title: 'Jewelry',
                                        selectedAccessoriesCategory: controller.selectedAccessoriesCategory,
                                        selectAccessoriesCategory: controller.selectAccessoriesCategory,
                                      ),

                                      AccessoriesRow(
                                        index: 8,
                                        title: 'Scarves and Shawls',
                                        selectedAccessoriesCategory: controller.selectedAccessoriesCategory,
                                        selectAccessoriesCategory: controller.selectAccessoriesCategory,
                                      ),

                                      AccessoriesRow(
                                        index: 9,
                                        title: 'Sunglasses',
                                        selectedAccessoriesCategory: controller.selectedAccessoriesCategory,
                                        selectAccessoriesCategory: controller.selectAccessoriesCategory,
                                      ),

                                      AccessoriesRow(
                                        index: 10,
                                        title: 'Watches',
                                        selectedAccessoriesCategory: controller.selectedAccessoriesCategory,
                                        selectAccessoriesCategory: controller.selectAccessoriesCategory,
                                      ),

                                      AccessoriesRow(
                                        index: 11,
                                        title: 'Other Accessories',
                                        selectedAccessoriesCategory: controller.selectedAccessoriesCategory,
                                        selectAccessoriesCategory: controller.selectAccessoriesCategory,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          )
                        ],
                      ) : SizedBox.shrink(),
                    ],
                  ),
                ),

                SizedBox(height: 19.h,),

                Divider(
                  color: Colors.black.withAlpha(61),
                ),

                SizedBox(height: 32.h,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'COLORS',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              controller.clearColorFilters();
                            },
                            child: Text(
                              'Clear All',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h,),

                      GestureDetector(
                        onTap: () {
                          controller.selectFilter(1);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 33.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F0F0),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Text(
                            'All',
                            style: TextStyle(
                              color: AppColors.textIcons.withAlpha(179),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),

                      controller.selectedFilter[1].value ? Column(
                        children: [
                          SizedBox(height: 25.h,),

                          Column(
                            spacing: 24.h,
                            children: [
                              ColorsRow(
                                index: 0,
                                title: 'Animal Print',
                                colorImage: 'assets/images/library/animal_print.png',
                                count: 11,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 1,
                                title: 'Black',
                                count: 229,
                                color: Colors.black,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 2,
                                title: 'Blue',
                                color: Color(0xFF2D77D1),
                                count: 76,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 3,
                                title: 'Brown',
                                color: Color(0xFF7B4C3C),
                                count: 196,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 4,
                                title: 'Burgundy',
                                color: Color(0xFF963646),
                                count: 62,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 5,
                                title: 'Cream',
                                count: 21,
                                color: Color(0xFFECE9C1),
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 6,
                                title: 'Ecru',
                                color: Color(0xFFDED3C8),
                                count: 3,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 7,
                                title: 'Gold',
                                color: Color(0xFFAF7C34),
                                count: 35,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 8,
                                title: 'Gray',
                                color: Color(0xFF949494),
                                count: 62,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 9,
                                title: 'Green',
                                count: 15,
                                color: Color(0xFF408C07),
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 10,
                                title: 'Ivary',
                                color: Color(0xFFFFFEEF),
                                count: 21,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 11,
                                title: 'Metallic',
                                colorImage: 'assets/images/library/metalic.png',
                                count: 5,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 12,
                                title: 'Multi',
                                colorImage: 'assets/images/library/multi.png',
                                count: 28,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 13,
                                title: 'Natural',
                                count: 48,
                                color: Color(0xFFE3C2AE),
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 14,
                                title: 'Off-white',
                                color: Colors.white,
                                count: 12,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 15,
                                title: 'Red',
                                color: Color(0xFFDC2626),
                                count: 50,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 16,
                                title: 'Orange',
                                color: Color(0xFFF6923A),
                                count: 44,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 17,
                                title: 'Silver',
                                color: Color(0xFFB5BABA).withAlpha(110),
                                count: 44,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 18,
                                title: 'Yellow',
                                color: Color(0xFFFBE225),
                                count: 44,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 19,
                                title: 'Light blue',
                                count: 44,
                                color: Color(0xFF78D0E6),
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 20,
                                title: 'Khaki',
                                color: Color(0xFF60795C),
                                count: 44,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),

                              ColorsRow(
                                index: 21,
                                title: 'Dark blue',
                                color: Color(0xFF0E3174),
                                count: 44,
                                selectedColor: controller.selectedColor,
                                selectColor: controller.selectColor,
                              ),
                            ],
                          )
                        ],
                      ) : SizedBox.shrink(),
                    ],
                  ),
                ),

                SizedBox(height: 19.h,),

                Divider(
                  color: Colors.black.withAlpha(61),
                ),

                SizedBox(height: 32.h,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'STYLES',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              controller.clearStyleFilters();
                            },
                            child: Text(
                              'Clear All',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h,),

                      GestureDetector(
                        onTap: () {
                          controller.selectFilter(2);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 33.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F0F0),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Text(
                            'All',
                            style: TextStyle(
                              color: AppColors.textIcons.withAlpha(179),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),

                      controller.selectedFilter[2].value ? Column(
                        children: [
                          SizedBox(height: 25.h,),

                          Column(
                            spacing: 24.h,
                            children: [
                              StylesRow(
                                index: 0,
                                title: 'All',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 1,
                                title: 'Classic Chic',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 2,
                                title: 'Bohemian',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 3,
                                title: 'Streetwear/Urban',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 4,
                                title: 'Romantic/Feminine',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 5,
                                title: 'Avant-Garde/Edgy',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 6,
                                title: 'Preppy/Polished',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 7,
                                title: 'Minimalist',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 8,
                                title: 'Vintage/Retro',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 9,
                                title: 'Glamorous',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 10,
                                title: 'Sporty/Athleisure',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 11,
                                title: 'Artsy/Eclectic',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 12,
                                title: 'Casual/Laid-back',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),

                              StylesRow(
                                index: 13,
                                title: 'Rocker/Grunge',
                                selectedStyle: controller.selectedStyle,
                                selectStyle: controller.selectStyle,
                              ),
                            ],
                          )
                        ],
                      ) : SizedBox.shrink(),
                    ],
                  ),
                ),

                SizedBox(height: 19.h,),

                Divider(
                  color: Colors.black.withAlpha(61),
                ),

                SizedBox(height: 32.h,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w,),
                  child: CustomButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 48.w,
                      vertical: 12.h,
                    ),
                    color: AppColors.primary,
                    text: 'Apply',
                    textColor: Colors.white,
                    textSize: 16.sp,
                    onTap: () async {
                      // 1) Fetch items from server according to selected sort
                      await controller.fetchClosetItems();

                      // 2) Apply category / color / style filters on top of that list
                      controller.applyFilters();

                      // 3) Go back to LibraryView, which reads filteredClosetItems
                      Get.back();
                    },
                  ),
                ),

                SizedBox(height: 19.h,),
              ],
            );
          }),
        ),
      ),
    );
  }
}


class CategoriesRow extends StatelessWidget {
  final int index;
  final String title;
  final int count;
  final RxList<RxBool> selectedCategory;
  final void Function(int) selectCategory;

  const CategoriesRow({
    required this.index,
    required this.title,
    required this.count,
    required this.selectedCategory,
    required this.selectCategory,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 13.w,
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.textIcons,
                  ),
                ),
              ),

              Row(
                children: [
                  Text(
                    '$title     ',
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),

                  Text(
                    '($count)',
                    style: TextStyle(
                      color: Color(0xFF111111).withAlpha(87),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),

          GestureDetector(
            onTap: () {
              selectCategory(index);
            },
            child: Icon(
              selectedCategory[index].value
                  ? Icons.keyboard_arrow_down_rounded
                  : Icons.arrow_forward_ios,
              size: selectedCategory[index].value ? 30.r : 20.r,
              color: Color(0xFF111111),
            ),
          ),
        ],
      );
    });
  }
}


class ClothingRow extends StatelessWidget {
  final int index;
  final String title;
  final RxList<RxBool> selectedClothingCategory;
  final void Function(int) selectClothingCategory;

  const ClothingRow({
    required this.index,
    required this.title,
    required this.selectedClothingCategory,
    required this.selectClothingCategory,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        spacing: 13.w,
        children: [
          GestureDetector(
            onTap: () {
              selectClothingCategory(index);
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.textIcons,
                ),
                color: selectedClothingCategory[index].value ? AppColors.textIcons : Colors.transparent,
              ),
            ),
          ),

          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          )
        ],
      );
    });
  }
}


class ShoesRow extends StatelessWidget {
  final int index;
  final String title;
  final RxList<RxBool> selectedShoesCategory;
  final void Function(int) selectShoesCategory;

  const ShoesRow({
    required this.index,
    required this.title,
    required this.selectedShoesCategory,
    required this.selectShoesCategory,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        spacing: 13.w,
        children: [
          GestureDetector(
            onTap: () {
              selectShoesCategory(index);
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.textIcons,
                ),
                color: selectedShoesCategory[index].value ? AppColors.textIcons : Colors.transparent,
              ),
            ),
          ),

          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          )
        ],
      );
    });
  }
}


class BagsRow extends StatelessWidget {
  final int index;
  final String title;
  final RxList<RxBool> selectedBagsCategory;
  final void Function(int) selectBagsCategory;

  const BagsRow({
    required this.index,
    required this.title,
    required this.selectedBagsCategory,
    required this.selectBagsCategory,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        spacing: 13.w,
        children: [
          GestureDetector(
            onTap: () {
              selectBagsCategory(index);
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.textIcons,
                ),
                color: selectedBagsCategory[index].value ? AppColors.textIcons : Colors.transparent,
              ),
            ),
          ),

          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          )
        ],
      );
    });
  }
}


class AccessoriesRow extends StatelessWidget {
  final int index;
  final String title;
  final RxList<RxBool> selectedAccessoriesCategory;
  final void Function(int) selectAccessoriesCategory;

  const AccessoriesRow({
    required this.index,
    required this.title,
    required this.selectedAccessoriesCategory,
    required this.selectAccessoriesCategory,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        spacing: 13.w,
        children: [
          GestureDetector(
            onTap: () {
              selectAccessoriesCategory(index);
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.textIcons,
                ),
                color: selectedAccessoriesCategory[index].value ? AppColors.textIcons : Colors.transparent,
              ),
            ),
          ),

          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          )
        ],
      );
    });
  }
}


class ColorsRow extends StatelessWidget {
  final int index;
  final String title;
  final String? colorImage;
  final Color? color;
  final int count;
  final RxList<RxBool> selectedColor;
  final void Function(int) selectColor;

  const ColorsRow({
    required this.index,
    required this.title,
    this.colorImage,
    this.color,
    required this.count,
    required this.selectedColor,
    required this.selectColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 13.w,
            children: [
              GestureDetector(
                onTap: () {
                  selectColor(index);
                },
                child: selectedColor[index].value ? Icon(
                  Icons.check_box_rounded,
                  size: 25.r,
                  color: AppColors.textIcons,
                ) :
                Icon(
                  Icons.check_box_outline_blank_rounded,
                  size: 25.r,
                  color: AppColors.textIcons,
                ),
              ),

              colorImage != null ? Image.asset(
                colorImage!,
                scale: 4,
              ) : Container(
                padding: EdgeInsets.all(12.5.r),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(64),
                      blurRadius: 4.r,
                      offset: Offset(0.w, 4.h),
                    ),
                  ],
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),

              Row(
                children: [
                  Text(
                    '$title     ',
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),

                  Text(
                    '($count)',
                    style: TextStyle(
                      color: Color(0xFF111111).withAlpha(87),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}


class StylesRow extends StatelessWidget {
  final int index;
  final String title;
  final RxList<RxBool> selectedStyle;
  final void Function(int) selectStyle;

  const StylesRow({
    required this.index,
    required this.title,
    required this.selectedStyle,
    required this.selectStyle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        spacing: 13.w,
        children: [
          GestureDetector(
            onTap: () {
              selectStyle(index);
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.textIcons,
                ),
                color: selectedStyle[index].value ? AppColors.textIcons : Colors.transparent,
              ),
            ),
          ),

          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          )
        ],
      );
    });
  }
}
