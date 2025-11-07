import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/menu/views/shop_item_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class NewInSectionView extends GetView {
  const NewInSectionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'New Arrivals',
                style: TextStyle(
                  color: const Color(0xFF1F1F1F),
                  fontFamily: 'Abhaya_Libre',
                  fontWeight: FontWeight.w400,
                  fontSize: 22.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 25.h,),

          Row(
            children: [
              Text(
                '325 Items',
                style: TextStyle(
                  color: AppColors.primary,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 13.3.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 22.h,),

          Wrap(
            spacing: 29.w,
            runSpacing: 47.h,
            children: [
              NewInCard(
                image: 'assets/images/shop/outfit_1.png',
                title: 'Board Meeting',
                subtitle: 'Professional and polished',
                price: 55,
                onTap: () {  },
              ),

              NewInCard(
                image: 'assets/images/shop/outfit_3.png',
                title: 'Board Meeting',
                subtitle: 'Professional and polished',
                price: 55,
                onTap: () {  },
              ),

              NewInCard(
                image: 'assets/images/shop/outfit_1.png',
                title: 'Board Meeting',
                subtitle: 'Professional and polished',
                price: 55,
                onTap: () {  },
              ),

              NewInCard(
                image: 'assets/images/shop/outfit_3.png',
                title: 'Board Meeting',
                subtitle: 'Professional and polished',
                price: 55,
                onTap: () {  },
              ),

              NewInCard(
                image: 'assets/images/shop/outfit_1.png',
                title: 'Board Meeting',
                subtitle: 'Professional and polished',
                price: 55,
                onTap: () {  },
              ),

              NewInCard(
                image: 'assets/images/shop/outfit_3.png',
                title: 'Board Meeting',
                subtitle: 'Professional and polished',
                price: 55,
                onTap: () {  },
              ),

              NewInCard(
                image: 'assets/images/shop/outfit_1.png',
                title: 'Board Meeting',
                subtitle: 'Professional and polished',
                price: 55,
                onTap: () {  },
              ),

              NewInCard(
                image: 'assets/images/shop/outfit_3.png',
                title: 'Board Meeting',
                subtitle: 'Professional and polished',
                price: 55,
                onTap: () {  },
              ),

              NewInCard(
                image: 'assets/images/shop/outfit_1.png',
                title: 'Board Meeting',
                subtitle: 'Professional and polished',
                price: 55,
                onTap: () {  },
              ),

              NewInCard(
                image: 'assets/images/shop/outfit_3.png',
                title: 'Board Meeting',
                subtitle: 'Professional and polished',
                price: 55,
                onTap: () {  },
              ),
            ],
          ),

          SizedBox(height: 35.h,),

          Center(
            child: GestureDetector(
              onTap: () {  },
              child: Text(
                'Load more items',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),

          SizedBox(height: 15.h,),
        ],
      ),
    );
  }
}


class NewInCard extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  final String title;
  final String subtitle;
  final double price;

  const NewInCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ShopItemView()),
      child: SizedBox(
        width: 183.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6.h,
          children: [
            Image.asset(
              image,
              scale: 4,
              height: 200.h,
              fit: BoxFit.cover,
            ),

            Padding(
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
            )
          ],
        ),
      ),
    );
  }
}
