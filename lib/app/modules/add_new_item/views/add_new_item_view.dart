import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/photo_preview_view.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/reframe_view.dart';
import 'package:watowear_chloe/common/custom_button.dart';

import '../../../../common/app_colors.dart';
import '../controllers/add_new_item_controller.dart';

class AddNewItemView extends GetView<AddNewItemController> {
  const AddNewItemView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddNewItemController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Add New Item',
          style: TextStyle(
            color: AppColors.textIcons,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w400,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          return SingleChildScrollView(
            controller: controller.scrollController, // 👈 for infinite scroll
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------------- TABS ----------------
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.selectMethod(0);
                        },
                        child: Text(
                          'Camera',
                          style: TextStyle(
                            color: controller.selectedMethod[0].value
                                ? const Color(0xFF111111)
                                : AppColors.textIcons.withAlpha(179),
                            fontFamily: 'Comfortaa',
                            fontWeight: controller.selectedMethod[0].value
                                ? FontWeight.w700
                                : FontWeight.w500,
                            fontSize: 16.sp,
                            decoration: controller.selectedMethod[0].value
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          controller.selectMethod(1);
                        },
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                            color: controller.selectedMethod[1].value
                                ? const Color(0xFF111111)
                                : AppColors.textIcons.withAlpha(179),
                            fontFamily: 'Comfortaa',
                            fontWeight: controller.selectedMethod[1].value
                                ? FontWeight.w700
                                : FontWeight.w500,
                            fontSize: 16.sp,
                            decoration: controller.selectedMethod[1].value
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          controller.selectMethod(2);
                        },
                        child: Text(
                          'Library',
                          style: TextStyle(
                            color: controller.selectedMethod[2].value
                                ? const Color(0xFF111111)
                                : AppColors.textIcons.withAlpha(179),
                            fontFamily: 'Comfortaa',
                            fontWeight: controller.selectedMethod[2].value
                                ? FontWeight.w700
                                : FontWeight.w500,
                            fontSize: 16.sp,
                            decoration: controller.selectedMethod[2].value
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 37.h,),

                // ---------------- CAMERA SECTION ----------------
                if (controller.selectedMethod[0].value)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w,),
                    child: Column(
                      children: [
                        Obx(() {
                          if (!controller.isCameraInitialized.value ||
                              controller.cameraController == null) {
                            return Container(
                              height: 300.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withAlpha(84),
                                ),
                              ),
                              child: const CircularProgressIndicator(),
                            );
                          }

                          return Container(
                            width: double.infinity,
                            height: 300.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black.withAlpha(84),
                              ),
                            ),
                            child: ClipRect(
                              child: CameraPreview(controller.cameraController!),
                            ),
                          );
                        }),

                        SizedBox(height: 26.h,),

                        Text(
                          'Tips for better photos:',
                          style: TextStyle(
                            color: const Color(0xFF3D3B38),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                          ),
                        ),

                        SizedBox(height: 16.h,),

                        Column(
                          spacing: 10.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            BetterPhotosTipsPoint(point: 'Use good lighting'),
                            BetterPhotosTipsPoint(point: 'Keep the item centered'),
                            BetterPhotosTipsPoint(point: 'Avoid shadows and reflections'),
                            BetterPhotosTipsPoint(point: 'Use a plain background'),
                          ],
                        ),

                        SizedBox(height: 18.h,),

                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Watch video here',
                            style: TextStyle(
                              color: AppColors.accent,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.accent,
                            ),
                          ),
                        ),

                        SizedBox(height: 48.h,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => controller.switchCamera(),
                              child: Text(
                                'Switch camera',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 40.h,),

                        CustomButton(
                          padding: EdgeInsets.symmetric(
                            horizontal: 48.w,
                            vertical: 12.h,
                          ),
                          color: AppColors.primary,
                          text: 'Preview',
                          textSize: 16.sp,
                          textColor: Colors.white,
                          onTap: () => controller.captureAndGoToPreview(),
                        ),
                      ],
                    ),
                  ),

                // ---------------- GALLERY SECTION ----------------
                if (controller.selectedMethod[1].value)
                  Obx(() {
                    if (controller.galleryAssets.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: SizedBox(
                          height: 200.h,
                          child: Center(
                            child: Text(
                              'No photos found',
                              style: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: 14.sp,
                                color: AppColors.textIcons,
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.w,
                          mainAxisSpacing: 8.h,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: controller.galleryAssets.length,
                        itemBuilder: (context, index) {
                          final asset = controller.galleryAssets[index];

                          return GestureDetector(
                            onTap: () => controller.toggleGallerySelection(asset),
                            child: Obx(() {    // 👈 ADD THIS LINE
                              final bool isSelected =
                              controller.selectedGalleryAssetIds.contains(asset.id);

                              return Stack(
                                children: [
                                  // Thumbnail
                                  Positioned.fill(
                                    child: FutureBuilder<Uint8List?>(
                                      future: asset.thumbnailDataWithSize(
                                        const ThumbnailSize(400, 400),
                                      ),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Container(
                                            color: Colors.grey.shade200,
                                          );
                                        }
                                        return ClipRRect(
                                          borderRadius: BorderRadius.circular(4.r),
                                          child: Image.memory(
                                            snapshot.data!,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                  // ✔ Tick Circle
                                  Positioned(
                                    top: 6.h,
                                    right: 6.w,
                                    child: Container(
                                      width: 22.r,
                                      height: 22.r,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected
                                            ? AppColors.primary
                                            : Colors.white.withOpacity(0.9),
                                        border: Border.all(
                                          color: isSelected
                                              ? AppColors.primary
                                              : Colors.grey.shade400,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: isSelected
                                          ? Icon(
                                        Icons.check,
                                        size: 16.r,
                                        color: Colors.white,
                                      )
                                          : const SizedBox.shrink(),
                                    ),
                                  ),
                                ],
                              );
                            }), // 👈 CLOSE Obx
                          );
                        },
                      ),
                    );
                  }),
              ],
            ),
          );
        }),
      ),

      bottomSheet: Obx(() {
        return controller.selectedMethod[1].value
            ? Container(
          padding: EdgeInsets.symmetric(
            horizontal: 23.w,
            vertical: 30.h,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r),
              topLeft: Radius.circular(20.r),
            ),
            color: AppColors.bgColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: 13.h,
              children: [
                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  color: AppColors.primary,
                  textColor: AppColors.bgColor,
                  textSize: 16.sp,
                  text: controller.isUploaded.value
                      ? 'Continue in Background'
                      : 'Import selection',
                  onTap: () async {
                    // Only for Gallery tab
                    if (!controller.selectedMethod[1].value) return;

                    if (controller.selectedGalleryAssetIds.isEmpty) {
                      // Optionally show a snackbar
                      // Get.snackbar('Select photos', 'Please select at least one item.');
                      return;
                    }

                    final files = await controller.resolveSelectedGalleryFiles();
                    if (files.isEmpty) return;

                    // These are the working files for reframe/crop
                    controller.reframeFiles.assignAll(files);

                    // Go directly to ReframeView
                    Get.to(const ReframeView());
                  },
                ),

                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  textColor: AppColors.primary,
                  textSize: 16.sp,
                  text: 'Cancel',
                  onTap: () {},
                ),
              ],
            ),
          ),
        )
            : const SizedBox.shrink();
      }),
    );
  }
}


class BetterPhotosTipsPoint extends StatelessWidget {
  final String point;

  const BetterPhotosTipsPoint({
    required this.point,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF3D3B38),
          ),
        ),

        Text(
          point,
          style: TextStyle(
            color: Color(0xFF374151),
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w300,
            fontSize: 12.sp,
          ),
        )
      ],
    );
  }
}


class _AngledBarPainter extends CustomPainter {
  final double progress;
  _AngledBarPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // Background bar
    final bgPaint = Paint()
      ..color = const Color(0xFFE8E8E8)
      ..style = PaintingStyle.fill;
    final bgRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(4),
    );
    canvas.drawRRect(bgRect, bgPaint);

    // Filled (angled) portion
    final fillWidth = size.width * progress;
    final path = Path();

    // Define slant width
    const slant = 8.0;

    // Draw angled path
    path.moveTo(0, 0);
    path.lineTo(fillWidth - slant, 0);
    path.lineTo(fillWidth, size.height);
    path.lineTo(0, size.height);
    path.close();

    final fillPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF1E1E1E), // black
          Color(0xFF7E7647), // olive
          Color(0xFFD6D1B0), // beige
        ],
        stops: [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant _AngledBarPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
