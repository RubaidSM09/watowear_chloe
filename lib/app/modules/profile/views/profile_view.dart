import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/authentication/views/authentication_view.dart';
import 'package:watowear_chloe/app/modules/library/views/library_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/help_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/log_out_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/my_assistant_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/my_favourites_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/my_progress_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/notifications_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/personal_details_view.dart';
import 'package:watowear_chloe/app/modules/profile/views/settings_view.dart';
import 'package:watowear_chloe/common/app_colors.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 4.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Emma Johnson',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 20.53.sp,
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          'Bronze ',
                          style: TextStyle(
                            color: Color(0xFFBB5C13),
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),

                        Text(
                          '- Refiner',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  spacing: 17.w,
                  children: [
                    Image.asset(
                      'assets/images/home/search_icon.png',
                      scale: 4,
                    ),

                    Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                          )
                      ),
                      child: Image.asset(
                        'assets/images/home/profile_img.png',
                        scale: 4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(
                color: Colors.black.withAlpha(31),
              ),

              SizedBox(height: 19.02.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: Column(
                  spacing: 32.h,
                  children: [
                    ProfileRow(
                      text: 'My Closet',
                      onTap: () => Get.to(LibraryView()),
                    ),

                    ProfileRow(
                      text: 'My Progress',
                      onTap: () => Get.to(MyProgressView()),
                    ),

                    ProfileRow(
                      text: 'My Favourites',
                      onTap: () => Get.to(MyFavouritesView()),
                    ),

                    ProfileRow(
                      text: 'My Assistant',
                      onTap: () => Get.to(MyAssistantView()),
                    ),

                    ProfileRow(
                      text: 'Notifications (5)',
                      onTap: () => Get.to(NotificationsView()),
                    ),

                    ProfileRow(
                      text: 'Help',
                      onTap: () => Get.to(HelpView()),
                    ),

                    ProfileRow(
                      text: 'Personal Details',
                      onTap: () => Get.to(PersonalDetailsView()),
                    ),

                    ProfileRow(
                      text: 'Settings',
                      onTap: () => Get.to(SettingsView()),
                    ),

                    ProfileRow(
                      text: 'Rate our App',
                      onTap: () {  },
                    ),

                    ProfileRow(
                      text: 'Recommend our app',
                      onTap: () {  },
                    ),

                    ProfileRow(
                      text: 'My subscription',
                      onTap: () {  },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 80.16.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.offAll(LogOutView()),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                          fontSize: 18.25.sp,
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


class ProfileRow extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const ProfileRow({
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
              color: Color(0xFF111111),
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400,
              fontSize: 18.25.sp,
            ),
          ),

          Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF111111),
            size: 20.r,
          ),
        ],
      ),
    );
  }
}
