import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/help_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HelpController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Help',
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
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How can we help you?',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'We are at your disposal for any question related to WATOWEAR',
                  style: TextStyle(
                    color: AppColors.textIcons.withAlpha(179),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 13.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withAlpha(46),
                    ),
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: Column(
                    children: [
                      // Multiline text field
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 258.h,
                          maxHeight: 258.h,
                        ),
                        child: TextField(
                          controller: controller.textController,
                          maxLines: null,
                          maxLength: controller.maxLength,
                          decoration: InputDecoration(
                            hintText: 'Message',
                            hintStyle: TextStyle(
                              color: AppColors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                            isCollapsed: true,
                            border: InputBorder.none,
                            counterText: "",
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            onPressed: controller.onAttachPressed,
                            icon: const Icon(Icons.attach_file, size: 20),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Obx(
                                    () => Text(
                                  "${controller.currentLength.value}/${controller.maxLength}",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Obx(
                                    () => GestureDetector(
                                  onTap: controller.isSending.value
                                      ? null
                                      : controller.onSend,
                                  child: Text(
                                    controller.isSending.value
                                        ? "Sending..."
                                        : "Send",
                                    style: TextStyle(
                                      color: AppColors.textIcons,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Find the answers to your questions in our Frequently Asked Questions Section',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 26.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    spacing: 2.w,
                    children: [
                      Text(
                        'View FAQ',
                        style: TextStyle(
                          color: AppColors.textIcons,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt_sharp,
                        size: 20.r,
                        color: AppColors.textIcons,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
