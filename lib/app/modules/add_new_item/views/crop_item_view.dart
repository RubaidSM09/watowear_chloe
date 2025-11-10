import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/add_new_item/views/reframe_view.dart';

import '../../../../common/app_colors.dart';

class CropItemView extends GetView {
  const CropItemView({super.key});
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
              GestureDetector(
                onTap: () => Get.to(CropItemView()),
                child: Container(
                  width: double.infinity,
                  height: 394.h,
                  color: Color(0xFFF0F1ED),
                  child: Image.asset(
                    'assets/images/add_new_item/reframe_crop.png',
                    scale: 4,
                    fit: BoxFit.contain,
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
                      onTap: () {  },
                      child: Icon(
                        Icons.arrow_back,
                        size: 20.r,
                        color: AppColors.textIcons,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: AppColors.bgColor,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
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
