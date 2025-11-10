import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:watowear_chloe/app/modules/about_yourself/controllers/about_yourself_controller.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_button.dart';
import '../../about_yourself/views/about_yourself_1_view.dart';
import '../../about_yourself/views/about_yourself_2_view.dart';
import '../../about_yourself/views/about_yourself_3_view.dart';
import '../../about_yourself/views/about_yourself_4_view.dart';
import '../../about_yourself/views/about_yourself_5_view.dart';
import '../../about_yourself/views/about_yourself_6_view.dart';

class PreferenceView extends GetView<AboutYourselfController> {
  const PreferenceView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AboutYourselfController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {  },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: [
                  if (controller.current.value == 1)
                    AboutYourself2View(),
                  if (controller.current.value == 2)
                    AboutYourself3View(),
                  if (controller.current.value == 3)
                    AboutYourself4View(),
                  if (controller.current.value == 4)
                    AboutYourself5View(),
                  /*AboutYourself1View(),
                  AboutYourself2View(),
                  AboutYourself3View(),
                  AboutYourself4View(),
                  AboutYourself5View(),
                  AboutYourself6View(),*/
                ],
              ),
            ),

            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}
