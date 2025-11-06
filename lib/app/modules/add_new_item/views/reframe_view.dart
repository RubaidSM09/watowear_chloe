import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import 'package:watowear_chloe/common/custom_button.dart';

class ReframeView extends GetView {
  const ReframeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => Get.dialog(DiscardEditsDialog()),
          child: Text(
            'X',
            style: TextStyle(
              color: AppColors.black,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 19.w,
                  children: [
                    GestureDetector(
                      onTap: () {  },
                      child: Container(
                        width: 267.w,
                        height: 329.h,
                        color: Color(0xFFF0F1ED),
                        child: Image.asset(
                          'assets/images/add_new_item/reframe_1.png',
                          scale: 4,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {  },
                      child: Container(
                        width: 267.w,
                        height: 329.h,
                        color: Color(0xFFF0F1ED),
                        child: Image.asset(
                          'assets/images/add_new_item/reframe_2.png',
                          scale: 4,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w,),
                child: GestureDetector(
                  onTap: () {  },
                  child: Icon(
                    Icons.crop_free_outlined,
                    size: 24.r,
                    color: AppColors.black,
                  ),
                ),
              ),

              SizedBox(height: 159.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {  },
                      child: Icon(
                        Icons.arrow_back,
                        size: 20.r,
                        color: AppColors.textIcons,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => Get.dialog(CongratulationsDialog()),
                      child: Row(
                        spacing: 13.w,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                            ),
                          ),

                          Icon(
                            Icons.arrow_forward,
                            size: 20.r,
                            color: AppColors.textIcons,
                          ),
                        ],
                      ),
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


class DiscardEditsDialog extends StatelessWidget {
  const DiscardEditsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 49.h,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Discard edits',
              style: TextStyle(
                color: AppColors.textIcons,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),

            SizedBox(height: 13.h,),

            Text(
              'If you discard now, any changes you\'ve made will not be saved.',
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 31.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 12.h,
                  ),
                  textSize: 16.sp,
                  textColor: AppColors.primary,
                  text: 'Discard',
                  onTap: () {  },
                ),

                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 12.h,
                  ),
                  color: AppColors.primary,
                  textSize: 16.sp,
                  textColor: AppColors.bgColor,
                  text: 'Cancel',
                  onTap: () {  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


class CongratulationsDialog extends StatelessWidget {
  const CongratulationsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 49.h,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/add_new_item/congratulations.png',
              scale: 4,
            ),

            SizedBox(height: 13.h,),

            Text(
              'Congratulations',
              style: TextStyle(
                color: AppColors.textIcons,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),

            SizedBox(height: 15.h,),

            Text(
              '9 new pieces added. First mission complete. Your journey begins.',
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 31.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 12.h,
                  ),
                  color: Colors.black,
                  textSize: 16.sp,
                  textColor: AppColors.bgColor,
                  text: 'Unlock Rewards',
                  onTap: () {  },
                ),

                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 12.h,
                  ),
                  color: AppColors.primary,
                  textSize: 16.sp,
                  textColor: AppColors.bgColor,
                  text: 'Add more items',
                  onTap: () {  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
