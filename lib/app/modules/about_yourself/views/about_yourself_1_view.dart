import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/about_yourself/controllers/about_yourself_controller.dart';

import '../../../../common/app_colors.dart';

class AboutYourself1View extends GetView<AboutYourselfController> {
  const AboutYourself1View({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AboutYourselfController());

    return Obx(() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi! Before I can help you look your best.....',
              style: TextStyle(
                color: AppColors.textIcons,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
              ),
            ),

            SizedBox(height: 10.h),

            Text(
              'Let’s get to know your style a little better.',
              style: TextStyle(
                color: AppColors.textIcons.withAlpha(128),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),

            SizedBox(height: 47.h),

            // Dropdown
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: controller.genderClicked.value ? 48.h + 200.h : 48.h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.textIcons.withAlpha(128)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.selectedGender[0].value ? 'Male'
                              : controller.selectedGender[1].value ? 'Female'
                              : controller.selectedGender[2].value ? 'Non binary'
                              : 'Gender',
                          style: TextStyle(
                            color: AppColors.textIcons,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.genderClicked.value = !controller.genderClicked.value,
                          child: Icon(
                            controller.genderClicked.value
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down_outlined,
                            size: 20.r,
                            color: const Color(0xFF141B34),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Make sure the popup lives inside the Stack's hit-test area
                  if (controller.genderClicked.value)
                    Positioned(
                      top: 48.h, left: 0, right: 0, // ⬅️ fill width for reliable taps
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 19.h),
                        color: Colors.white,
                        child: Column(
                          spacing: 4.h,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                controller.selectGender(0);
                                controller.genderClicked.value = false;
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 21.h),
                                color: controller.selectedGender[0].value
                                    ? Color(0xFFF4F1EB)
                                    : Colors.transparent,
                                child: Text('Male', style: TextStyle(
                                  color: Colors.black, fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w500, fontSize: 14.sp,
                                )),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                controller.selectGender(1);
                                controller.genderClicked.value = false;
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 21.h),
                                color: controller.selectedGender[1].value
                                    ? Color(0xFFF4F1EB)
                                    : Colors.transparent,
                                child: Text('Female', style: TextStyle(
                                  color: Colors.black, fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w500, fontSize: 14.sp,
                                )),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                controller.selectGender(2);
                                controller.genderClicked.value = false;
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 21.h),
                                color: controller.selectedGender[2].value
                                    ? Color(0xFFF4F1EB)
                                    : Colors.transparent,
                                child: Text('Non binary', style: TextStyle(
                                  color: Colors.black, fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w500, fontSize: 14.sp,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            // The rest reads Rx values too; keep them inside this Obx
            Text('Age', style: TextStyle(
              color: AppColors.textIcons, fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w600, fontSize: 16.sp,
            )),
            SizedBox(height: 9.h),
            TextField(
              controller: controller.ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter your age',
                hintStyle: TextStyle(
                  color: Colors.black, fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500, fontSize: 12.sp,
                ),
              ),
            ),

            SizedBox(height: 24.h),

            Text('Height', style: TextStyle(
              color: AppColors.textIcons, fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w600, fontSize: 16.sp,
            )),
            SizedBox(height: 9.h),
            TextField(
              controller: controller.heightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Enter your height',
                hintStyle: TextStyle(
                  color: Colors.black, fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500, fontSize: 12.sp,
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
                        child: Obx(() => Text(
                          controller.isCm.value ? 'cm' : 'ft',
                          style: TextStyle(
                            color: const Color(0xFF111111),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24.h),

            Text('Weight', style: TextStyle(
              color: AppColors.textIcons, fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w600, fontSize: 16.sp,
            )),
            SizedBox(height: 9.h),
            TextField(
              controller: controller.weightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Enter your weight',
                hintStyle: TextStyle(
                  color: Colors.black, fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500, fontSize: 12.sp,
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
                        child: Obx(() => Text(
                          controller.isKg.value ? 'kg' : 'lbs',
                          style: TextStyle(
                            color: const Color(0xFF111111),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24.h),

            Row(
              spacing: 7.w,
              children: [
                GestureDetector(
                  onTap: () => controller.isLocationEnabled.value = !controller.isLocationEnabled.value,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: controller.isLocationEnabled.value ? 1.w : 8.w,
                      vertical: controller.isLocationEnabled.value ? 1.w : 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: controller.isLocationEnabled.value ? AppColors.textIcons : Colors.transparent,
                      border: Border.all(color: Colors.black, width: 0.36.r),
                    ),
                    child: controller.isLocationEnabled.value
                        ? Icon(Icons.check, color: Colors.white, size: 16.r)
                        : const SizedBox.shrink(),
                  ),
                ),
                Text(
                  'Enable location for climate access.',
                  style: TextStyle(
                    color: AppColors.textIcons, fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500, fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
