import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/menu/controllers/shop_controller.dart';

class BrandsSectionView extends GetView<ShopController> {
  const BrandsSectionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: 30.r,
                color: Colors.black,
              ),

              hintText: 'Search Brands',
              hintStyle: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),

              suffixIcon: Icon(
                Icons.close,
                size: 30.r,
                color: Colors.black,
              ),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),

          SizedBox(height: 47.h,),

          Row(
            spacing: 31.w,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/shop/save.png',
                scale: 4,
              ),

              SizedBox(
                width: 315.w,
                child: Text(
                  'Select and save the brands you love. We’ll send you personalized updates and curated edits, so you’re always in the know.',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500,
                    fontSize: 13.3.sp,
                  ),
                ),
              )
            ],
          ),

          SizedBox(height: 70.h,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 14.h,
            children: controller.brands.entries.map((entry) {
              final String letter = entry.key;
              final List<Map<String, dynamic>> countries = entry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 14.h,
                children: [
                  Text(
                    letter,
                    style: TextStyle(
                      color: const Color(0xFF1F1F1F),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                    ),
                  ),

                  Column(
                    children: countries.map((country) {
                      return ListTile(
                        title: Text(country['country']),
                        trailing: Icon(
                          country['isSaved']
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color:
                          country['isSaved'] ? Colors.blueAccent : Colors.grey,
                        ),
                        onTap: () {
                          // Optional: handle toggle here
                        },
                      );
                    }).toList(),
                  )
                ],
              );
            }).toList(),
          ),

          SizedBox(height: 35.h,),

          Center(
            child: GestureDetector(
              onTap: () {  },
              child: Text(
                'Load more brands',
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
