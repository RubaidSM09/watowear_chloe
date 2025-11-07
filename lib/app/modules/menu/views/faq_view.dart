import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/menu/controllers/faq_controller.dart';
import 'package:watowear_chloe/common/app_colors.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FaqController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'FAQ',
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
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 24.h,
              children: [
                FAQRow(
                  text: 'Getting Started',
                  onTap: () => Get.to(
                    FAQs(topic: 'Getting Started', faqs: controller.faqs),
                  ),
                ),

                FAQRow(
                  text: 'Wardrobe & Closet Management',
                  onTap: () => Get.to(
                    FAQs(topic: 'Wardrobe', faqs: controller.faqs),
                  ),
                ),

                FAQRow(
                  text: 'Outfits & Style Suggestions',
                  onTap: () => Get.to(
                    FAQs(topic: 'Outfits', faqs: controller.faqs),
                  ),
                ),

                FAQRow(
                  text: 'Chloé – Your Style Assistant',
                  onTap: () => Get.to(
                    FAQs(topic: 'Chloé – Your Style Assistant', faqs: controller.faqs),
                  ),
                ),

                FAQRow(
                  text: 'Gamification & Missions',
                  onTap: () => Get.to(
                    FAQs(topic: 'Gamification & Missions', faqs: controller.faqs),
                  ),
                ),

                FAQRow(
                  text: 'Community & Sharing',
                  onTap: () => Get.to(
                    FAQs(topic: 'Community & Sharing', faqs: controller.faqs),
                  ),
                ),

                FAQRow(
                  text: 'Account & Privacy',
                  onTap: () => Get.to(
                    FAQs(topic: 'Account & Privacy', faqs: controller.faqs),
                  ),
                ),

                FAQRow(
                  text: 'Plans & Subscriptions',
                  onTap: () => Get.to(
                    FAQs(topic: 'Plans & Subscriptions', faqs: controller.faqs),
                  ),
                ),

                FAQRow(
                  text: 'Technical Support',
                  onTap: () => Get.to(
                    FAQs(topic: 'Technical Support', faqs: controller.faqs),
                  ),
                ),
                FAQRow(
                  text: 'Legal & Policies',
                  onTap: () => Get.to(
                    FAQs(topic: 'Legal & Policies', faqs: controller.faqs),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FAQRow extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const FAQRow({required this.text, required this.onTap, super.key});

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

          Icon(Icons.arrow_forward_ios, size: 20.r, color: Colors.black),
        ],
      ),
    );
  }
}

class FAQs extends StatelessWidget {
  final String topic;
  final List<Map<String, dynamic>> faqs;

  const FAQs({required this.topic, required this.faqs, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          topic,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                children: faqs.map((faq) {
                  RxBool isAnswerVisible = faq['isAnswerVisible'];
                  if (faq['type'] == topic) {
                    return Column(
                      children: [
                        Column(
                          spacing: 12.h,
                          children: [
                            GestureDetector(
                              onTap: () {
                                isAnswerVisible.value = !isAnswerVisible.value;
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 356.w,
                                    child: Text(
                                      faq['question'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.96.sp,
                                      ),
                                    ),
                                  ),

                                  Icon(
                                    isAnswerVisible.value
                                        ? Icons.keyboard_arrow_up_outlined
                                        : Icons.keyboard_arrow_down_outlined,
                                    size: 20.r,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                            ),

                            if (isAnswerVisible.value)
                              SizedBox(
                                width: 356.w,
                                child: Text(
                                  faq['answer'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.96.sp,
                                  ),
                                ),
                              ),
                          ],
                        ),

                        SizedBox(height: 24.h,),
                      ],
                    );
                  } else {
                    return Column();
                  }
                }).toList(),
              ),
            ),
          );
        }),
      ),
    );
  }
}
