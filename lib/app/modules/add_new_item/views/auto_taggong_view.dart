import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/delete_item_view.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/item_added_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../../../../common/custom_button.dart';
import '../../../data/model/closet_item.dart';
import '../controllers/add_new_item_controller.dart';

class AutoTaggongView extends GetView<AddNewItemController> {
  final ClosetItem? item;

  const AutoTaggongView({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    // Derive display values from the item (with fallbacks to your old static text)
    final ClosetItem? closetItem = item;

    final String title =
    (closetItem?.subcategory?.isNotEmpty == true)
        ? closetItem!.subcategory!
        : (closetItem?.category ?? 'Midi Dress');

    final String colour =
    (closetItem?.colour?.isNotEmpty == true)
        ? closetItem!.colour!
        : 'Burgundy';

    final List<String> infoParts = [];
    if (closetItem?.season?.isNotEmpty == true) {
      infoParts.add(closetItem!.season!);
    }
    if (closetItem?.style?.isNotEmpty == true) {
      infoParts.add(closetItem!.style!);
    }
    if (closetItem?.weather?.isNotEmpty == true) {
      infoParts.add(closetItem!.weather!);
    }
    final String infoText =
    infoParts.isNotEmpty ? infoParts.join(', ') : 'Winter, Chic, Office';

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 👇 image: network if we have an item, else your static asset
                closetItem != null && (closetItem.imageUrl ?? '').isNotEmpty
                    ? Image.network(
                  closetItem.imageUrl!,
                  scale: 4,
                  width: 392.w,
                  height: 588.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/add_new_item/photo_preview.png',
                      scale: 4,
                      width: 392.w,
                      height: 588.h,
                    );
                  },
                )
                    : Image.asset(
                  'assets/images/add_new_item/photo_preview.png',
                  scale: 4,
                  width: 392.w,
                  height: 588.h,
                ),

                SizedBox(height: 32.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),

                        SizedBox(height: 9.h,),

                        Text(
                          colour,
                          style: TextStyle(
                            color: AppColors.textIcons.withAlpha(179),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),

                        SizedBox(height: 5.h,),

                        Text(
                          infoText,
                          style: TextStyle(
                            color: AppColors.textIcons.withAlpha(179),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        'assets/images/add_new_item/edit.svg',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 44.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  color: AppColors.primary,
                  text: 'Save Changes',
                  textSize: 16.sp,
                  textColor: Colors.white,
                  onTap: () => Get.dialog(const ItemAddedView()),
                ),

                SizedBox(height: 13.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  text: 'Delete',
                  textSize: 16.sp,
                  textColor: AppColors.textIcons,
                  onTap: () => Get.dialog(DeleteItemView(item: closetItem)),
                ),

                SizedBox(height: 13.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.w,
                    vertical: 12.h,
                  ),
                  text: 'Cancel',
                  textSize: 16.sp,
                  textColor: AppColors.textIcons,
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

String _itemTitle(ClosetItem? item) {
  if (item == null) return 'Item';
  final s = item.subcategory?.isNotEmpty == true
      ? item.subcategory!
      : (item.category ?? 'Item');
  return s.capitalizeFirst!;
}

String _metaLine(ClosetItem? item) {
  if (item == null) return '';
  final parts = <String>[];

  if ((item.season ?? '').isNotEmpty) {
    parts.add(item.season!);
  }
  if ((item.style ?? '').isNotEmpty) {
    parts.add(item.style!);
  }
  if ((item.tags ?? []).isNotEmpty) {
    parts.addAll(item.tags!);
  }

  return parts.join(', ');
}