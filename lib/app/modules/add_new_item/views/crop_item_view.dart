import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/add_new_item/controllers/crop_item_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import 'reframe_view.dart'; // for DiscardEditsDialog

class CropItemView extends StatelessWidget {
  const CropItemView({super.key});

  @override
  Widget build(BuildContext context) {
    // Register controller for this screen
    final CropItemController controller = Get.put(CropItemController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => Get.dialog(const DiscardEditsDialog()),
          child: Icon(
            Icons.close,
            size: 24.r,
            color: AppColors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CROP AREA
              Container(
                width: double.infinity,
                height: 394.h,
                color: const Color(0xFFF0F1ED),
                child: Obx(() {
                  final bytes = controller.imageBytes.value;
                  if (bytes == null) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Crop(
                    controller: controller.cropController,
                    image: bytes,
                    aspectRatio: 3 / 4,
                    onCropped: controller.handleCropResult,
                  );
                }),
              ),

              SizedBox(height: 159.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back -> Discard dialog
                    GestureDetector(
                      onTap: () => Get.dialog(const DiscardEditsDialog()),
                      child: Icon(
                        Icons.arrow_back,
                        size: 20.r,
                        color: AppColors.textIcons,
                      ),
                    ),

                    // Done -> trigger crop
                    GestureDetector(
                      onTap: controller.startCrop,
                      child: Obx(() {
                        return Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: controller.isCropping.value
                              ? SizedBox(
                            width: 14.r,
                            height: 14.r,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.bgColor,
                              ),
                            ),
                          )
                              : Text(
                            'Done',
                            style: TextStyle(
                              color: AppColors.bgColor,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
