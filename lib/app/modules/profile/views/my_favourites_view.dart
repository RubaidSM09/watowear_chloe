import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/profile_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import 'package:watowear_chloe/common/custom_button.dart';

import 'my_assistant_view.dart';

class MyFavouritesView extends GetView<ProfileController> {
  const MyFavouritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Row(
          children: [
            Text(
              'My Favourites',
              style: TextStyle(
                color: AppColors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w,),
          child: Obx(() {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.isFavouriteEmpty.value ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 114.h,),

                      Text(
                        'Your favourites are currently empty. Just tap the favourite icon on any item you love and it will appear here.',
                        style: TextStyle(
                          color: AppColors.textIcons,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w300,
                          fontSize: 18.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 33.h,),

                      CustomButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 48.w, vertical: 12.h,),
                        color: AppColors.primary,
                        text: 'Add New Item',
                        textSize: 16.sp,
                        textColor: Colors.white,
                        onTap: () {},
                      ),
                    ],
                  )
                      :
                  Wrap(
                    spacing: 29.w,
                    runSpacing: 29.h,
                    children: [
                      FavouritesCard(
                        image: 'assets/images/profile/my_favourites/my_favourites_1.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                      ),

                      FavouritesCard(
                        image: 'assets/images/profile/my_favourites/my_favourites_5.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                      ),

                      FavouritesCard(
                        image: 'assets/images/profile/my_favourites/my_favourites_6.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                      ),

                      FavouritesCard(
                        image: 'assets/images/profile/my_favourites/my_favourites_4.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                      ),
                    ],
                  ),

                  SizedBox(height: 60.h,),

                  Text(
                    'Last items viewed',
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),

                  SizedBox(height: 39.h,),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 29.w,
                      children: [
                        MyFavouritesCard(
                          image: 'assets/images/profile/my_favourites/my_favourites_1.png',
                          title: 'Board Meeting',
                          subtitle: 'Professional and polished',
                        ),

                        MyFavouritesCard(
                          image: 'assets/images/profile/my_favourites/my_favourites_2.png',
                          title: 'Board Meeting',
                          subtitle: 'Professional and polished',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 39.h,),

                  Center(
                    child: Container(
                      width: 104.w,
                      height: 1.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: AppColors.secondaryBg,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 46.w,
                            height: 1.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: AppColors.textIcons,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 52.h,),

                  Text(
                    'Items from the Library',
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),

                  SizedBox(height: 39.h,),

                  Wrap(
                    spacing: 29.w,
                    runSpacing: 39.h,
                    children: [
                      MyFavouritesCard(
                        image: 'assets/images/profile/my_favourites/my_favourites_3.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                      ),

                      MyFavouritesCard(
                        image: 'assets/images/profile/my_favourites/my_favourites_4.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                      ),

                      MyFavouritesCard(
                        image: 'assets/images/profile/my_favourites/my_favourites_5.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                      ),

                      MyFavouritesCard(
                        image: 'assets/images/profile/my_favourites/my_favourites_4.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                      ),
                    ],
                  ),

                  SizedBox(height: 83.h,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        padding: EdgeInsets.symmetric(horizontal: 57.1.w,
                          vertical: 16.67.h,),
                        color: AppColors.black,
                        text: 'View all',
                        textColor: Colors.white,
                        textSize: 18.sp,
                        onTap: () {},
                      ),
                    ],
                  ),

                  SizedBox(height: 57.85.h,),
                ],
              ),
            );
          }),
        ),
      ),

      floatingActionButton: GestureDetector(
        onTap: () => Get.to(MyAssistantView()),
        child: Image.asset(
          'assets/images/onboarding/chloe_2.png',
          scale: 10,
        ),
      ),
    );
  }
}


class MyFavouritesCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const MyFavouritesCard({
    required this.image,
    required this.title,
    required this.subtitle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 183.w,
      child: Column(
        spacing: 6.h,
        children: [
          Image.asset(
            image,
            scale: 4,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,),
            child: Column(
              spacing: 6.h,
              crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
      ),
    );
  }
}


class FavouritesCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const FavouritesCard({
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
        Container(
          padding: EdgeInsets.only(
            left: 156.w,
            right: 10.w,
            top: 10.h,
            bottom: 173.h,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  scale: 4,
                  fit: BoxFit.fill
              )
          ),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.favorite,
              color: AppColors.textIcons,
              size: 17.r,
            ),
          ),
        ),

        SizedBox(
          width: 183.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF1F1F1F),
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
    );
  }
}
