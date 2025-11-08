import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/menu/controllers/shop_controller.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_button.dart';

class ShopSectionView extends GetView<ShopController> {
  const ShopSectionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ----------------- MARQUEE TEXT -----------------
        Container(
          height: 45.h,
          width: double.infinity,
          color: Color(0xFFF4F1EB),
          child: Center(
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
        ),

        SizedBox(height: 6.h),

        Container(
          width: double.infinity,
          height: 247.h,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primary,
              )
          ),
        ),

        SizedBox(height: 13.h),

        Column(
          spacing: 9.h,
          children: [
            Text(
              'New In',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),

            Text(
              'In the Spotlight',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontFamily: 'Abhaya_Libre',
                fontWeight: FontWeight.w500,
                fontSize: 30.sp,
              ),
            ),

            Text(
              'Discover this week’s most coveted pieces,\nhandpicked for you',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
                fontSize: 13.3.sp,
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              'Explore Looks',
              style: TextStyle(
                color: Color(0xFF1F1F1F),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),

        SizedBox(height: 13.h),

        Container(
          width: double.infinity,
          height: 247.h,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primary,
              )
          ),
        ),

        SizedBox(height: 13.h),

        Column(
          spacing: 9.h,
          children: [
            Text(
              'Meet the Makers',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontFamily: 'Abhaya_Libre',
                fontWeight: FontWeight.w500,
                fontSize: 30.sp,
              ),
            ),

            Text(
              'Find your next favorite brand, chosen with\ncare',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
                fontSize: 13.3.sp,
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              'Browse Brands',
              style: TextStyle(
                color: Color(0xFF1F1F1F),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),

        SizedBox(height: 13.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w,),
          child: Image.asset(
            'assets/images/shop/style_stories.png',
            scale: 4,
          ),
        ),

        SizedBox(height: 13.h),

        Column(
          spacing: 9.h,
          children: [
            Text(
              'Style Stories',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontFamily: 'Abhaya_Libre',
                fontWeight: FontWeight.w500,
                fontSize: 30.sp,
              ),
            ),

            Text(
              'Read the stories behind the style and\ndiscover new trends.',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
                fontSize: 13.3.sp,
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              'Read More',
              style: TextStyle(
                color: Color(0xFF1F1F1F),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),

        SizedBox(height: 13.h),

        Image.asset(
          'assets/images/shop/earn_as_you_style.png',
          scale: 4,
        ),

        SizedBox(height: 13.h),

        Column(
          spacing: 9.h,
          children: [
            Text(
              'Earn as you style',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontFamily: 'Abhaya_Libre',
                fontWeight: FontWeight.w500,
                fontSize: 30.sp,
              ),
            ),

            Text(
              'Complete small missions, unlock rewards,\nand rediscover your style',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
                fontSize: 13.3.sp,
              ),
              textAlign: TextAlign.center,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 131.w),
              child: CustomButton(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.1.w,
                  vertical: 16.67.h,
                ),
                color: Colors.black,
                text: 'View Progress',
                textColor: AppColors.bgColor,
                textSize: 18.sp,
                onTap: () {  },
              ),
            ),
          ],
        ),

        SizedBox(height: 13.h),

        Divider(
          color: Colors.black.withAlpha(31),
        ),

        SizedBox(height: 22.h),

        Column(
          spacing: 9.h,
          children: [
            Text(
              'Ask Chloé',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontFamily: 'Abhaya_Libre',
                fontWeight: FontWeight.w500,
                fontSize: 30.sp,
              ),
            ),

            Text(
              'Need help? Your personal stylist is always\none tap away',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
                fontSize: 13.3.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w,),
          child: Row(
            children: [
              Text(
                'Editor’s Picks',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 13.3.sp,
                ),
              )
            ],
          ),
        ),

        CircleAvatar(
          radius: 75.r,
          backgroundImage: AssetImage(
            'assets/images/shop/chloe.png',
          ),
        ),

        SizedBox(height: 30.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w,),
          child: Divider(
            color: Colors.black.withAlpha(31),
          ),
        ),

        SizedBox(height: 62.h),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 7.w,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 107.w,
                  right: 10.w,
                  top: 10.h,
                  bottom: 119.h,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/shop/outfit_1.png',
                      ),
                      scale: 4,
                    )
                ),
                child: GestureDetector(
                  onTap: () {  },
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.primary,
                    size: 24.r,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  left: 107.w,
                  right: 10.w,
                  top: 10.h,
                  bottom: 119.h,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/shop/outfit_2.png',
                      ),
                      scale: 4,
                    )
                ),
                child: GestureDetector(
                  onTap: () {  },
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.primary,
                    size: 24.r,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  left: 107.w,
                  right: 10.w,
                  top: 10.h,
                  bottom: 119.h,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/shop/outfit_3.png',
                      ),
                      scale: 4,
                    )
                ),
                child: GestureDetector(
                  onTap: () {  },
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.primary,
                    size: 24.r,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  left: 107.w,
                  right: 10.w,
                  top: 10.h,
                  bottom: 119.h,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/shop/outfit_2.png',
                      ),
                      scale: 4,
                    )
                ),
                child: GestureDetector(
                  onTap: () {  },
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.primary,
                    size: 24.r,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 15.h),

        Container(
          width: 108.w,
          height: 1.h,
          color: AppColors.secondaryBg,
          child: Row(
            children: [
              Container(
                width: 46.w,
                height: 1.h,
                color: AppColors.textIcons,
              )
            ],
          ),
        ),

        SizedBox(height: 30.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w,),
          child: Divider(
            color: Colors.black.withAlpha(31),
          ),
        ),

        SizedBox(height: 15.h),

        Column(
          spacing: 9.h,
          children: [
            Text(
              'WATOWEAR Edit',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
                fontSize: 30.sp,
              ),
            ),

            Text(
              'Style insights, wardrobe rituals, and mindful\nfashion reads.',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w500,
                fontSize: 13.3.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),

        SizedBox(height: 30.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 16.w,
              children: [
                SizedBox(
                  width: 285.w,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/shop/love_with_closet.png',
                        scale: 4,
                        width: 285.w,
                        height: 285.h,
                      ),

                      SizedBox(height: 15.h,),

                      Text(
                        'How to fall back in love with your closet',
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontFamily: 'Abhaya_Libre',
                          fontWeight: FontWeight.w400,
                          fontSize: 30.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 9.h,),

                      Text(
                        'Because everything you need might already be hanging right in front of you',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Abhaya_Libre',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.3.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 285.w,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/shop/love_with_closet.png',
                        scale: 4,
                        width: 285.w,
                        height: 285.h,
                      ),

                      SizedBox(height: 15.h,),

                      Text(
                        '5 Ways to Wear What You Already Own',
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontFamily: 'Abhaya_Libre',
                          fontWeight: FontWeight.w400,
                          fontSize: 30.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 9.h,),

                      Text(
                        'Simple shifts, layered styling, and fresh eyes on familiar favorites.',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Abhaya_Libre',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.3.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 25.h),

        GestureDetector(
          onTap: () {  },
          child: Text(
            'See ALL',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w500,
              fontSize: 13.3.sp,
              decoration: TextDecoration.underline,
            ),
          ),
        ),

        SizedBox(height: 40.h),
      ],
    );
  }
}
