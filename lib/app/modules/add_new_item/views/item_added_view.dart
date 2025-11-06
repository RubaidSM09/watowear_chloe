import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class ItemAddedView extends GetView {
  const ItemAddedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 65.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 6.h,
            children: [
              SvgPicture.asset(
                'assets/images/add_new_item/tick.svg',
              ),

              Text(
                'Item added to your closet. Enjoy curating your style ',
                style: TextStyle(
                  color: AppColors.textIcons.withAlpha(179),
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
