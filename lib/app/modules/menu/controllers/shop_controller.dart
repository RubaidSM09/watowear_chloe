import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ShopController extends GetxController with GetTickerProviderStateMixin {
  RxList<RxBool> selectedTab = [
    true.obs, false.obs, false.obs, false.obs, false.obs, false.obs
  ].obs;

  final List<String> editorialCategories = [
    'Latest',
    'Style & Self',
    'Mindful Fashion & Sustainability',
    'Closet Curation',
    'Inspiration & Stories',
    'How-To & Feature Guides',
    'Trends & Analysis',
  ];

  final Map<String, List<Map<String, dynamic>>> brands = {
    'A': [
      {'country': 'Afghanistan', 'isSaved': false},
      {'country': 'Albania', 'isSaved': false},
      {'country': 'Algeria', 'isSaved': false},
      {'country': 'Andorra', 'isSaved': false},
      {'country': 'Angola', 'isSaved': false},
      {'country': 'Antigua and Barbuda', 'isSaved': false},
      {'country': 'Argentina', 'isSaved': false},
      {'country': 'Armenia', 'isSaved': false},
      {'country': 'Australia', 'isSaved': false},
      {'country': 'Austria', 'isSaved': false},
      {'country': 'Azerbaijan', 'isSaved': false},
    ],
    'B': [
      {'country': 'Bahamas', 'isSaved': false},
      {'country': 'Bahrain', 'isSaved': false},
      {'country': 'Bangladesh', 'isSaved': false},
      {'country': 'Barbados', 'isSaved': false},
      {'country': 'Belarus', 'isSaved': false},
      {'country': 'Belgium', 'isSaved': false},
      {'country': 'Belize', 'isSaved': false},
      {'country': 'Benin', 'isSaved': false},
      {'country': 'Bhutan', 'isSaved': false},
      {'country': 'Bolivia', 'isSaved': false},
      {'country': 'Bosnia and Herzegovina', 'isSaved': false},
      {'country': 'Botswana', 'isSaved': false},
      {'country': 'Brazil', 'isSaved': false},
    ],
    'C': [
      {'country': 'Afghanistan', 'isSaved': false},
      {'country': 'Albania', 'isSaved': false},
      {'country': 'Algeria', 'isSaved': false},
      {'country': 'Andorra', 'isSaved': false},
      {'country': 'Angola', 'isSaved': false},
      {'country': 'Antigua and Barbuda', 'isSaved': false},
      {'country': 'Argentina', 'isSaved': false},
      {'country': 'Armenia', 'isSaved': false},
      {'country': 'Australia', 'isSaved': false},
      {'country': 'Austria', 'isSaved': false},
      {'country': 'Azerbaijan', 'isSaved': false},
    ],
    'D': [
      {'country': 'Bahamas', 'isSaved': false},
      {'country': 'Bahrain', 'isSaved': false},
      {'country': 'Bangladesh', 'isSaved': false},
      {'country': 'Barbados', 'isSaved': false},
      {'country': 'Belarus', 'isSaved': false},
      {'country': 'Belgium', 'isSaved': false},
      {'country': 'Belize', 'isSaved': false},
      {'country': 'Benin', 'isSaved': false},
    ],
  };

  final List<String> clothings = [
    'All clothing',
    'Coats and Jackets',
    'Sweatshirts and Hoodies',
    'Blazers and Suits',
    'Dresses',
    'Skirts',
    'Tops and T-shirts',
    'Jeans',
    'Pants and Leggings',
    'Shorts',
    'Jumpsuits and Rompers',
    'Swimwear',
    'Lingerie and Pyjamas',
    'Activewear',
    'Other Clothing',
  ];

  final List<String> shoes = [
    'All shoes',
    'Ballet Flats',
    'Boots',
    'Espadrilles',
    'Heels',
    'Loafers and Boat Shoes',
    'Lace-up Shoes',
    'Mary Janes',
    'Mules and Clogs',
    'Slides and Flip-flops',
    'Sandals',
    'Slippers',
    'Sneakers',
    'Sports Shoes',
  ];

  final List<String> bags = [
    'All bags',
    'Bucket Bags',
    'Belt Bags',
    'Clutches',
    'Crossbody Bags',
    'Garment Bags',
    'Gym Bags',
    'Handbags',
    'Shoulder Bags',
    'Tote Bags',
    'Mini Bags',
  ];

  final List<String> accessories = [
    'All accessories',
    'Hair Scarves and Bandanas',
    'Belts',
    'Gloves',
    'Hair Accessories',
    'Pocket Squares',
    'Hats and Caps',
    'Jewelry',
    'Scarves and Shawls',
    'Sunglasses',
    'Watches',
    'Other Accessories',
  ];


  // Marquee text
  final marqueeText = "Brands that complement your style. New arrivals daily. Discover fresh pieces curated for you.".obs;

  late AnimationController animationController;
  RxDouble xOffset = 0.0.obs;

  late double textWidth;
  late double containerWidth;

  void selectTab(int index) {
    for (int i = 0; i < selectedTab.length; i++) {
      selectedTab[i].value = i == index;
    }
  }

  @override
  void onInit() {
    super.onInit();

    // Width of the viewport (your SizedBox width)
    containerWidth = Get.width;

    // Match your text style as close as possible
    const textStyle = TextStyle(
      fontSize: 14, // close to 13.3.sp
      fontFamily: 'Comfortaa',
      fontWeight: FontWeight.w500,
    );

    // Measure text width
    final textPainter = TextPainter(
      text: TextSpan(
        text: marqueeText.value,
        style: textStyle,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    textWidth = textPainter.width;

    final totalDistance = containerWidth + textWidth; // full travel distance

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20), // adjust speed here
    )
      ..addListener(() {
        final t = animationController.value; // 0 → 1

        // 👇 Right → Left:
        // start: x = containerWidth       (off right)
        // end:   x = -textWidth           (off left)
        xOffset.value = containerWidth - (t * totalDistance);
      })
      ..repeat(); // loop forever
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
