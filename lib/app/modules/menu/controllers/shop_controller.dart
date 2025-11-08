import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ShopController extends GetxController with GetTickerProviderStateMixin {
  RxList<RxBool> selectedTab = [
    true.obs, false.obs, false.obs, false.obs, false.obs, false.obs
  ].obs;

  /// Editorial filter categories
  final List<String> editorialCategories = [
    'Latest',
    'Style & Self',
    'Mindful Fashion & Sustainability',
    'Closet Curation',
    'Inspiration & Stories',
    'How-To & Feature Guides',
    'Trends & Analysis',
  ];

  /// Whether we are showing the main magazine layout (false)
  /// or a specific editorial article (true)
  RxBool showEditorialArticle = false.obs;

  void openEditorialArticle() {
    showEditorialArticle.value = true;
  }

  void closeEditorialArticle() {
    showEditorialArticle.value = false;
  }

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
  final marqueeText =
      "Brands that complement your style. New arrivals daily. Discover fresh pieces curated for you."
          .obs;

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

    containerWidth = Get.width;

    const textStyle = TextStyle(
      fontSize: 14,
      fontFamily: 'Comfortaa',
      fontWeight: FontWeight.w500,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: marqueeText.value,
        style: textStyle,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    textWidth = textPainter.width;

    final totalDistance = containerWidth + textWidth;

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )
      ..addListener(() {
        final t = animationController.value;
        xOffset.value = containerWidth - (t * totalDistance);
      })
      ..repeat();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
