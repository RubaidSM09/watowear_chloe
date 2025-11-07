import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../../../../common/custom_button.dart';

class ShopItemView extends GetView {
  const ShopItemView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        scrolledUnderElevation: 0,
        title: Row(
          spacing: 15.w,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {  },
              child: Icon(
                Icons.search,
                size: 25.r,
                color: AppColors.textIcons,
              ),
            ),

            GestureDetector(
              onTap: () {  },
              child: Icon(
                Icons.favorite_outline,
                size: 25.r,
                color: AppColors.textIcons,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 588.h,
                padding: EdgeInsets.only(
                  right: 19.w,
                  bottom: 8.h,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/shop/dolores_gamp.png',
                    ),
                    scale: 4,
                    fit: BoxFit.contain,
                  ),
                  color: Color(0xFFF2F2F2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 10.w,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color: Color(0xFFF1F1EF),
                      ),
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

                    CircleAvatar(
                      radius: 15.r,
                      backgroundColor: Color(0xFFECEAE9),
                      child: Padding(
                        padding: EdgeInsets.all(3.r),
                        child: Image.asset(
                          'assets/images/shop/hanger.png',
                          scale: 4,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 23.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.shrink(),

                        Row(
                          spacing: 8.w,
                          children: [
                            Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondaryBg,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondaryBg,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondaryBg,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondaryBg,
                              ),
                            ),
                          ],
                        ),

                        Image.asset(
                          'assets/images/generate/upload.png',
                          scale: 4,
                          fit: BoxFit.cover,
                          height: 20.h,
                          width: 20.w,
                        )
                      ],
                    ),

                    SizedBox(height: 28.h,),

                    Text(
                      'Dolores Gamp',
                      style: TextStyle(
                        color: const Color(0xFF1F1F1F),
                        fontFamily: 'Abhaya_Libre',
                        fontWeight: FontWeight.w500,
                        fontSize: 30.sp,
                      ),
                    ),

                    SizedBox(height: 23.h,),

                    Text(
                      'Opened back midi dress',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                    ),

                    SizedBox(height: 20.h,),

                    Text(
                      '€110',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                      ),
                    ),

                    SizedBox(height: 20.h,),

                    Text(
                      'Color: Burgundy',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),

                    SizedBox(height: 59.h,),

                    CustomButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 48.w,
                        vertical: 12.h,
                      ),
                      color: AppColors.primary,
                      text: 'Go to Brand',
                      textSize: 16.sp,
                      textColor: Colors.white,
                      onTap: () {  },
                    ),

                    SizedBox(height: 13.h,),

                    CustomButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 48.w,
                        vertical: 12.h,
                      ),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.5.r,
                      ),
                      text: 'Add to wishlist',
                      textSize: 16.sp,
                      textColor: Colors.black,
                      onTap: () {  },
                    ),

                    SizedBox(height: 20.h,),

                    Row(
                      spacing: 4.w,
                      children: [
                        Image.asset(
                          'assets/images/shop/earn_exclusive_benifits.png',
                          scale: 4,
                        ),

                        SizedBox(
                          width: 363.w,
                          child: Text(
                            'Earn exclusive benefits every time you add a piece that truly fits your style. Discover our Rewards Program',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 54.h,),
                    
                    Divider(
                      color: Colors.black.withAlpha(31),
                    ),

                    SizedBox(height: 10.h,),

                    Text(
                      'You may also like',
                      style: TextStyle(
                        color: const Color(0xFF4A4A4A),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.73.sp,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 21.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 7,
                    children: [
                      YouMayLikeCard(
                        image: 'assets/images/shop/outfit_1.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                        price: 55,
                      ),

                      YouMayLikeCard(
                        image: 'assets/images/shop/outfit_3.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                        price: 55,
                      ),

                      YouMayLikeCard(
                        image: 'assets/images/shop/outfit_2.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                        price: 55,
                      ),

                      YouMayLikeCard(
                        image: 'assets/images/shop/dolores_gamp.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                        price: 55,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 21.h,),

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

              SizedBox(height: 40.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: Colors.black.withAlpha(31),
                    ),

                    SizedBox(height: 10.h,),

                    Text(
                      'Your closet matches',
                      style: TextStyle(
                        color: const Color(0xFF4A4A4A),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.73.sp,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 21.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 7,
                    children: [
                      YourClosetMatchCard(
                        image: 'assets/images/shop/outfit_1.png',
                      ),

                      YourClosetMatchCard(
                        image: 'assets/images/shop/outfit_3.png',
                      ),

                      YourClosetMatchCard(
                        image: 'assets/images/shop/outfit_2.png',
                      ),

                      YourClosetMatchCard(
                        image: 'assets/images/shop/dolores_gamp.png',
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 21.h,),

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

              SizedBox(height: 40.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: Colors.black.withAlpha(31),
                    ),

                    SizedBox(height: 10.h,),

                    Text(
                      'Recently viewed',
                      style: TextStyle(
                        color: const Color(0xFF4A4A4A),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.73.sp,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 21.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 7,
                    children: [
                      RecentlyViewedCard(
                        image: 'assets/images/shop/outfit_1.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                        price: 55,
                      ),

                      RecentlyViewedCard(
                        image: 'assets/images/shop/outfit_3.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                        price: 55,
                      ),

                      RecentlyViewedCard(
                        image: 'assets/images/shop/outfit_2.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                        price: 55,
                      ),

                      RecentlyViewedCard(
                        image: 'assets/images/shop/dolores_gamp.png',
                        title: 'Board Meeting',
                        subtitle: 'Professional and polished',
                        price: 55,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 21.h,),

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

              SizedBox(height: 40.h,),
            ],
          ),
        ),
      ),
    );
  }
}


class YouMayLikeCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double price;

  const YouMayLikeCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
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
            left: 107.w,
            right: 10.w,
            top: 10.h,
            bottom: 119.h,
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
            onTap: () {  },
            child: Icon(
              Icons.favorite_border,
              color: AppColors.primary,
              size: 24.r,
            ),
          ),
        ),

        SizedBox(
          width: 141.w,
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

                Text(
                  '€$price',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}


class YourClosetMatchCard extends StatelessWidget {
  final String image;

  const YourClosetMatchCard({
    required this.image,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 65.5.w,
        vertical: 71.5.h,
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
    );
  }
}


class RecentlyViewedCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double price;

  const RecentlyViewedCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
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
            left: 107.w,
            right: 10.w,
            top: 10.h,
            bottom: 119.h,
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
            onTap: () {  },
            child: Icon(
              Icons.favorite_border,
              color: AppColors.primary,
              size: 24.r,
            ),
          ),
        ),

        SizedBox(
          width: 141.w,
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

                Text(
                  '€$price',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
