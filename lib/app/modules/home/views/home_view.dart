import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/add_new_item_view.dart';
import 'package:watowear_chloe/app/modules/library/views/library_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/my_assistant_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import 'package:watowear_chloe/common/custom_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/onboarding/watowear_word_logo.png',
              scale: 7,
            ),

            Row(
              spacing: 16.44.w,
              children: [
                Image.asset(
                  'assets/images/home/search_icon.png',
                  scale: 4,
                ),

                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary,
                    )
                  ),
                  child: Image.asset(
                    'assets/images/home/profile_img.png',
                    scale: 4,
                  ),
                ),
              ],
            )
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.0.w),
                child: Divider(
                  color: Color(0xFFE5E7EB),
                  thickness: 1.13.r,
                ),
              ),

              SizedBox(height: 15.17.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.0.w),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Luna !',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w700,
                            fontSize: 24.sp,
                          ),
                        ),

                        SizedBox(height: 12.h,),

                        Text(
                          'Ready to style your day ?',
                          style: TextStyle(
                            color: AppColors.textIcons,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                          ),
                        ),

                        SizedBox(height: 6.h,),

                        Row(
                          spacing: 7.w,
                          children: [
                            Image.asset(
                              'assets/images/home/weather.png',
                              scale: 4,
                            ),

                            Text(
                              '28°C - Antibes',
                              style: TextStyle(
                                color: AppColors.textIcons,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 35.13.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.0.w),
                child: Column(
                  spacing: 11.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 6.w,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFFDF6EC),
                                border: Border.all(
                                  color: Color(0xFFCDCDC0),
                                )
                              ),
                            ),

                            Text(
                              'You’re a Refiner',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 15.96.sp,
                              ),
                            ),
                          ],
                        ),

                        Text(
                          '60%',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: 362.05.w,
                      height: 3.h,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBg,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: (362.05*(60/100)).w,
                            height: 3.h,
                            decoration: BoxDecoration(
                              color: AppColors.textIcons,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 61.87.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
                      color: AppColors.primary,
                      icon: 'assets/images/home/hanger.png',
                      text: 'My closet',
                      textColor: AppColors.bgColor,
                      textSize: 18.sp,
                      onTap: () => Get.to(LibraryView()),
                    ),

                    CustomButton(
                      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
                      color: AppColors.black,
                      icon: 'assets/images/home/add_icon.png',
                      text: 'Add new item',
                      textColor: AppColors.bgColor,
                      textSize: 18.sp,
                      onTap: () => Get.to(AddNewItemView()),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 62.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 39.0.w),
                child: Divider(
                  color: AppColors.black.withAlpha(61),
                ),
              ),

              SizedBox(height: 32.h,),

              Text(
                'Today’s Inspiration',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Comfortaa',
                ),
              ),

              SizedBox(height: 29.h,),

              Text(
                'Today\'s tip: Try layering your linen blazer over a\nsilk camisole for effortless sophistication.',
                style: TextStyle(
                  color: Color(0xFF1F1F1F).withAlpha(204),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Comfortaa',
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 22.h,),

              Column(
                children: [
                  Image.asset(
                    'assets/images/home/art_of_layering.png',
                    scale: 4,
                    width: double.infinity,
                    height: 395.h,
                  ),

                  SizedBox(height: 26.h,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 43.w),
                    child: Column(
                      children: [
                        Text(
                          'CHLOÉ\'S PICK',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F).withAlpha(153),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                          ),
                        ),

                        SizedBox(height: 8.h,),

                        Text(
                          'The Art of Layering',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Black_Mango',
                          ),
                        ),

                        SizedBox(height: 12.h,),

                        Text(
                          'Today\'s tip: Try layering your linen blazer over a silk camisole for effortless sophistication.',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F).withAlpha(204),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 29.h,),

                        CustomButton(
                          padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 17.h),
                          text: 'Generate Today\'s Outfit',
                          textSize: 14.sp,
                          textColor: AppColors.bgColor,
                          color: AppColors.textIcons,
                          onTap: () => Get.to(LibraryView()),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 29.h,),
                ],
              ),

              Column(
                children: [
                  Image.asset(
                    'assets/images/home/closet_detox.png',
                    scale: 4,
                    width: double.infinity,
                    // height: 395.h,
                  ),

                  SizedBox(height: 26.h,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 43.w),
                    child: Column(
                      children: [
                        Text(
                          'Closet Detox',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Black_Mango',
                          ),
                        ),

                        SizedBox(height: 12.h,),

                        Text(
                          'A 10-minute guide to a clutter-free wardrobe and a clearer mind.',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F).withAlpha(204),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 29.h,),

                        Text(
                          'Read The Article',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                          ),
                        ),

                        Container(
                          width: 124.86.w,
                          height: 1.13.h,
                          color: Color(0xFF1F1F1F),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 29.h,),
                ],
              ),

              Column(
                children: [
                  Image.asset(
                    'assets/images/home/weekend_chic.png',
                    scale: 4,
                    width: double.infinity,
                    // height: 395.h,
                  ),

                  SizedBox(height: 26.h,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 43.w),
                    child: Column(
                      children: [
                        Text(
                          'Weekend Chic',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Black_Mango',
                          ),
                        ),

                        SizedBox(height: 12.h,),

                        Text(
                          'Effortless style boards for your much deserved days off.',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F).withAlpha(204),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 29.h,),

                        Text(
                          'Explore Looks',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                          ),
                        ),

                        Container(
                          width: 105.58.w,
                          height: 1.13.h,
                          color: Color(0xFF1F1F1F),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 29.h,),
                ],
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 80.66.w,
                  vertical: 50.77.h,
                ),
                color: Color(0xFFF5F4F0).withAlpha(153),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/home/your_next_mission.svg'
                    ),

                    SizedBox(height: 15.79.h,),

                    Text(
                      'Your Next Mission',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 27.08.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Black_Mango',
                      ),
                    ),

                    SizedBox(height: 90.26.h,),

                    GestureDetector(
                      onTap: () {  },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30.1.w, vertical: 16.67.h,),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        child: Text(
                          'Upload Items',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 29.h,),

              Column(
                children: [
                  Container(
                    width: double.infinity,
                    // height: 395.h,
                    padding: EdgeInsets.only(
                      top: 247.72.h,
                      bottom: 100.2.h,
                      left: 37.w,
                      right: 37.w,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/home/sustainable_drops.png',
                        ),
                        fit: BoxFit.cover,
                        scale: 4,
                      ),
                    ),
                    child: Text(
                      'Get +50 XP when you upload 3 new items from your latest shopping trip.',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F).withAlpha(204),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),

                  SizedBox(height: 26.h,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 43.w),
                    child: Column(
                      children: [
                        Text(
                          'Sustainable Drops',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Black_Mango',
                          ),
                        ),

                        SizedBox(height: 12.h,),

                        Text(
                          'Meet the new eco-conscious labels we\'re loving right now.',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F).withAlpha(204),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 29.h,),

                        Text(
                          'Discover Brands',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                          ),
                        ),

                        Container(
                          width: 122.96.w,
                          height: 1.13.h,
                          color: Color(0xFF1F1F1F),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 29.h,),
                ],
              ),
            ],
          ),
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
