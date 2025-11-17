import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/add_new_item/controllers/add_new_item_controller.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/add_new_item_view.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/auto_taggong_view.dart';
import 'package:watowear_chloe/app/modules/library/views/filter_closet_view.dart';

import '../../../../common/app_colors.dart';
import '../../../data/model/closet_item.dart';
import '../../about_yourself/views/badges/views/badges_view.dart';
import '../controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  const LibraryView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LibraryController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            Text(
              'My Closet',
              style: TextStyle(
                color: AppColors.textIcons,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Obx(() {
              return controller.isEmpty.value ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 83.h,),

                  Text(
                    'Welcome to your black canvas',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),

                  SizedBox(height: 9.h,),

                  Text(
                    'Begin curating your digital wardrobe by adding your vary first piece. Simplified upload (photo and bulk) Unlock personalized style inspirations today.',
                    style: TextStyle(
                      color: AppColors.textIcons,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),

                  SizedBox(height: 36.h,),

                  MyClosetRow(
                    title: 'Take a bulk photo',
                    icon: 'assets/images/library/camera.svg',
                  ),

                  SizedBox(height: 17.h,),

                  MyClosetRow(
                    title: 'Upload from gallery',
                    icon: 'assets/images/library/upload.svg',
                  ),

                  SizedBox(height: 17.h,),

                  MyClosetRow(
                    title: 'Select from our 5000 items library',
                    icon: 'assets/images/library/album.svg',
                  ),

                  SizedBox(height: 17.h,),

                  MyClosetRow(
                    title: 'Upload your 10 favourite items',
                  ),

                  SizedBox(height: 27.h,),

                  Text(
                    'How to take great photos',
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),

                  SizedBox(height: 4.h,),

                  Text(
                    'Quick tips for the best results',
                    style: TextStyle(
                      color: AppColors.textIcons,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              )
                  :
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 59.h,),

                  GestureDetector(
                    onTap: () {
                      Get.to(AddNewItemView());
                    },
                    child: Row(
                      spacing: 7.w,
                      children: [
                        Icon(
                          Icons.add,
                          size: 36.r,
                          color: AppColors.textIcons,
                        ),

                        Text(
                          'Add new Item',
                          style: TextStyle(
                            color: AppColors.textIcons,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 58.h,),

                  Text(
                    'Inspiration of the day',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),

                  SizedBox(height: 9.h,),

                  Text(
                    'Earn exclusive rewards on every added item.',
                    style: TextStyle(
                      color: AppColors.textIcons,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),

                  Row(
                    children: [
                      Text(
                        'Discover our ',
                        style: TextStyle(
                          color: AppColors.textIcons,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),

                      GestureDetector(
                        onTap: () => Get.to(BadgesView(badgeType: 'Refiner',)),
                        child: Text(
                          'Rewards Program',
                          style: TextStyle(
                            color: AppColors.textIcons,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 31.h,),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 29.w,
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(AutoTaggongView()),
                          child: ClosetCard(
                            image: 'assets/images/library/closet_img_1.png',
                            title: 'Board Meeting',
                            subtitle: 'Professional and polished',
                          ),
                        ),

                        GestureDetector(
                          onTap: () => Get.to(AutoTaggongView()),
                          child: ClosetCard(
                            image: 'assets/images/library/closet_img_2.png',
                            title: 'Board Meeting',
                            subtitle: 'Professional and polished',
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 43.h,),

                  Center(
                    child: Container(
                      width: 104.w,
                      height: 1.h,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBg,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 46.w,
                            height: 1.h,
                            decoration: BoxDecoration(
                              color: AppColors.textIcons,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 43.h,),

                  Text(
                    '${controller.closetItems.length} Items in your closet',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),

                  SizedBox(height: 39.h,),

                  Wrap(
                    spacing: 24.w,
                    runSpacing: 39.h,
                    children: controller.closetItems.map((item) {
                      return GestureDetector(
                        onTap: () async {
                          if (item.id != null) {
                            await controller.recordItemView(item.id!);
                          }
                          Get.put(AddNewItemController());
                          Get.to(AutoTaggongView(item: item)); // 👈 pass item
                        },
                        child: ClosetItemCard(item: item),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 91.h,),
                ],
              );
            }),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => Get.to(FilterClosetView()),
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


class MyClosetRow extends StatelessWidget {
  final String title;
  final String? icon;

  const MyClosetRow({
    required this.title,
    this.icon,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 6.w,
          children: [
            if (icon != null)
              SvgPicture.asset(icon!),

            Text(
              title,
              style: TextStyle(
                color: Color(0xFF212121),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w300,
                fontSize: 16.sp,
              ),
            )
          ],
        ),

        GestureDetector(
          onTap: () {  },
          child: Icon(
            Icons.arrow_forward_ios,
            size: 20.r,
            color: Color(0xFF111111),
          ),
        ),
      ],
    );
  }
}


class ClosetCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const ClosetCard({
    required this.image,
    required this.title,
    required this.subtitle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 183.w,
          height: 200.h,
          child: Image.asset(
            image,
            scale: 4,
            fit: BoxFit.fill,
          ),
        ),

        SizedBox(
          width: 183.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
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


class ClosetItemCard extends StatelessWidget {
  final ClosetItem item;

  const ClosetItemCard({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final title = (item.category ?? '').isNotEmpty
        ? item.category![0].toUpperCase() + item.category!.substring(1)
        : 'Item';

    final subtitle = item.description ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 183.w,
          height: 200.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Image.network(
              item.imageUrl ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.secondaryBg,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.broken_image,
                    color: AppColors.textIcons,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: 183.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6.h,
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
    );
  }
}
