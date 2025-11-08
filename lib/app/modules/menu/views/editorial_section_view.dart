import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/app_colors.dart';
import '../controllers/shop_controller.dart';

class EditorialSectionView extends GetView<ShopController> {
  const EditorialSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => controller.showEditorialArticle.value
          ? _buildArticleDetail()
          : _buildMagazineHome(),
    );
  }

  // ------------------------------------------------------------
  // MAGAZINE HOME (original layout)
  // ------------------------------------------------------------
  Widget _buildMagazineHome() {
    return Column(
      children: [
        // ----------------- MARQUEE TEXT -----------------
        SizedBox(
          height: 30.h,
          width: double.infinity,
          child: ClipRect(
            child: Obx(
                  () => Transform.translate(
                offset: Offset(controller.xOffset.value, 0),
                child: Text(
                  controller.marqueeText.value,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    color: AppColors.textIcons,
                    fontSize: 13.3.sp,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 6.h),

        // ----------------- TITLE: WTW Magazine -----------------
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Text(
                'WTW Magazine',
                style: TextStyle(
                  fontFamily: 'Abhaya_Libre',
                  fontWeight: FontWeight.w700,
                  fontSize: 28.sp,
                  height: 1.1,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                'Style insights, wardrobe rituals, and mindful\nfashion reads.',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w300,
                  fontSize: 13.sp,
                  color: AppColors.textIcons,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // ----------------- HERO IMAGE -----------------
        SizedBox(
          width: double.infinity,
          height: 248.h,
          child: Image.asset(
            'assets/images/editorial/hero_main.jpg',
            scale: 4,
            fit: BoxFit.fill,
          ),
        ),

        SizedBox(height: 24.h),

        // ----------------- MEET THE MAKERS -----------------
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text block
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Meet the\nMakers',
                          style: TextStyle(
                            fontFamily: 'Abhaya_Libre',
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                            height: 1.1,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Find your next favorite\nbrand, chosen with care.',
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                            fontSize: 11.5.sp,
                            color: AppColors.textIcons,
                            height: 1.3,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Browse Brands',
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: AppColors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                // Image block
                Expanded(
                  flex: 7,
                  child: SizedBox(
                    height: 160.h,
                    child: Image.asset(
                      'assets/images/editorial/meet_the_makers.jpg',
                      scale: 4,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 24.h),

        // ----------------- BLACK & WHITE IMAGE STRIP -----------------
        SizedBox(
          width: double.infinity,
          height: 210.h,
          child: Image.asset(
            'assets/images/editorial/color_stories_header.jpg',
            scale: 4,
            fit: BoxFit.fill,
          ),
        ),

        SizedBox(height: 24.h),

        // ----------------- COLOR STORIES BLOCK -----------------
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Text(
                'Color Stories',
                style: TextStyle(
                  fontFamily: 'Abhaya_Libre',
                  fontWeight: FontWeight.w700,
                  fontSize: 22.sp,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                'Finding Your Signature Palette\nA guide to discovering the colors that flatter\n'
                    'your skin tone, mood, and personality.',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w300,
                  fontSize: 11.5.sp,
                  color: AppColors.textIcons,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: controller.openEditorialArticle,
                child: Text(
                  'Read More',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: AppColors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // ----------------- CLOSET CONFIDENCE SECTION -----------------
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            height: 200.h,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/editorial/style_mean_to_me.jpg',
                  scale: 4,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  right: 16.w,
                  bottom: 20.h,
                  child: SizedBox(
                    width: 140.w,
                    child: Text(
                      'What Does\n“Style” Mean to\nme?',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Abhaya_Libre',
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 12.h),

        // Green carousel-style block
        Container(
          width: double.infinity,
          color: const Color(0xFF6B7456),
          padding: EdgeInsets.only(bottom: 24.h),
          child: Column(
            children: [
              SizedBox(height: 24.h),

              // Image inside the green block
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  height: 210.h,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/editorial/closet_confidence.jpg',
                    scale: 4,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              SizedBox(height: 18.h),

              // Dots indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Container(
                    width: index == 2 ? 7.r : 5.r,
                    height: index == 2 ? 7.r : 5.r,
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 2 ? Colors.white : Colors.white70,
                    ),
                  );
                }),
              ),

              SizedBox(height: 16.h),

              Text(
                'Closet Confidence',
                style: TextStyle(
                  fontFamily: 'Abhaya_Libre',
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 6.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'How style can rebuild self-esteem, one outfit\nat a time.',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w300,
                    fontSize: 11.5.sp,
                    color: Colors.white,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // ----------------- ARTICLE CARDS -----------------
        _ArticleCard(
          imagePath: 'assets/images/editorial/article_1.jpg',
          date: '22 JAN 2025',
          title: '7 Days to rediscover Your Wardrobe',
          onTap: controller.openEditorialArticle,
        ),
        _ArticleCard(
          imagePath: 'assets/images/editorial/article_2.jpg',
          date: '22 JAN 2025',
          title: 'The Psychology of Getting Dressed',
          onTap: controller.openEditorialArticle,
        ),

        SizedBox(height: 16.h),

        SizedBox(
          width: double.infinity,
          height: 220.h,
          child: Image.asset(
            'assets/images/editorial/hero_bottom.jpg',
            scale: 4,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(24.w, 18.h, 24.w, 28.h),
          child: Text(
            'Make It Last:\nGarment Care for the Long Run',
            style: TextStyle(
              fontFamily: 'Abhaya_Libre',
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              height: 1.2,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // ARTICLE DETAIL VIEW (like the screenshot)
  // ------------------------------------------------------------
  Widget _buildArticleDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Marquee bar
        SizedBox(
          height: 30.h,
          width: double.infinity,
          child: ClipRect(
            child: Obx(
                  () => Transform.translate(
                offset: Offset(controller.xOffset.value, 0),
                child: Text(
                  controller.marqueeText.value,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    color: AppColors.textIcons,
                    fontSize: 13.3.sp,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 14.h),

        // WTW Magazine header again
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Text(
                'WTW Magazine',
                style: TextStyle(
                  fontFamily: 'Abhaya_Libre',
                  fontWeight: FontWeight.w700,
                  fontSize: 40.sp,
                  color: Color(0xFF1F1F1F),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.h),
              Text(
                'Style insights, wardrobe rituals, and mindful\nfashion reads.',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 13.3.sp,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 18.h),
              Divider(
                color: AppColors.secondaryBg,
                thickness: 1,
              ),
            ],
          ),
        ),

        SizedBox(height: 18.h),

        // Article intro section title
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Text(
                    'Meet the Makers',
                    style: TextStyle(
                      fontFamily: 'Abhaya_Libre',
                      fontWeight: FontWeight.w400,
                      fontSize: 30.sp,
                      color: Color(0xFF1F1F1F),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Find your next favorite brand, chosen with care',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 13.3.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Browse Brands',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w500,
                      fontSize: 13.3.sp,
                      color: AppColors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 18.h),

        // Hero image of article
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            height: 230.h,
            width: double.infinity,
            child: Image.asset(
              'assets/images/editorial/color_stories_header.jpg',
              scale: 4,
              fit: BoxFit.fill,
            ),
          ),
        ),

        SizedBox(height: 18.h),

        // Article body
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We all have colors we instinctively reach for — the jacket that makes you feel sharp, the dress that lights up your skin, or that shirt you wear when you need a confidence boost.',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Finding your signature color palette isn’t about trends or rules. It’s about uncovering the shades that reflect who you are — your energy, your mood, your rhythm.',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 18.h),

              Text(
                'Where to Begin',
                style: TextStyle(
                  fontFamily: 'Abhaya_Libre',
                  fontWeight: FontWeight.w600,
                  fontSize: 26.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Start by opening your digital closet. Look at the pieces you love and wear the most. What colors do they share? Are they soft and muted, deep and rich, bright and joyful? These are clues.',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 18.h),
            ],
          ),
        ),

        // Mid article image + section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            height: 210.h,
            width: double.infinity,
            child: Image.asset(
              'assets/images/editorial/article_1.jpg',
              scale: 4,
              fit: BoxFit.fill,
            ),
          ),
        ),

        SizedBox(height: 18.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Feeling Seen in Color',
                style: TextStyle(
                  fontFamily: 'Abhaya_Libre',
                  fontWeight: FontWeight.w600,
                  fontSize: 26.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'The shades you choose can shift how you show up in the world. A bold red might make you feel powerful; lilac, calm; crisp white, clear. When we wear tones that align with how we want to feel, we dress from the inside out.',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 18.h),

              Text(
                'How the App Helps',
                style: TextStyle(
                  fontFamily: 'Abhaya_Libre',
                  fontWeight: FontWeight.w600,
                  fontSize: 26.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'WatoWear isn’t just here to suggest outfits — it’s here to help you discover your style language. As you tag and log colors across the app, the system starts to learn your preferences.',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),

        // ----------------- YOU MAY BE INTERESTED -----------------
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'You may be interested',
            style: TextStyle(
              fontFamily: 'Abhaya_Libre',
              fontWeight: FontWeight.w600,
              fontSize: 26.sp,
              color: AppColors.black,
            ),
          ),
        ),

        SizedBox(height: 14.h),

        SizedBox(
          height: 215.h,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            scrollDirection: Axis.horizontal,
            children: [
              _InterestedCard(
                imagePath: 'assets/images/editorial/article_1.jpg',
                title: '7 Days to rediscover\nYour Wardrobe',
              ),
              SizedBox(width: 14.w),
              _InterestedCard(
                imagePath: 'assets/images/editorial/article_2.jpg',
                title: 'The Psychology of\nGetting Dressed',
              ),
            ],
          ),
        ),

        SizedBox(height: 10.h),

        // dots under "you may be interested"
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            final active = index == 1;
            return Container(
              width: active ? 6.r : 5.r,
              height: active ? 6.r : 5.r,
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                color: active ? AppColors.textIcons : AppColors.secondaryBg,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),

        SizedBox(height: 24.h),
      ],
    );
  }
}

// ----------------- Helper widgets -----------------

class _ArticleCard extends StatelessWidget {
  final String imagePath;
  final String date;
  final String title;
  final VoidCallback? onTap;

  const _ArticleCard({
    required this.imagePath,
    required this.date,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    date,
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w300,
                      fontSize: 9.sp,
                      color: AppColors.textIcons,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: SizedBox(
                    height: 180.h,
                    child: Image.asset(
                      imagePath,
                      scale: 4,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Abhaya_Libre',
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InterestedCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const _InterestedCard({
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 140.h,
            width: double.infinity,
            child: Image.asset(
              imagePath,
              scale: 4,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Abhaya_Libre',
              fontWeight: FontWeight.w700,
              fontSize: 12.5.sp,
              color: AppColors.black,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
