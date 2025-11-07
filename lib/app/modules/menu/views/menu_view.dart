import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/menu/views/faq_view.dart';
import 'package:watowear_chloe/app/modules/menu/views/shop_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuController> {
  const MenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: GestureDetector(
          onTap: () {  },
          child: Icon(
            Icons.arrow_back,
            size: 25.r,
            color: AppColors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 60.h,),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20.h,
              children: [
                MenuRow(
                  text: 'Shop',
                  onTap: () => Get.to(ShopView()),
                ),

                MenuRow(
                  text: 'Capsule Collections',
                  onTap: () {  },
                ),

                MenuRow(
                  text: 'Subscription',
                  onTap: () {  },
                ),

                MenuRow(
                  text: 'In app-purchases',
                  onTap: () {  },
                ),

                MenuRow(
                  text: 'Editorial content',
                  onTap: () {  },
                ),

                MenuRow(
                  text: 'Community & Sharing',
                  onTap: () {  },
                ),

                MenuRow(
                  text: 'FAQ Section',
                  onTap: () => Get.to(FaqView()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class MenuRow extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MenuRow({
    required this.text,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400,
              fontSize: 15.96.sp,
            ),
          ),

          Icon(
            Icons.arrow_forward_ios,
            size: 20.r,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
