import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:watowear_chloe/app/modules/generate/views/outfit_ready_view.dart';
import '../../../../common/app_colors.dart';
import '../controllers/voice_mode_controller.dart';

class VoiceModeView extends GetView<VoiceModeController> {
  const VoiceModeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure the controller is created
    Get.put(VoiceModeController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 59.w),
          child: SingleChildScrollView(
            child: Obx(
                  () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 106.h),

                  CircleAvatar(
                    backgroundImage: const AssetImage(
                      'assets/images/profile/my_assistant/chloe_assistant.png',
                    ),
                    radius: 75.r,
                  ),

                  SizedBox(height: 62.h),

                  Text(
                    'Hello!',
                    style: TextStyle(
                      color: const Color(0xFF1F1F1F),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 24.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 11.h),

                  Text(
                    'Let’s find something that\nfeels just right for you today.',
                    style: TextStyle(
                      color: const Color(0xFF1F1F1F).withAlpha(204),
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 12.h),

                  // Optional: show call duration if in call
                  if (controller.isInCall.value)
                    Text(
                      _formatTime(controller.callSeconds.value),
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),

                  SizedBox(height: 27.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Close button = end call + start outfit WS
                      GestureDetector(
                        onTap: () async {
                          await controller.endCall();
                          // Show "Hold on" dialog while backend generates outfits
                          Get.dialog(const HoldOnDialog(),
                              barrierDismissible: false);
                          // Start listening for outfit_suggestions over WS
                          controller.startOutfitGeneration();
                        },
                        child: Image.asset(
                          'assets/images/generate/close_button.png',
                          scale: 4,
                        ),
                      ),

                      // Voice button = start call
                      GestureDetector(
                        onTap: controller.isInCall.value
                            ? null
                            : () {
                          controller.startCall();
                        },
                        child: Opacity(
                          opacity: controller.isInCall.value ? 0.5 : 1.0,
                          child: Image.asset(
                            'assets/images/generate/voice_button.png',
                            scale: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
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
            SizedBox(height: 32.h),
            Text(
              'Hold on...',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'I’m weaving your tailored\noutfit together.',
              style: TextStyle(
                color: const Color(0xFF1F1F1F).withAlpha(204),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 55.h),
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
            SizedBox(height: 5.h),
            GestureDetector(
              onTap: () {
                Get.back();
              },
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
