import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../common/app_colors.dart';

class PrivacyPolicyView extends GetView {
  const PrivacyPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 11.h,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFDADADA),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.h,
                    children: [
                      PrivacyPolicyPoint(
                        pointNumber: 1,
                        title: 'Who We Are',
                        description: 'We are WATOWEAR, a style technology company committed to reimagining the way you connect with your wardrobe.  We process your personal data responsibly and transparently, always with the goal of creating an experience that feels both effortless and secure.',
                        onTap: () {  },
                      ),
                
                      PrivacyPolicyPoint(
                        pointNumber: 2,
                        title: 'How We Use Your Data',
                        description: 'Your data allows us to tailor your WATOWEAR experience, from managing your account and preferences to curating personalised recommendations and insights that evolve with your style.',
                        onTap: () {  },
                      ),
                
                      PrivacyPolicyPoint(
                        pointNumber: 3,
                        title: 'Why We Use Your Data',
                        description: 'We use your data to deliver the services you choose,  like syncing your closet, generating outfits, or improving your experience through intelligent customisation.  In some cases, we rely on your consent to share curated updates or exclusive features designed around you.',
                        onTap: () {  },
                      ),
                
                      PrivacyPolicyPoint(
                        pointNumber: 4,
                        title: 'Who We Share It With',
                        description: 'We only collaborate with trusted technology and service partners who help us operate seamlessly, always under strict confidentiality and data protection standards.  Your data is never sold, and every collaboration is guided by integrity and security.',
                        onTap: () {  },
                      ),
                
                      PrivacyPolicyPoint(
                        pointNumber: 5,
                        title: 'Your Rights',
                        description: 'You’re in control. You can access, edit, or delete your data at any time. You may also choose how we use it, object to certain processing, or request a copy for your records.  We believe privacy is not just a right , it’s part of our design philosophy.',
                        onTap: () {  },
                      ),
                
                      Text(
                        'We invite you to read our full Privacy Policy below to understand how WATOWEAR uses your data to craft a more intuitive, secure, and personalised experience,  always with you in control.',
                        style: TextStyle(
                          color: Color(0xFF4B5563),
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {  },
                      child: Image.asset(
                        'assets/images/profile/settings/share.png',
                        scale: 4,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class PrivacyPolicyPoint extends StatelessWidget {
  final int pointNumber;
  final String title;
  final String description;
  final void Function()? onTap;

  const PrivacyPolicyPoint({
    required this.pointNumber,
    required this.title,
    required this.description,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$pointNumber. ',
          style: TextStyle(
            color: AppColors.textIcons,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.textIcons,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
              ),
            ),

            SizedBox(
              width: 312.5.w,
              child: Text(
                description,
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                ),
              ),
            ),

            GestureDetector(
              onTap: onTap,
              child: Text(
                '[See more →]',
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
