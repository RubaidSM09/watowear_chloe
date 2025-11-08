import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/profile_controller.dart';
import 'package:watowear_chloe/app/modules/profile/views/add_phone_number_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/address_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/change_my_password_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/commercial_preferences_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/modify_email_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import 'package:watowear_chloe/common/custom_button.dart';

class PersonalDetailsView extends GetView<ProfileController> {
  const PersonalDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        scrolledUnderElevation: 0,
        title: Text(
          'Personal Details',
          style: TextStyle(
            color: AppColors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w400,
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
                Row(
                  spacing: 17.w,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          'assets/images/profile/profile_image.png',
                          scale: 4.75,
                        ),

                        Positioned(
                          top: 56.h,
                          left: 57.w,
                          child: SvgPicture.asset(
                            'assets/images/profile/my_progress/camera_black.svg',
                          ),
                        ),
                      ],
                    ),

                    Text(
                      'Luna Pierre',
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w600,
                        fontSize: 15.25.sp,
                      ),
                    )
                  ],
                ),

                SizedBox(height: 54.h,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 15.h,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.r),
                    border: Border.all(
                      color: Color(0xFF111111).withAlpha(36),
                      width: 0.5.r,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 304.w,
                        child: Column(
                          spacing: 2.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Main and billing address',
                              style: TextStyle(
                                color: AppColors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w600,
                                fontSize: 15.25.sp,
                              ),
                            ),

                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore',
                              style: TextStyle(
                                color: AppColors.black,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w300,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: AppColors.black,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w700,
                            fontSize: 17.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 42.h,),

                Text(
                  'Account information',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),

                SizedBox(height: 25.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h,),
                  border: Border.all(
                    color: Colors.black,
                  ),
                  text: 'Modify  Email',
                  textSize: 16.sp,
                  textColor: AppColors.textIcons,
                  onTap: () => Get.to(ModifyEmailView()),
                ),

                SizedBox(height: 21.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h,),
                  border: Border.all(
                    color: Colors.black,
                  ),
                  text: 'Add Phone number',
                  textSize: 16.sp,
                  textColor: AppColors.textIcons,
                  onTap: () => Get.to(AddPhoneNumberView()),
                ),

                SizedBox(height: 21.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h,),
                  border: Border.all(
                    color: Colors.black,
                  ),
                  text: 'Change Password',
                  textSize: 16.sp,
                  textColor: AppColors.textIcons,
                  onTap: () => Get.to(ChangeMyPasswordView()),
                ),

                SizedBox(height: 21.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h,),
                  border: Border.all(
                    color: Colors.black,
                  ),
                  text: 'Address',
                  textSize: 16.sp,
                  textColor: AppColors.textIcons,
                  onTap: () => Get.to(AddressView()),
                ),

                SizedBox(height: 21.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h,),
                  border: Border.all(
                    color: Colors.black,
                  ),
                  text: 'Commercial Preferences',
                  textSize: 16.sp,
                  textColor: AppColors.textIcons,
                  onTap: () => Get.to(CommercialPreferencesView()),
                ),

                SizedBox(height: 24.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h,),
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  text: 'Complete /Update My Profile',
                  textSize: 16.sp,
                  textColor: AppColors.bgColor,
                  onTap: () {  },
                ),

                SizedBox(height: 21.h,),

                TextField(
                  decoration: InputDecoration(
                    hintText: 'Height',
                    hintStyle: TextStyle(
                      color: AppColors.textIcons, fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400, fontSize: 12.sp,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE5E7EB),
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE5E7EB),
                        )
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => controller.isCm.value = !controller.isCm.value,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 0.3.r),
                            ),
                            child: Text(
                              controller.isCm.value ? 'cm' : 'ft',
                              style: TextStyle(
                                color: const Color(0xFF111111),
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 21.h,),

                TextField(
                  decoration: InputDecoration(
                    hintText: 'Weight',
                    hintStyle: TextStyle(
                      color: AppColors.textIcons, fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400, fontSize: 12.sp,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE5E7EB),
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE5E7EB),
                        )
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => controller.isKg.value = !controller.isKg.value,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 0.3.r),
                            ),
                            child: Text(
                              controller.isKg.value ? 'kg' : 'lbs',
                              style: TextStyle(
                                color: const Color(0xFF111111),
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 35.h,),

                PersonalDetailsRow(
                  text: 'My style',
                  onTap: () {  },
                ),

                SizedBox(height: 32.h,),

                PersonalDetailsRow(
                  text: 'My favourite Icons',
                  onTap: () {  },
                ),

                SizedBox(height: 32.h,),

                PersonalDetailsRow(
                  text: 'Colors',
                  onTap: () {  },
                ),

                SizedBox(height: 32.h,),

                PersonalDetailsRow(
                  text: 'My comfort Zone',
                  onTap: () {  },
                ),

                SizedBox(height: 32.h,),

                PersonalDetailsRow(
                  text: 'Skin color',
                  onTap: () {  },
                ),

                SizedBox(height: 32.h,),

                PersonalDetailsRow(
                  text: 'Body shape',
                  onTap: () {  },
                ),

                SizedBox(height: 32.h,),

                PersonalDetailsRow(
                  text: 'Hair color',
                  onTap: () {  },
                ),

                SizedBox(height: 32.h,),

                PersonalDetailsRow(
                  text: 'Any suggestions? ',
                  onTap: () {  },
                ),

                SizedBox(height: 88.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h,),
                  color: AppColors.primary,
                  text: 'Update',
                  textColor: AppColors.bgColor,
                  textSize: 16.sp,
                  onTap: () {  },
                ),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h,),
                  text: 'Cancel',
                  textColor: AppColors.textIcons,
                  textSize: 16.sp,
                  onTap: () {  },
                ),

                SizedBox(height: 100.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class PersonalDetailsRow extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const PersonalDetailsRow({
    required this.text,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF111111),
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400,
              fontSize: 18.25.sp,
            ),
          ),

          Icon(
            Icons.arrow_forward_ios,
            size: 20.r,
            color: Color(0xFF111111),
          )
        ],
      ),
    );
  }
}
