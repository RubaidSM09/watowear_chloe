import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_button.dart';
import '../../../data/model/closet_item.dart';
import '../../library/controllers/library_controller.dart';

class DeleteItemView extends GetView {
  final ClosetItem? item;

  const DeleteItemView({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 28.w,
          vertical: 49.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 6.h,
            children: [
              Text(
                'Delete Item',
                style: TextStyle(
                  color: AppColors.textIcons,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),

              SizedBox(height: 13.h,),

              Text(
                'Are you sure you want to delete this item? This action cannot be undone.',
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 31.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 12.h,
                    ),
                    text: 'Yes Delete',
                    textSize: 16.sp,
                    textColor: Color(0xFF6F767E),
                    onTap: () async {
                      final itemId = item?.id;
                      if (itemId == null) {
                        Get.back(); // close dialog
                        Get.snackbar('Error', 'Invalid item.');
                        return;
                      }

                      final libraryController = Get.find<LibraryController>();
                      final success =
                      await libraryController.deleteClosetItem(itemId);

                      Get.back(); // close dialog

                      if (success) {
                        // Also pop AutoTaggongView to go back to closet
                        Get.back();
                        Get.snackbar(
                          'Deleted',
                          'Item removed from your closet.',
                        );
                      } else {
                        Get.snackbar(
                          'Error',
                          'Failed to delete item. Please try again.',
                        );
                      }
                    },
                  ),

                  CustomButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 12.h,
                    ),
                    color: AppColors.primary,
                    text: 'Cancel',
                    textSize: 16.sp,
                    textColor: Colors.white,
                    onTap: () {
                      Get.back(); // just close dialog
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
