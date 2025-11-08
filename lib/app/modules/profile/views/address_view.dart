import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/profile_controller.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_button.dart';
import '../../../../common/custom_text_fields.dart';

class AddressView extends GetView<ProfileController> {
  const AddressView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Address',
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
                  'Personal details',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'Luna ',
                  hintStyle: TextStyle(
                    color: AppColors.textIcons.withAlpha(179),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                  obscureText: controller.obscureText.value,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'Pierre',
                  hintStyle: TextStyle(
                    color: Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'Date of birth',
                  hintStyle: TextStyle(
                    color: Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 26.h,),

                Text(
                  'Address',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 8.h,),

                Text(
                  'Select the country where you wish to be billed',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w300,
                    fontSize: 10.sp,
                  ),
                ),

                SizedBox(height: 22.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'France',
                  hintStyle: TextStyle(
                    color: Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'Address* ',
                  hintStyle: TextStyle(
                    color: Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'Complete address (Optional) ',
                  hintStyle: TextStyle(
                    color: Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'Province/ county*',
                  hintStyle: TextStyle(
                    color: Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'City/ Town*',
                  hintStyle: TextStyle(
                    color: Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'Post code*',
                  hintStyle: TextStyle(
                    color: Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 24.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 145.w,
                      child: CustomTextFiled(
                        padding: EdgeInsets.all(16.r),
                        hintText: 'France',
                        hintStyle: TextStyle(
                          color: Color(0xFF4B5563),
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.textIcons
                          ),
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 232.w,
                      child: CustomTextFiled(
                        padding: EdgeInsets.all(16.r),
                        hintText: '+33 645678909',
                        hintStyle: TextStyle(
                          color: Color(0xFF4B5563),
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.textIcons
                          ),
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 26.h,),

                Row(
                  spacing: 7.w,
                  children: [
                    Container(
                      padding: EdgeInsets.all(7.205.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.r),
                          border: Border.all(
                            color: AppColors.black,
                            width: 0.36.r,
                          )
                      ),
                    ),

                    Text(
                      'I agree to the Terms & Conditions and Privacy Policy',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    )
                  ],
                ),

                SizedBox(height: 12.h,),

                Row(
                  spacing: 7.w,
                  children: [
                    Container(
                      padding: EdgeInsets.all(7.205.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.r),
                          border: Border.all(
                            color: AppColors.black,
                            width: 0.36.r,
                          )
                      ),
                    ),

                    Text(
                      'Receive news, updates, and special offers.',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    )
                  ],
                ),

                SizedBox(height: 44.h,),

                CustomButton(
                  text: 'Update email',
                  textSize: 16.sp,
                  textColor: AppColors.bgColor,
                  color: AppColors.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  onTap: () => Get.back(),
                ),

                CustomButton(
                  text: 'Cancel',
                  textSize: 16.sp,
                  textColor: AppColors.textIcons,
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  onTap: () => Get.back(),
                ),

                SizedBox(height: 26.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
