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

    // Key to find the position of the gender field
    final GlobalKey genderFieldKey = GlobalKey();

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

            // GENDER DROPDOWN FIELD (now overlay-based)
            AnimatedContainer(
              key: genderFieldKey,
              duration: const Duration(milliseconds: 200),
              height: 48.h,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () =>
                    controller.toggleGenderDropdown(context, genderFieldKey),
                child: Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.textIcons.withAlpha(128),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.selectedGender[0].value
                            ? 'Male'
                            : controller.selectedGender[1].value
                            ? 'Female'
                            : controller.selectedGender[2].value
                            ? 'Non binary'
                            : 'Gender',
                        style: TextStyle(
                          color: AppColors.textIcons,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      Icon(
                        controller.genderClicked.value
                            ? Icons.keyboard_arrow_up_outlined
                            : Icons.keyboard_arrow_down_outlined,
                        size: 20.r,
                        color: const Color(0xFF141B34),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.h),

            // Everything below is unchanged: Age, Height, Weight, Location toggle...
            Text(
              'Age',
              style: TextStyle(
                color: AppColors.textIcons,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 45.h,
              child: TextField(
                controller: controller.ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter your age',
                  hintStyle: TextStyle(
                    color: const Color(0xFFAEAEAC),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                  contentPadding: EdgeInsets.only(top: 0.h),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFFAEAEAC),
                      width: 0.7.r,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFFAEAEAC),
                      width: 0.7.r,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFFAEAEAC),
                      width: 0.7.r,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.h),

            // ... keep your Height, Weight, and Location sections exactly as before ...
            // (no layout changes needed there)
            // ---- Height ----
            Text(
              'Height',
              style: TextStyle(
                color: AppColors.textIcons,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 50.h,
              child: TextField(
                controller: controller.heightController,
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'Enter your height',
                  hintStyle: TextStyle(
                    color: const Color(0xFFAEAEAC),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                  contentPadding: EdgeInsets.only(top: 10.h),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFFAEAEAC),
                      width: 0.7.r,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFFAEAEAC),
                      width: 0.7.r,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFFAEAEAC),
                      width: 0.7.r,
                    ),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () =>
                        controller.isCm.value = !controller.isCm.value,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.3.r,
                            ),
                          ),
                          child: Obx(
                                () => Text(
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
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.h),

            // ---- Weight ----
            Text(
              'Weight',
              style: TextStyle(
                color: AppColors.textIcons,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 50.h,
              child: TextField(
                controller: controller.weightController,
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'Enter your weight',
                  hintStyle: TextStyle(
                    color: const Color(0xFFAEAEAC),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                  contentPadding: EdgeInsets.only(top: 10.h),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFFAEAEAC),
                      width: 0.7.r,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFFAEAEAC),
                      width: 0.7.r,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFFAEAEAC),
                      width: 0.7.r,
                    ),
                  ),
                  suffixIcon: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => controller.isKg.value =
                            !controller.isKg.value,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 7.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.3.r,
                                ),
                              ),
                              child: Obx(
                                    () => Text(
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
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            Row(
              spacing: 7.w,
              children: [
                GestureDetector(
                  onTap: () => controller.isLocationEnabled.value =
                  !controller.isLocationEnabled.value,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: controller.isLocationEnabled.value
                          ? 1.w
                          : 8.w,
                      vertical:
                      controller.isLocationEnabled.value ? 1.h : 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: controller.isLocationEnabled.value
                          ? AppColors.textIcons
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.black,
                        width: 0.36.r,
                      ),
                    ),
                    child: controller.isLocationEnabled.value
                        ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16.r,
                    )
                        : const SizedBox.shrink(),
                  ),
                ),
                Text(
                  'Enable location for climate access.',
                  style: TextStyle(
                    color: AppColors.textIcons,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
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
