import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/generate/views/chat_mode_view.dart';
import 'package:watowear_chloe/app/modules/generate/views/voice_mode_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../controllers/generate_controller.dart';

class GenerateView extends GetView<GenerateController> {
  const GenerateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            size: 20.r,
            color: AppColors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 57.h,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 106.h,),

                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/profile/my_assistant/chloe_assistant.png',
                  ),
                  radius: 75.r,
                ),

                Text(
                  'How can I help you today ?',
                  style: TextStyle(
                    color: AppColors.textIcons,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w800,
                    fontSize: 24.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 16.h,),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withAlpha(69),
                    ),
                    borderRadius: BorderRadius.circular(1.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {  },
                        child: SvgPicture.asset(
                          'assets/images/profile/my_assistant/close.svg',
                        ),
                      ),

                      GestureDetector(
                        onTap: () => Get.to(ChatModeView()),
                        child: SvgPicture.asset(
                          'assets/images/profile/my_assistant/chat.svg',
                        ),
                      ),

                      GestureDetector(
                        onTap: () => Get.to(VoiceModeView()),
                        child: SvgPicture.asset(
                          'assets/images/profile/my_assistant/voice_message.svg',
                        ),
                      ),
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
