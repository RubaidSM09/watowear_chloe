import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:watowear_chloe/app/modules/profile/views/change_country_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/language_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/privacy_policy_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/privacy_preference_center_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/tn_c_app_features_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class SettingsView extends GetView {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 32.h,
              children: [
                SizedBox(height: 36.h,),

                SettingsRow(
                  text: 'Device settings',
                  onTap: () async {
                    final success = await openAppSettings();
                    if (!success) {
                      Get.snackbar(
                        'Error',
                        'Could not open device settings',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                ),

                SettingsRow(
                  text: 'Language',
                  onTap: () => Get.to(LanguageView()),
                ),

                SettingsRow(
                  text: 'Change country',
                  onTap: () => Get.to(ChangeCountryView()),
                ),

                SettingsRow(
                  text: 'Cookie settings',
                  onTap: () => Get.to(PrivacyPreferenceCenterView()),
                ),

                SettingsRow(
                  text: 'Privacy policy',
                  onTap: () => Get.to(PrivacyPolicyView()),
                ),

                SettingsRow(
                  text: 'T&C App features',
                  onTap: () => Get.to(TnCAppFeaturesView()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class SettingsRow extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const SettingsRow({
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
