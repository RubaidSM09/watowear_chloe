import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/menu/controllers/shop_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class CategoriesListView extends GetView<ShopController> {
  final String category;

  const CategoriesListView({
    required this.category,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.bgColor,
        title: Text(
          category,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                category == 'Clothing'
                    ?
                'assets/images/shop/categories/clothing_banner.png'
                    :
                category == 'Shoes'
                    ?
                'assets/images/shop/categories/shoes_banner.png'
                    :
                category == 'Bags'
                    ?
                'assets/images/shop/categories/bags_banner.png'
                    :
                category == 'Accessories'
                    ?
                'assets/images/shop/categories/accessories_banner.png'
                    :
                '',
                scale: 4,
              ),
          
              SizedBox(height: 32.h,),
          
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 50.h,
                  children: category == 'Clothing'
                      ?
                  controller.clothings.map((clothing) {
                    return GestureDetector(
                      onTap: () {  },
                      child: Text(
                        clothing,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }).toList()
                      :
                  category == 'Shoes'
                      ?
                  controller.shoes.map((shoe) {
                    return GestureDetector(
                      onTap: () {  },
                      child: Text(
                        shoe,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }).toList()
                      :
                  category == 'Bags'
                      ?
                  controller.bags.map((bag) {
                    return GestureDetector(
                      onTap: () {  },
                      child: Text(
                        bag,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }).toList()
                      :
                  category == 'Accessories'
                      ?
                  controller.accessories.map((accessory) {
                    return GestureDetector(
                      onTap: () {  },
                      child: Text(
                        accessory,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }).toList()
                      :
                  [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
