import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../controllers/add_your_wardrobe_controller.dart';

class AddYourWardrobeView extends GetView<AddYourWardrobeController> {
  const AddYourWardrobeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox.shrink(),
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
            ],
          ),
        ),
      ),
    );
  }
}
