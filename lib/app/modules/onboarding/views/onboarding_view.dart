import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:watowear_chloe/common/app_colors.dart';
import '../../../../common/custom_button.dart';
import '../controllers/onboarding_controller.dart';
import 'onboarding1_view.dart';
import 'onboarding2_view.dart';
import 'onboarding3_view.dart';
import 'onboarding4_view.dart';
import 'onboarding5_view.dart';
import 'onboarding6_view.dart';

const kGreen = Color(0xFF676C53);
const kOrange = Color(0xFFD56C2B);
const kBeige = Color(0xFFF3EEE5);
const kDark = Color(0xFF2F2F2F);

TextStyle get titleStyle => const TextStyle(
  fontSize: 32,
  height: 1.15,
  fontWeight: FontWeight.w700,
  color: kDark,
  letterSpacing: .3,
);

TextStyle get bodyStyle =>
    const TextStyle(fontSize: 15, height: 1.5, color: Color(0xFF5E5E5E));

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());

    final safe = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              children: const [
                Onboarding1View(), // 1
                Onboarding2View(), // 2
                Onboarding3View(), // 3
                Onboarding4View(), // 4
                Onboarding5View(), // 5
                // Onboarding6View(), // 6
              ],
            ),

            // Top bar (lang + skip) — white for hero, beige for others
            Obx(() {
              final idx = controller.current.value;
              final topColor = idx == 0 ? Colors.white : Colors.black87;
              return Positioned(
                left: 25.w,
                top: 28.53.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isLanguageClicked.value = !controller.isLanguageClicked.value;
                        }, // TODO: open language picker
                        child: Row(
                          children: [
                            if (idx == 0)
                              SvgPicture.asset(
                                controller.selectedLanguage[0].value ? 'assets/images/onboarding/UK United Kingdom flag.svg' : 'assets/images/onboarding/FR France flag.svg',
                                width: 20.w,
                                height: 20.h,
                              ),
                            if (idx == 0) SizedBox(width: 9.w),
                            if (idx == 0)
                              Text(
                                controller.selectedLanguage[0].value ? 'EN' : 'FR',
                                style: TextStyle(
                                  color: topColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Comfortaa',
                                ),
                              ),
                            if (idx == 0) SizedBox(width: 5.w),
                            if (idx == 0)
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: topColor,
                                size: 24.r,
                              )
                          ],
                        ),
                      ),

                      if (controller.isLanguageClicked.value && idx==0) SizedBox(height: 8.4.h),

                      if (controller.isLanguageClicked.value && idx==0)
                        Container(
                          width: 364.w,
                          padding: EdgeInsets.symmetric(vertical: 22.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 11.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Select Language',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Comfortaa',
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: () {
                                        controller.isLanguageClicked.value = !controller.isLanguageClicked.value;
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10.r),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withAlpha(64),
                                                blurRadius: 4.r,
                                                offset: Offset(0.w, 1.h),
                                              ),
                                            ]
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          color: Color(0xFF141B34),
                                          size: 18.r,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              SizedBox(height: 34.h,),

                              Column(
                                spacing: 4.h,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.selectedLanguage.value = [true.obs, false.obs];
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 21.h),
                                      decoration: BoxDecoration(
                                        color: controller.selectedLanguage[0].value ? Color(0xFFF4F1EB) : Colors.white,
                                      ),
                                      child: Row(
                                        spacing: 5.w,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/onboarding/UK United Kingdom flag.svg',
                                            width: 28.w,
                                            height: 28.h,
                                          ),

                                          Text(
                                            'English',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Comfortaa',
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      controller.selectedLanguage.value = [false.obs, true.obs];
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 21.h),
                                      decoration: BoxDecoration(
                                        color: controller.selectedLanguage[1].value ? Color(0xFFF4F1EB) : Colors.white,
                                      ),
                                      child: Row(
                                        spacing: 5.w,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/onboarding/FR France flag.svg',
                                            width: 28.w,
                                            height: 28.h,
                                          ),

                                          Text(
                                            'French',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Comfortaa',
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              );
            }),

            Obx(() {
              final idx = controller.current.value;
              final topColor = idx == 0 ? Colors.white : Colors.black87;
              return idx != 4 ? Positioned(
                left: 370.21.w,
                top: 20.445.h,
                child: TextButton(
                  onPressed: controller.skip,
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: topColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ),
              ) : SizedBox.shrink();
            }),

            // Bottom: indicator + primary action
            Obx(() {
              final idx = controller.current.value;
              if (idx == 0) {
                return Positioned(
                  left: 192.w,
                  top: 784.6.h,
                  child: AnimatedSmoothIndicator(
                    activeIndex: idx,
                    count: 5,
                    effect: WormEffect(
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                      spacing: 8.w,
                      activeDotColor: kGreen,
                      dotColor: Color(0xFFD9D4C9),
                    ),
                  ),
                );
              }
              if (idx == 1 || idx == 2 || idx == 3) {
                return Stack(
                  children: [
                    Positioned(
                      left: 49.w,
                      top: 836.6.h,
                      child: AnimatedSmoothIndicator(
                        activeIndex: idx,
                        count: 5,
                        effect: WormEffect(
                          dotHeight: 8.h,
                          dotWidth: 8.w,
                          spacing: 8.w,
                          activeDotColor: kGreen,
                          dotColor: Color(0xFFD9D4C9),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 368.w,
                      top: 823.76.h,
                      child: GestureDetector(
                        onTap: controller.next,
                        child: Image.asset(
                          'assets/images/onboarding/next.png',
                          width: 34.w,
                          height: 34.h,
                        ),
                      ),
                    ),
                  ],
                );
              }

              else {
                return SizedBox.shrink();
              }
            }),

            Obx(() {
              final idx = controller.current.value;
              if (idx == 0) {
                return Positioned(
                  left: 40.w,
                  right: 40.w,
                  top: 820.6.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                        text: "Let's Get Started",
                        onTap: controller.next,
                        color: AppColors.primary,
                        textColor: AppColors.bgColor,
                        padding: EdgeInsets.symmetric(horizontal: 96.w, vertical: 12.h,),
                      ),
                    ],
                  ),
                );
              } else if (idx == 5) {
                return Positioned(
                  left: 40.w,
                  top: 697.6.h,
                  child: Column(
                    children: [
                      CustomButton(
                        text: 'Sign Up',
                        onTap: controller.openSignUp,
                      ),
                      SizedBox(height: 16.h),
                      CustomButton(
                        text: 'Sign In',
                        onTap: controller.openSignIn,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Continue as a guest',
                        style: TextStyle(
                          color: AppColors.textIcons,
                          fontFamily: 'Comfortaa',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              } // final page has three separate buttons
              else if(idx == 4) {
                return Positioned(
                  left: 106.w,
                  right: 106.w,
                  top: 919.5.h,
                  child: Text(
                    'Continue as a guest',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.bgColor,
                      fontFamily: 'Comfortaa',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }
              else {
                return SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}

/* -------------------- PAGES -------------------- */

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 22,
            spreadRadius: -4,
            offset: Offset(0, 10),
            color: Color(0x33000000),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _PageChat extends StatelessWidget {
  const _PageChat();
  @override
  Widget build(BuildContext context) {
    return _BeigeScaffold(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const _Card(
            child: Image(image: AssetImage('assets/onb_chat.png'), height: 210),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Get Personalized\nOutfit Suggestions',
              textAlign: TextAlign.center,
              style: titleStyle,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'AI-powered styling just for you.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kOrange,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Based on your mood, occasion, and personal style preferences.',
              textAlign: TextAlign.center,
              style: bodyStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class _PageChloe extends StatelessWidget {
  const _PageChloe();
  @override
  Widget build(BuildContext context) {
    return _BeigeScaffold(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const CircleAvatar(
            radius: 64,
            backgroundImage: AssetImage('assets/onb_chloe.png'),
          ),
          const SizedBox(height: 28),
          Text('Meet Chloé', style: titleStyle, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          const Text(
            'Your personal style coach',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kOrange,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Meet Chloé, your personal stylist and style BFF. She learns what you love and helps you wear it in new ways.',
              textAlign: TextAlign.center,
              style: bodyStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class _PageStart extends StatelessWidget {
  const _PageStart();
  @override
  Widget build(BuildContext context) {
    return _BeigeScaffold(
      child: Column(
        children: [
          const SizedBox(height: 36),
          const _Card(
            child: Image(
              image: AssetImage('assets/onb_started.png'),
              height: 220,
            ),
          ),
          const SizedBox(height: 28),
          Text(
            "Let's Get Started",
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Create your account and start building your smart wardrobe today. Your style journey begins now.',
              textAlign: TextAlign.center,
              style: bodyStyle,
            ),
          ),
          // CTA button is handled globally at the bottom (Get Started)
        ],
      ),
    );
  }
}

class _PageAuth extends GetView<OnboardingController> {
  const _PageAuth();
  @override
  Widget build(BuildContext context) {
    return _BeigeScaffold(
      child: Column(
        children: [
          const SizedBox(height: 36),
          const _Card(
            child: Image(
              image: AssetImage('assets/onb_wardrobe.png'),
              height: 220,
            ),
          ),
          const SizedBox(height: 28),
          Text('Make It Yours', style: titleStyle, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Unlock all the amazing outfit ideas in your wardrobe by signing up.',
              textAlign: TextAlign.center,
              style: bodyStyle,
            ),
          ),
          const SizedBox(height: 28),
          _PrimaryButton(
            text: 'Sign Up',
            onTap: Get.find<OnboardingController>().openSignUp,
          ),
          const SizedBox(height: 12),
          _SecondaryButton(
            text: 'Sign In',
            onTap: Get.find<OnboardingController>().openSignIn,
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: Get.find<OnboardingController>().skip,
            child: const Text(
              'Continue as a guest',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: kDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* -------------------- BUILDING BLOCKS -------------------- */

class _BeigeScaffold extends StatelessWidget {
  final Widget child;
  const _BeigeScaffold({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBeige,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        bottom: false,
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _PrimaryButton({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kGreen,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _SecondaryButton({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: kDark, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          foregroundColor: kDark,
        ),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}

/* ------------ tiny helper ---------- */
extension _Opacity on Widget {
  Widget withOpacity(double o) => Opacity(opacity: o, child: this);
}
