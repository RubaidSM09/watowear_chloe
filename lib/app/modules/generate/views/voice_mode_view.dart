import 'dart:async';

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

class HoldOnCarouselController extends GetxController {
  // Replace these with your actual 3 PNGs
  final List<String> _allImages = [
    'assets/images/generate/1.png',
    'assets/images/generate/2.png',
    'assets/images/generate/3.png',
  ];

  late List<String> _orderedImages;
  Timer? _timer;

  // The image that just moved from right → left (we'll disable its position animation)
  String? _jumpImagePath;

  List<String> get displayedImages => List.unmodifiable(_orderedImages);
  String? get jumpImagePath => _jumpImagePath;

  @override
  void onInit() {
    super.onInit();
    _orderedImages = List<String>.from(_allImages);

    // Rotate every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      _rotate();
    });
  }

  void _rotate() {
    if (_orderedImages.length < 3) return;

    // Current positions
    final left = _orderedImages[0];
    final center = _orderedImages[1];
    final right = _orderedImages[2];

    // Desired mapping:
    // left   -> center
    // center -> right
    // right  -> left  (this is the "creepy" one we want to jump)
    _orderedImages[0] = right;   // new left
    _orderedImages[1] = left;    // new center
    _orderedImages[2] = center;  // new right

    // Mark the image that went from right -> left
    _jumpImagePath = right;

    update();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
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
            // ======= Animated carousel with no animation for right -> left jump =======
            GetBuilder<HoldOnCarouselController>(
              init: HoldOnCarouselController(),
              builder: (carousel) {
                final images = carousel.displayedImages;
                if (images.length < 3) {
                  return SizedBox(height: 140.h);
                }

                final leftImage = images[0];
                final centerImage = images[1];
                final rightImage = images[2];

                return SizedBox(
                  height: 140.h,
                  width: 260.w,
                  child: Stack(
                    children: [
                      _AnimatedCarouselCard(
                        key: ValueKey(leftImage),
                        imagePath: leftImage,
                        alignment: Alignment.centerLeft,
                        isCenter: false,
                        // 💡 if this image just went from right -> left, no position animation
                        disablePositionAnimation:
                        carousel.jumpImagePath == leftImage,
                      ),
                      _AnimatedCarouselCard(
                        key: ValueKey(centerImage),
                        imagePath: centerImage,
                        alignment: Alignment.center,
                        isCenter: true,
                        disablePositionAnimation: false,
                      ),
                      _AnimatedCarouselCard(
                        key: ValueKey(rightImage),
                        imagePath: rightImage,
                        alignment: Alignment.centerRight,
                        isCenter: false,
                        disablePositionAnimation: false,
                      ),
                    ],
                  ),
                );
              },
            ),
            // ====================================================================

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

class _AnimatedCarouselCard extends StatelessWidget {
  final String imagePath;
  final Alignment alignment;
  final bool isCenter;
  final bool disablePositionAnimation;

  const _AnimatedCarouselCard({
    super.key,
    required this.imagePath,
    required this.alignment,
    required this.isCenter,
    required this.disablePositionAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final alignDuration =
    disablePositionAnimation ? Duration.zero : const Duration(milliseconds: 500);

    return AnimatedAlign(
      duration: alignDuration,
      curve: Curves.easeInOut,
      alignment: alignment,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: isCenter ? 0 : 12.h,
        ),
        width: isCenter ? 90.w : 70.w,
        height: isCenter ? 120.h : 90.h,
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
