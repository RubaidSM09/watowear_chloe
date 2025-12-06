import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../../../../common/custom_button.dart';
import '../../../data/model/models/library_item.dart';

class LibraryItemView extends StatelessWidget {
  final LibraryItem item;

  const LibraryItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back,
                size: 30.r,
                color: AppColors.textIcons,
              ),
            ),
            Row(
              spacing: 15.w,
              children: [
                Image.asset(
                  'assets/images/fashion_library/search.png',
                  scale: 4,
                ),
                Icon(
                  Icons.favorite_border_rounded,
                  color: const Color(0xFF141B34),
                  size: 30.r,
                )
              ],
            )
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 588.h,
                  color: const Color(0xFFF2F2F2).withOpacity(0.71),
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  right: 14.w,
                  bottom: 8.h,
                  child: Row(
                    spacing: 5.w,
                    children: [
                      Container(
                        width: 132.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: const Color(0xFFF1F1EF),
                        ),
                        child: Center(
                          child: Text(
                            'You may also like',
                            style: TextStyle(
                              color: AppColors.textIcons,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFECEAE9),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/images/fashion_library/hanger.svg',
                            height: 16.h,
                            width: 24.w,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 13.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/fashion_library/upload.png',
                      scale: 4,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 26.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                // Use subcategory/item_type as main title
                (item.subcategory?.isNotEmpty == true)
                    ? item.subcategory!
                    : (item.itemType ?? 'Library item'),
                style: TextStyle(
                  color: const Color(0xFF1F1F1F),
                  fontFamily: 'Abhaya_Libre',
                  fontWeight: FontWeight.w400,
                  fontSize: 30.sp,
                ),
              ),
            ),

            SizedBox(height: 23.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                item.description ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                'Color: ${item.colour ?? 'N/A'}',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ),

            SizedBox(height: 99.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                spacing: 13.h,
                children: [
                  GestureDetector(
                    onTap: () {
                      // TODO: hook to "add to closet" endpoint later if needed
                    },
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      color: AppColors.primary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox.shrink(),
                          Text(
                            'Add to my closet',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/images/fashion_library/hanger_white.svg',
                          ),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      // TODO: connect generate outfit logic as needed
                    },
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5.r,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox.shrink(),
                          Text(
                            'Generate  outfit',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                          Image.asset(
                            'assets/images/fashion_library/generate.png',
                            scale: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
