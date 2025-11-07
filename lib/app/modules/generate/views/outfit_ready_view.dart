import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class OutfitReadyView extends GetView {
  const OutfitReadyView({super.key});
  @override
  Widget build(BuildContext context) {
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
                  onTap: () {  },
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
