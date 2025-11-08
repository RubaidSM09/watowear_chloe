import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/generate/controllers/outfit_ready_controller.dart';
import 'package:watowear_chloe/app/modules/generate/views/generate_view.dart';
import 'package:watowear_chloe/app/modules/generate/views/voice_mode_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../../../../common/custom_button.dart';
import '../../profile/views/my_assistant_view.dart';

class OutfitReadyView extends GetView<OutfitReadyController> {
  const OutfitReadyView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OutfitReadyController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 20.w,
          children: [
            GestureDetector(
              onTap: () {  },
              child: Image.asset(
                'assets/images/generate/upload.png',
                scale: 2.5,
              ),
            ),

            GestureDetector(
              onTap: () {  },
              child: Icon(
                Icons.search,
                size: 25.r,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'Your outfit is ready !',
                  style: TextStyle(
                    color: Color(0xFF1F1F1F),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 17.sp,
                  ),
                ),
              ),

              SizedBox(height: 49.h,),

              Container(
                width: double.infinity,
                height: 405.h,
                color: Color(0xFFF0F1ED),
                child: Image.asset(
                  'assets/images/generate/outfit_1.png',
                  scale: 4,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 17.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'Outfit of 4 items',
                  style: TextStyle(
                    color: Color(0xFF4A4A4A),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 17.73.sp,
                  ),
                ),
              ),

              SizedBox(height: 25.h,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 11.w,
                  children: [
                    OutfitItemCard(
                      image: 'assets/images/generate/outfit_2.png',
                      title: 'Board Meeting',
                      subtitle: 'Professional and polished',
                    ),

                    OutfitItemCard(
                      image: 'assets/images/generate/outfit_3.png',
                      title: 'Board Meeting',
                      subtitle: 'Professional and polished',
                    ),

                    OutfitItemCard(
                      image: 'assets/images/generate/outfit_4.png',
                      title: 'Board Meeting',
                      subtitle: 'Professional and polished',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 150.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w,),
                child: GestureDetector(
                  onTap: () => Get.dialog(LoveItDialog()),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h,),
                    color: AppColors.primary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 15.w,
                      children: [
                        Text(
                          'Love it',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),

                        Icon(
                          Icons.favorite_border,
                          size: 20.r,
                          color: AppColors.bgColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w,),
                child: GestureDetector(
                  onTap: () => Get.dialog(
                    EditOutfitDialog(
                      selectedEditMode: controller.selectedEditMode,
                      selectEditMode: controller.selectEditMode,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 15.w,
                      children: [
                        Text(
                          'Edit outfit',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),

                        Icon(
                          Icons.edit,
                          size: 20.r,
                          color: Color(0xFF1F1F1F),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 100.h,),
            ],
          ),
        ),
      ),

      floatingActionButton: GestureDetector(
        onTap: () => Get.to(GenerateView()),
        child: Image.asset(
          'assets/images/onboarding/chloe_2.png',
          scale: 10,
        ),
      ),
    );
  }
}


class OutfitItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OutfitItemCard({
    required this.image,
    required this.title,
    required this.subtitle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6.h,
      children: [
        Image.asset(
          image,
          scale: 4,
          width: 183.w,
          height: 199.64.h,
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6.h,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF4A4A4A),
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 17.73.sp,
                ),
              ),

              SizedBox(
                width: 163.w,
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: Color(0xFF858585),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 13.3.sp,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}


class LoveItDialog extends StatelessWidget {
  const LoveItDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 65.h,),
        child: Column(
          spacing: 6.h,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check,
              size: 52.r,
              color: AppColors.textIcons,
            ),

            Text(
              'Your chosen outfit is now saved to your favourites collection.\n\nWe’re learning what you love!',
              style: TextStyle(
                color: Color(0xFF1F1F1F).withAlpha(204),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}


class EditOutfitDialog extends StatelessWidget {
  final RxList<RxBool> selectedEditMode;
  final void Function(int) selectEditMode;

  const EditOutfitDialog({
    required this.selectedEditMode,
    required this.selectEditMode,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 61.h,),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6.h,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'A quick tweak?',
                    style: TextStyle(
                      color: Color(0xFF1F1F1F).withAlpha(204),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              SizedBox(height: 62.h,),

              Row(
                spacing: 7.w,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectEditMode(0);
                    },
                    child: Container(
                      padding: EdgeInsets.all(7.5.r),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedEditMode[0].value ? AppColors.textIcons : Colors.transparent,
                          border: Border.all(
                            color: AppColors.textIcons,
                          )
                      ),
                    ),
                  ),

                  Text(
                    'Change color combination',
                    style: TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  )
                ],
              ),

              SizedBox(height: 10.h,),

              Row(
                spacing: 7.w,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectEditMode(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(7.5.r),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedEditMode[1].value ? AppColors.textIcons : Colors.transparent,
                          border: Border.all(
                            color: AppColors.textIcons,
                          )
                      ),
                    ),
                  ),

                  Text(
                    'Swap an item',
                    style: TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  )
                ],
              ),

              SizedBox(height: 10.h,),

              Row(
                spacing: 7.w,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectEditMode(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(7.5.r),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedEditMode[2].value ? AppColors.textIcons : Colors.transparent,
                          border: Border.all(
                            color: AppColors.textIcons,
                          )
                      ),
                    ),
                  ),

                  Text(
                    'Other',
                    style: TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  )
                ],
              ),

              SizedBox(height: 61.h,),

              CustomButton(
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
                color: AppColors.primary,
                text: 'Edit now',
                textColor: AppColors.bgColor,
                textSize: 16.sp,
                onTap: () {

                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
