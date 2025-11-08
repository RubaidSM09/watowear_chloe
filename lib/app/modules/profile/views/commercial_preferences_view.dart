import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_button.dart';

class CommercialPreferencesView extends GetView {
  const CommercialPreferencesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Commercial preferences',
          style: TextStyle(
            color: AppColors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stay in the Know',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 8.h,),

                Text(
                  'Join our inner circle and be the first to receive exclusive updates, curated edits, and insider news,  From limited collections to private offers.\n\nYou’re subscribing with contact@WATOWEAR.com',
                  style: TextStyle(
                    color: AppColors.textIcons.withAlpha(179),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),

                SizedBox(height: 34.h,),

                Text(
                  'Tell us what inspires your wardrobe?',
                  style: TextStyle(
                    color: AppColors.textIcons.withAlpha(179),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),

                SizedBox(height: 24.h,),

                Row(
                  spacing: 50.w,
                  children: [
                    Row(
                      spacing: 7.w,
                      children: [
                        Icon(
                          Icons.check_box_outline_blank_rounded,
                          size: 20.r,
                          color: AppColors.textIcons,
                        ),

                        Text(
                          'Women',
                          style: TextStyle(
                            color: AppColors.textIcons.withAlpha(179),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),

                    Row(
                      spacing: 7.w,
                      children: [
                        Icon(
                          Icons.check_box_outline_blank_rounded,
                          size: 20.r,
                          color: AppColors.textIcons,
                        ),

                        Text(
                          'Men',
                          style: TextStyle(
                            color: AppColors.textIcons.withAlpha(179),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 38.h,),

                Row(
                  spacing: 7.w,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_box_outline_blank_rounded,
                      size: 20.r,
                      color: AppColors.textIcons,
                    ),

                    SizedBox(
                      width: 365.w,
                      child: Text(
                        'I’ve read and accept the terms of the Privacy Policy, and I agree to receive personalised style communications from WATOWEAR via email and other channels.',
                        style: TextStyle(
                          color: AppColors.textIcons.withAlpha(179),
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 38.h,),

                CustomButton(
                  text: 'Subscribe',
                  textSize: 16.sp,
                  textColor: AppColors.textIcons,
                  border: Border.all(
                    color: AppColors.textIcons,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  onTap: () {  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
