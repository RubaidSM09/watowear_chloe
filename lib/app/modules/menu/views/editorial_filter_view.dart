import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/menu/controllers/shop_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class EditorialFilterView extends GetView<ShopController> {
  const EditorialFilterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Editorial',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
              ),
            ),

            GestureDetector(
              onTap: () {
                final TextEditingController textController = TextEditingController();

                Get.dialog(
                  Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Search by tag',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          TextField(
                            controller: textController,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: 'e.g. fashion, winter, style',
                              hintStyle: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: 12.sp,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 10.h,
                              ),
                            ),
                            onSubmitted: (value) {
                              controller.searchEditorialByTag(value);
                              Get.back();
                            },
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => Get.back(),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontSize: 12.sp,
                                    color: AppColors.textIcons,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              TextButton(
                                onPressed: () {
                                  controller.searchEditorialByTag(textController.text);
                                  Get.back();
                                },
                                child: Text(
                                  'Search',
                                  style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.search,
                size: 25.r,
                color: AppColors.black,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: AppColors.secondaryBg,
              ),

              SizedBox(height: 53.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 31.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 50.h,
                  children: controller.editorialCategories.map((editorialCategory) {
                    return GestureDetector(
                      onTap: () {
                        // Map UI label -> API category slug
                        final apiCategory =
                        controller.editorialApiCategoryFromLabel(editorialCategory);

                        // Fetch articles for that category (or all if null)
                        controller.fetchEditorialArticles(category: apiCategory);

                        // Close filter screen
                        Get.back();
                      },
                      child: Text(
                        editorialCategory,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
