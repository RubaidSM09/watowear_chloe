import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/generate/views/outfit_ready_view.dart';

import '../../../../common/app_colors.dart';

class VoiceModeView extends GetView {
  const VoiceModeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 59.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 106.h,),

                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/profile/my_assistant/chloe_assistant.png',
                  ),
                  radius: 75.r,
                ),

                SizedBox(height: 62.h,),

                Text(
                  'Hello!',
                  style: TextStyle(
                    color: Color(0xFF1F1F1F),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 24.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 11.h,),

                Text(
                  'Let’s find something that\nfeels just right for you today.',
                  style: TextStyle(
                    color: Color(0xFF1F1F1F).withAlpha(204),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 39.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {  },
                      child: Image.asset(
                        'assets/images/generate/close_button.png',
                        scale: 4,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => Get.dialog(HoldOnDialog()),
                      child: Image.asset(
                        'assets/images/generate/voice_button.png',
                        scale: 4,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class HoldOnDialog extends StatelessWidget {
  const HoldOnDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: EdgeInsets.all(32.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/generate/hold_on.png',
              scale: 4,
            ),

            SizedBox(height: 32.h,),

            Text(
              'Hold on...',
              style: TextStyle(
                color: Color(0xFF1F1F1F),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 24.sp,
              ),
            ),

            SizedBox(height: 4.h,),

            Text(
              'I’m weaving your tailored\noutfit together.',
              style: TextStyle(
                color: Color(0xFF1F1F1F).withAlpha(204),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 55.h,),

            GestureDetector(
              onTap: () {
                Get.back();
                Get.to(OutfitReadyView());
              },
              child: Text(
                'Notify me when ready',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            SizedBox(height: 5.h,),

            GestureDetector(
              onTap: () {  },
              child: Text(
                'Back',
                style: TextStyle(
                  color: AppColors.primary,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
