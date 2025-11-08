import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/profile_controller.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_button.dart';
import '../../../../common/custom_text_fields.dart';

class AddPhoneNumberView extends GetView<ProfileController> {
  const AddPhoneNumberView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Add Phone Number',
          style: TextStyle(
            color: AppColors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
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
                Text(
                  'Enter your new phone number',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 24.h,),

                Row(
                  children: [
                    // Country code dropdown
                    Obx(
                          () => DropdownButton<String>(
                            value: controller.selectedCode.value,
                            icon: const Icon(Icons.arrow_drop_down, size: 20),
                            underline: Container(
                              height: 1.h,
                              color: AppColors.textIcons,
                            ),
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textIcons.withAlpha(179),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                            ),
                            items: controller.countryCodes
                                .map(
                                  (code) => DropdownMenuItem<String>(
                                value: code,
                                child: Text(code),
                              ),
                            )
                                .toList(),
                            onChanged: (value) {
                              if (value != null) controller.changeCode(value);
                            },
                          ),
                    ),

                    const SizedBox(width: 12),

                    // Phone number text field
                    Expanded(
                      child: TextField(
                        controller: controller.phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Phone number',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: AppColors.textIcons.withAlpha(179),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w600,
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.textIcons
                            ),
                            borderRadius: BorderRadius.zero,
                          ), // underline comes from Container
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h,),

                CustomTextFiled(
                  padding: EdgeInsets.all(16.r),
                  hintText: 'Confirm your password',
                  hintStyle: TextStyle(
                    color: AppColors.textIcons.withAlpha(179),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.obscureText2.value = !controller.obscureText2.value;
                    },
                    child: Icon(
                      controller.obscureText2.value ? Icons.visibility_off_sharp : Icons.visibility_sharp,
                      color: Color(0xFFCDCDC0),
                    ),
                  ),
                  obscureText: controller.obscureText2.value,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.textIcons
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),

                SizedBox(height: 78.h,),

                CustomButton(
                  text: 'Add phone number',
                  textSize: 16.sp,
                  textColor: AppColors.bgColor,
                  color: AppColors.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  onTap: () => Get.back(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
