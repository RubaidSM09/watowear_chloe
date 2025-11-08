import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/auto_taggong_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class PhotoPreviewView extends GetView {
  const PhotoPreviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Photo Preview',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 440.w,
                height: 588.h,
                child: Image.asset(
                  'assets/images/add_new_item/photo_preview.png',
                  scale: 4,
                  fit: BoxFit.fill,
                ),
              ),

              SizedBox(height: 32.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(AutoTaggongView()),
                          child: Text(
                            'Keep and continue',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Text(
                            'Retake Photo',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 62.h,),

                    Row(
                      spacing: 10.w,
                      children: [
                        Image.asset(
                          'assets/images/add_new_item/enhance.png',
                          scale: 4,
                        ),

                        GestureDetector(
                          onTap: () {  },
                          child: Text(
                            'Enhance picture',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
