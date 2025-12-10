import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/crop_item_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import 'package:watowear_chloe/common/custom_button.dart';

import '../controllers/add_new_item_controller.dart';

class ReframeView extends GetView<AddNewItemController> {
  const ReframeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => Get.dialog(DiscardEditsDialog()),
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
              Obx(() {
                if (controller.reframeFiles.isEmpty) {
                  // Fallback: you can keep a placeholder if nothing selected
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 19.w,
                      children: [
                        Container(
                          width: 267.w,
                          height: 329.h,
                          color: const Color(0xFFF0F1ED),
                          alignment: Alignment.center,
                          child: Text(
                            'No items selected',
                            style: TextStyle(
                              color: AppColors.textIcons,
                              fontFamily: 'Comfortaa',
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 19.w,
                    children: List.generate(controller.reframeFiles.length, (index) {
                      final file = controller.reframeFiles[index];

                      return GestureDetector(
                        onTap: () => Get.to(
                              () => const CropItemView(),
                          arguments: index,   // 👈 this index matches reframeFiles[index]
                        ),
                        child: Container(
                          width: 267.w,
                          height: 329.h,
                          color: const Color(0xFFF0F1ED),
                          child: Image.file(
                            file,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),

              SizedBox(height: 15.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w,),
                child: GestureDetector(
                  onTap: () {  },
                  child: Icon(
                    Icons.crop_free_outlined,
                    size: 24.r,
                    color: AppColors.black,
                  ),
                ),
              ),

              SizedBox(height: 159.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.dialog(const DiscardEditsDialog()),
                      child: Icon(
                        Icons.arrow_back,
                        size: 20.r,
                        color: AppColors.textIcons,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => Get.dialog(CongratulationsDialog()),
                      child: Row(
                        spacing: 13.w,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                            ),
                          ),

                          Icon(
                            Icons.arrow_forward,
                            size: 20.r,
                            color: AppColors.textIcons,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 159.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w,),
                child: Column(
                  spacing: 13.h,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h,),
                      color: AppColors.primary,
                      text: 'Add to closet',
                      textSize: 16.sp,
                      textColor: AppColors.bgColor,
                      onTap: () async {
                        final success = await controller.uploadReframeFilesToCloset();
                        if (success) {
                          Get.dialog(const CongratulationsDialog());
                        } else {
                          // Optional: show error
                          // Get.snackbar('Error', 'Failed to add some items to closet');
                        }
                      },
                    ),

                    CustomButton(
                      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h,),
                      text: 'Back',
                      textSize: 16.sp,
                      textColor: AppColors.primary,
                      onTap: () => Get.back(),
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


class DiscardEditsDialog extends StatelessWidget {
  const DiscardEditsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 49.h,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Discard edits',
              style: TextStyle(
                color: AppColors.textIcons,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),

            SizedBox(height: 13.h,),

            Text(
              'If you discard now, any changes you\'ve made will not be saved.',
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 31.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  // Discard
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 12.h,
                  ),
                  textSize: 16.sp,
                  textColor: AppColors.primary,
                  text: 'Discard',
                  onTap: () {
                    final addController = Get.find<AddNewItemController>();
                    addController.discardSelection();
                    Get.back(); // close dialog
                  },
                ),

                CustomButton(
                  // Cancel
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 12.h,
                  ),
                  color: AppColors.primary,
                  textSize: 16.sp,
                  textColor: AppColors.bgColor,
                  text: 'Cancel',
                  onTap: () => Get.back(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


class CongratulationsDialog extends StatelessWidget {
  const CongratulationsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 49.h,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/add_new_item/congratulations.png',
              scale: 4,
            ),

            SizedBox(height: 13.h,),

            Text(
              'Congratulations',
              style: TextStyle(
                color: AppColors.textIcons,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),

            SizedBox(height: 15.h,),

            Text(
              '9 new pieces added. First mission complete. Your journey begins.',
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 31.h,),

            Column(
              spacing: 20.h,
              children: [
                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 12.h,
                  ),
                  color: Colors.black,
                  textSize: 16.sp,
                  textColor: AppColors.bgColor,
                  text: 'Unlock Rewards',
                  onTap: () {  },
                ),

                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 12.h,
                  ),
                  color: AppColors.primary,
                  textSize: 16.sp,
                  textColor: AppColors.bgColor,
                  text: 'Add more items',
                  onTap: () {  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
