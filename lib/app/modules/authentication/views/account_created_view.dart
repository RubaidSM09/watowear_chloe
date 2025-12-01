import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/about_yourself/views/about_yourself_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import 'package:watowear_chloe/common/custom_button.dart';

class AccountCreatedView extends GetView {
  const AccountCreatedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 28.h,),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox.shrink(),
          
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.bgColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(26),
                            blurRadius: 2.r,
                            offset: Offset(-2.w, 2.h)
                          ),
                        ]
                      ),
                      child: Icon(
                        Icons.close,
                        color: Color(0xFF141B34),
                        size: 18.r,
                      ),
                    ),
                  )
                ],
              ),
          
              SizedBox(height: 15.h,),*/
          
              Icon(
                Icons.check,
                size: 49.r,
                color: Color(0xFF141B34),
              ),
          
              SizedBox(height: 15.h,),
              
              Text(
                'Account Created',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),

              SizedBox(height: 5.h,),

              Text(
                'Your account has been created successfully. Let’s get started!',
                style: TextStyle(
                  color: AppColors.textIcons.withAlpha(128),
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 24.h,),

              CustomButton(
                text: 'Continue',
                color: AppColors.primary,
                textColor: AppColors.bgColor,
                padding: EdgeInsets.symmetric(
                  horizontal: 48.w,
                  vertical: 12.h,
                ),
                onTap: () => Get.to(AboutYourselfView()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
