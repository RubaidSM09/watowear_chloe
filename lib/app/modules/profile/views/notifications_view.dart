import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/profile/controllers/notifications_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Notifications',
          style: TextStyle(
            color: AppColors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w,),
          child: SingleChildScrollView(
            child: controller.isNotificationsEmpty.value ?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6.h,
              children: [
                Text(
                  'Your Inbox is all clear!',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),

                Text(
                  'Whenever something fabulous comes yp it’ll land right here until enjoying the calin',
                  style: TextStyle(
                    color: AppColors.textIcons.withAlpha(179),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            )
                :
            Column(
              spacing: 24.w,
              children: [
                NotificationsCard(
                  icon: 'assets/images/profile/notifications/new_outfit.svg',
                  title: 'New Outfit Ready',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore',
                  timeAgo: '2 min ago',
                  onTapText: 'View Details',
                  onTap: () {  },
                ),

                NotificationsCard(
                  icon: 'assets/images/profile/notifications/mission.svg',
                  title: 'Today’s mission',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore',
                  timeAgo: '2 min ago',
                  onTapText: 'Let’s Get Started',
                  onTap: () {  },
                ),

                NotificationsCard(
                  icon: 'assets/images/profile/notifications/new_outfit.svg',
                  title: 'Today’s forecast',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore',
                  timeAgo: '2 min ago',
                  onTapText: 'Generate Outfit',
                  onTap: () {  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class NotificationsCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final String timeAgo;
  final String onTapText;
  final void Function()? onTap;

  const NotificationsCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.timeAgo,
    required this.onTapText,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 21.h,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.r),
        border: Border.all(
          color: Color(0xFF111111).withAlpha(28),
        ),
      ),
      child: Row(
        spacing: 10.w,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
          ),

          SizedBox(
            width: 325.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 15.25.sp,
                  ),
                ),

                SizedBox(height: 2.h,),

                Text(
                  description,
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w300,
                    fontSize: 10.sp,
                  ),
                ),

                SizedBox(height: 3.h,),

                Text(
                  timeAgo,
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 9.sp,
                  ),
                ),

                SizedBox(height: 11.h,),

                GestureDetector(
                  onTap: onTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 1.w,
                    children: [
                      Text(
                        onTapText,
                        style: TextStyle(
                          color: AppColors.textIcons,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w600,
                          fontSize: 9.sp,
                        ),
                      ),

                      Icon(
                        Icons.arrow_right_alt_sharp,
                        size: 14.r,
                        color: AppColors.textIcons,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
