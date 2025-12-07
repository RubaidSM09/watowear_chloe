import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/fashion_library/views/library_item_view.dart';
import 'package:watowear_chloe/common/custom_button.dart';

import '../../../../common/app_colors.dart';
import '../../../data/model/models/library_item.dart';
import '../controllers/fashion_library_controller.dart';
import 'filter_library_view.dart';

class FashionLibraryView extends GetView<FashionLibraryController> {
  const FashionLibraryView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FashionLibraryController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 32.h,),
        
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to your Fashion\nLibrary',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w600,
                        fontSize: 24.sp,
                      ),
                    ),
        
                    Image.asset(
                      'assets/images/fashion_library/search.png',
                      scale: 4,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 57.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w,),
                child: Text(
                  'Add items from our 5,000+ piece collection to reflect your wardrobe. Use it to quickly find lookalike pieces, save time, and inspire future styles.',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
              ),

              SizedBox(height: 30.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w,),
                child: Divider(
                  color: Colors.black.withOpacity(0.12),
                ),
              ),

              SizedBox(height: 36.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.w,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16.h,
                      children: [
                        Text(
                          '1. Add Items:',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Abhaya_Libre',
                            fontWeight: FontWeight.w800,
                            fontSize: 16.sp,
                          ),
                        ),

                        Text(
                          'Instantly include\nsimilar pieces to\nyour digital closet.',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16.h,
                      children: [
                        Text(
                          '1. Gain Inspiration:',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Abhaya_Libre',
                            fontWeight: FontWeight.w800,
                            fontSize: 16.sp,
                          ),
                        ),

                        Text(
                          'Browse and\ndiscover looks for\nyour next favorite\nfind.',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 48.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w,),
                child: Divider(
                  color: Colors.black.withOpacity(0.12),
                ),
              ),

              SizedBox(height: 53.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w,),
                child: Row(
                  spacing: 17.w,
                  children: [
                    GestureDetector(
                      onTap: () {  },
                      child: Text(
                        'Men',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {  },
                      child: Text(
                        'Women',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w,),
                child: Row(
                  children: [
                    Text(
                      'This month’s highlights',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w,),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 29.w,
                    children: [
                      MonthHighlightsCard(
                        image: 'assets/images/fashion_library/month_highlight_1.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                      ),

                      MonthHighlightsCard(
                        image: 'assets/images/fashion_library/month_highlight_2.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 76.h,),

              Center(
                child: Container(
                  width: 104.w,
                  height: 1.h,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBg,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 46.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: AppColors.textIcons,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 65.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Choose from + 5000 Items',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        controller.isMultipleSelected.value = !controller.isMultipleSelected.value;
                      },
                      child: Image.asset(
                        'assets/images/fashion_library/multiple.png',
                        scale: 4,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 39.h,),

              Obx(() {
                if (controller.isLoading.value) {
                  return Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (controller.errorMessage.isNotEmpty) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                    child: Column(
                      children: [
                        Text(
                          controller.errorMessage.value,
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        GestureDetector(
                          onTap: controller.fetchLibraryItems,
                          child: Text(
                            'Tap to retry',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (controller.filteredLibraryItems.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                    child: Text(
                      'No items found in the library yet.',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  );
                }

                return Wrap(
                  spacing: 29.w,
                  runSpacing: 40.h,
                  children: controller.filteredLibraryItems.map((item) {
                    final String title =
                    (item.subcategory?.isNotEmpty == true)
                        ? item.subcategory!
                        : (item.itemType ?? 'Item');

                    final String subtitle =
                    (item.style != null && item.formality != null)
                        ? '${item.style!.trim().isNotEmpty ? item.style : ''}'
                        '${item.style != null && item.formality != null ? ' · ' : ''}'
                        '${item.formality}'
                        : (item.style ?? item.formality ?? 'From your library');

                    return FashionLibraryCard(
                      image: item.imageUrl,
                      title: title,
                      subtitle: subtitle,
                      isMultipleSelected: controller.isMultipleSelected,
                      item: item,
                    );
                  }).toList(),
                );
              }),

              SizedBox(height: 85.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w,),
                child: CustomButton(
                  padding: EdgeInsets.symmetric(vertical: 12.h,),
                  color: AppColors.primary,
                  text: 'Add to my closet',
                  textColor: Colors.white,
                  textSize: 16.sp,
                  onTap: () async {
                    final success = await controller.addSelectedItemsToCloset();

                    if (!success) {
                      if (controller.selectedItemIds.value.isEmpty) {
                        Get.snackbar(
                          'No items selected',
                          'Please select at least one item to add.',
                        );
                      } else {
                        Get.snackbar(
                          'Error',
                          'Failed to add some items to your closet. Please try again.',
                        );
                      }
                    } else {
                      Get.dialog(const LibraryItemAddedDialog());
                    }
                  },
                ),
              ),

              SizedBox(height: 24.h,),
            ],
          ),
        ),
      ),

      floatingActionButton: GestureDetector(
        onTap: () => Get.to(FilterLibraryView()),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/library/filter.png',
            scale: 4,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


class MonthHighlightsCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const MonthHighlightsCard({
    required this.image,
    required this.title,
    required this.subtitle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 183.w,
          height: 200.h,
          child: Image.asset(
            image,
            scale: 4,
            fit: BoxFit.contain,
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w,),
          child: SizedBox(
            width: 163.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6.h,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF4A4A4A),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 17.73.sp,
                  ),
                ),

                Text(
                  subtitle,
                  style: TextStyle(
                    color: Color(0xFF858585),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 13.3.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class FashionLibraryCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final RxBool isMultipleSelected;
  final RxBool isSelected;
  final LibraryItem item;

  final FashionLibraryController _controller = Get.find<FashionLibraryController>();

  FashionLibraryCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.isMultipleSelected,
    required this.item,
    super.key,
  }) : isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () => Get.to(() => LibraryItemView(item: item)),
        child: Column(
          spacing: 6.h,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 183.w,
                  height: 200.h,
                  child: image.startsWith('http')
                      ? Image.network(
                    image,
                    fit: BoxFit.fill,
                  )
                      : Image.asset(
                    image,
                    scale: 4,
                    fit: BoxFit.contain,
                  ),
                ),

                if (isMultipleSelected.value)
                  Positioned(
                    right: 14.w,
                    top: 13.h,
                    child: GestureDetector(
                      onTap: () {
                        isSelected.value = !isSelected.value;

                        // 👇 NEW: update controller with current selection state
                        final itemId = item.id;
                        if (itemId != null) {
                          _controller.toggleItemSelection(
                            itemId,
                            isSelected.value,
                          );
                        }
                      },
                      child: Container(
                        width: 15.w,
                        height: 15.h,
                        decoration: BoxDecoration(
                          color: isSelected.value ? Colors.white : Colors.transparent,
                          shape: BoxShape.circle,
                          border: isSelected.value
                              ? null
                              : Border.all(
                            color: AppColors.textIcons,
                            width: 0.5.r,
                          ),
                        ),
                        child: isSelected.value
                            ? Icon(
                          Icons.check,
                          color: Colors.black,
                          size: 13.r,
                        )
                            : null,
                      ),
                    ),
                  )
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(
                width: 163.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xFF4A4A4A),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.73.sp,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: const Color(0xFF858585),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.3.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
