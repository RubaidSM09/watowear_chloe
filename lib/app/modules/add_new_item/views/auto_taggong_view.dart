import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/delete_item_view.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/item_added_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../../../../common/custom_button.dart';

class AutoTaggongView extends GetView {
  const AutoTaggongView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/add_new_item/photo_preview.png',
                  scale: 4,
                  width: 392.w,
                  height: 588.h,
                ),

                SizedBox(height: 32.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Midi Dress',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),

                        SizedBox(height: 9.h,),

                        Text(
                          'Burgundy',
                          style: TextStyle(
                            color: AppColors.textIcons.withAlpha(179),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),

                        SizedBox(height: 5.h,),

                        Text(
                          'Winter, Chic, Office',
                          style: TextStyle(
                            color: AppColors.textIcons.withAlpha(179),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        'assets/images/add_new_item/edit.svg',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 44.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  color: AppColors.primary,
                  text: 'Save Changes',
                  textSize: 16.sp,
                  textColor: Colors.white,
                  onTap: () => Get.dialog(ItemAddedView()),
                ),

                SizedBox(height: 13.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  text: 'Cancel',
                  textSize: 16.sp,
                  textColor: AppColors.textIcons,
                  onTap: () => Get.back(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
