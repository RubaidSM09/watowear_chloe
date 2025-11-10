import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/add_new_item/controllers/add_new_item_controller.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/add_new_item_view.dart';
import 'package:watowear_chloe/app/modules/dashboard/views/dashboard_view.dart';
import 'package:watowear_chloe/app/modules/home/views/home_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../../../../common/custom_button.dart';
import '../controllers/add_your_wardrobe_controller.dart';

class AddYourWardrobeView extends GetView<AddYourWardrobeController> {
  const AddYourWardrobeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: SizedBox.shrink(),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12.h,
                  children: [
                    Text(
                      'Add your Wardrobe!',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp,
                      ),
                    ),

                    Text(
                      'The more you upload the better the suggestions',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 188.w, vertical: 133.h),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/onboarding/add_your_wardrobe.png',
                    ),
                    scale: 4,
                    fit: BoxFit.cover,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 26.5.w, vertical: 21.75.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withAlpha(230),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/onboarding/play.svg'
                    ),
                  ),
                ),
              ),

              SizedBox(height: 26.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Text(
                      'How to take great photos',
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 4.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {  },
                      child: Text(
                        'Quick tips for the best results',
                        style: TextStyle(
                          color: AppColors.textIcons,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          decoration: TextDecoration.underline
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  spacing: 20.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upload from Gallery',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            final addNewItemController = Get.put(AddNewItemController());
                            addNewItemController.selectMethod(1);
                            Get.to(AddNewItemView());
                          },
                          child: Icon(
                            Icons.navigate_next_rounded,
                            size: 28.r,
                            color: Color(0xFF111111),
                          ),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 10.w,
                          children: [
                            Text(
                              'Download your 10 favorites',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                              },
                              child: Icon(
                                Icons.info_outline,
                                size: 24.r,
                                color: AppColors.black,
                              ),
                            )
                          ],
                        ),

                        GestureDetector(
                          onTap: () {
                            final addNewItemController = Get.put(AddNewItemController());
                            addNewItemController.selectMethod(0);
                            Get.to(AddNewItemView());
                          },
                          child: Icon(
                            Icons.navigate_next_rounded,
                            size: 28.r,
                            color: Color(0xFF111111),
                          ),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Take pictures now',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            final addNewItemController = Get.put(AddNewItemController());
                            addNewItemController.selectMethod(0);
                            Get.to(AddNewItemView());
                          },
                          child: Icon(
                            Icons.navigate_next_rounded,
                            size: 28.r,
                            color: Color(0xFF111111),
                          ),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose from our 5000 items\nfashion library',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {  },
                          child: Icon(
                            Icons.navigate_next_rounded,
                            size: 28.r,
                            color: Color(0xFF111111),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 38.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  text: 'Next',
                  textColor: AppColors.bgColor,
                  textSize: 14.sp,
                  color: AppColors.primary,
                  onTap: () => Get.offAll(DashboardView()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
