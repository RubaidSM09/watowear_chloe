import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:watowear_chloe/app/data/services/api_services.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class EditorialSubSection {
  final int id;
  final String title;
  final String? subline;
  final String? imageUrl;
  final String description;
  final int order;

  EditorialSubSection({
    required this.id,
    required this.title,
    required this.subline,
    required this.imageUrl,
    required this.description,
    required this.order,
  });

  factory EditorialSubSection.fromJson(
      Map<String, dynamic> json,
      String baseUrl,
      ) {
    final String? imagePath = json['image'] as String?;
    String? fullImage;
    if (imagePath != null && imagePath.isNotEmpty) {
      fullImage = '$baseUrl$imagePath';
    }

    return EditorialSubSection(
      id: json['id'] ?? 0,
      title: (json['title'] ?? '').toString(),
      subline: json['subline'],
      imageUrl: fullImage,
      description: (json['description'] ?? '').toString(),
      order: json['order'] ?? 0,
    );
  }
}

class EditorialArticle {
  final int id;
  final String title;
  final String? subline;
  final String? imageUrl;
  final String description;
  final String? category;
  final DateTime? publishedAt;
  final List<String> tags;
  final List<EditorialSubSection> subSections;

  EditorialArticle({
    required this.id,
    required this.title,
    required this.subline,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.publishedAt,
    required this.tags,
    required this.subSections,
  });

  factory EditorialArticle.fromListJson(
      Map<String, dynamic> json,
      String baseUrl,
      ) {
    final String? imagePath = json['image'] as String?;
    String? fullImage;
    if (imagePath != null && imagePath.isNotEmpty) {
      fullImage = '$baseUrl$imagePath';
    }

    return EditorialArticle(
      id: json['id'] ?? 0,
      title: (json['title'] ?? '').toString(),
      subline: json['subline'],
      imageUrl: fullImage,
      description: (json['description'] ?? '').toString(),
      category: json['category'],
      publishedAt: json['published_at'] != null
          ? DateTime.tryParse(json['published_at'])
          : null,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      subSections: const [],
    );
  }

  factory EditorialArticle.fromDetailJson(
      Map<String, dynamic> json,
      String baseUrl,
      ) {
    final String? imagePath = json['image'] as String?;
    String? fullImage;
    if (imagePath != null && imagePath.isNotEmpty) {
      fullImage = '$baseUrl$imagePath';
    }

    final List<dynamic> rawSubSections = json['sub_sections'] ?? [];
    final sections = rawSubSections
        .map((e) =>
        EditorialSubSection.fromJson(e as Map<String, dynamic>, baseUrl))
        .toList();

    sections.sort((a, b) {
      final cmp = a.order.compareTo(b.order);
      if (cmp != 0) return cmp;
      return a.id.compareTo(b.id);
    });

    return EditorialArticle(
      id: json['id'] ?? 0,
      title: (json['title'] ?? '').toString(),
      subline: json['subline'],
      imageUrl: fullImage,
      description: (json['description'] ?? '').toString(),
      category: json['category'],
      publishedAt: json['published_at'] != null
          ? DateTime.tryParse(json['published_at'])
          : null,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      subSections: sections,
    );
  }
}

class ShopController extends GetxController with GetTickerProviderStateMixin {
  final currentStep = 0.obs;
  final Rxn<VideoPlayerController> player = Rxn<VideoPlayerController>();

  // --- API service for editorial ---
  final ApiService _apiService = ApiService();

  // --- Editorial state ---
  final RxList<EditorialArticle> editorialArticles = <EditorialArticle>[].obs;
  final Rxn<EditorialArticle> selectedArticle = Rxn<EditorialArticle>();

  final RxBool isLoadingEditorialList = false.obs;
  final RxBool isLoadingEditorialDetail = false.obs;

  final List<String> _videos = const [
    'assets/videos/video1.mp4', // Step 1 : Choose a category
  ];

  Future<void> _loadStep(int index) async {
    // Dispose previous controller safely
    final old = player.value;
    if (old != null) {
      old.removeListener(_onTick);
      await old.pause();
      await old.dispose();
    }

    final c = VideoPlayerController.asset(_videos[index]);
    player.value = c; // set early so UI can show skeleton while initializing

    await c.initialize();
    c.setLooping(false);
    c.addListener(_onTick);
    await c.play();

    // Nudge listeners (Obx) to rebuild
    player.refresh();
    currentStep.refresh();
  }

  void _onTick() {
    final p = player.value;
    if (p == null) return;
    final v = p.value;
    if (v.isInitialized && !v.isPlaying && v.position >= v.duration) {
      nextStep();
    }
  }

  Future<void> nextStep() async {
    if (currentStep.value < _videos.length - 1) {
      currentStep.value++;
      await _loadStep(currentStep.value);
    } else {
      // Finished all steps; optionally navigate or loop
      // await restart(); // if you want to loop
    }
  }

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

    // 👉 Fetch editorial list on load
    fetchEditorialArticles();
  }

  Future<void> fetchEditorialArticles() async {
    try {
      isLoadingEditorialList.value = true;
      final http.Response response = await _apiService.getEditorialArticles();
      if (response.statusCode == 200) {
        final Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic> results = data['results'] ?? [];

        final List<EditorialArticle> list = results
            .map(
              (e) => EditorialArticle.fromListJson(
            e as Map<String, dynamic>,
            _apiService.baseUrl,
          ),
        )
            .toList();

        editorialArticles.assignAll(list);
      } else {
        // handle error as needed
      }
    } catch (_) {
      // handle error/log
    } finally {
      isLoadingEditorialList.value = false;
    }
  }

  Future<void> fetchEditorialDetail(int articleId) async {
    try {
      isLoadingEditorialDetail.value = true;
      final http.Response response =
      await _apiService.getEditorialArticleDetail(articleId);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

        final article =
        EditorialArticle.fromDetailJson(data, _apiService.baseUrl);
        selectedArticle.value = article;
      } else {
        // handle error
      }
    } catch (_) {
      // handle error/log
    } finally {
      isLoadingEditorialDetail.value = false;
    }
  }

  Future<void> openEditorialArticle(int articleId) async {
    await fetchEditorialDetail(articleId);
    showEditorialArticle.value = true;
  }

  void closeEditorialArticle() {
    showEditorialArticle.value = false;
    selectedArticle.value = null;
  }

  String formatEditorialDate(DateTime? date) {
    if (date == null) return '';
    const months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC',
    ];
    final d = date.day.toString().padLeft(2, '0');
    final m = months[date.month - 1];
    final y = date.year.toString();
    return '$d $m $y';
  }

  String formatEditorialCategory(String? raw) {
    if (raw == null || raw.isEmpty) return '';
    final cleaned = raw.replaceAll('_', ' ').replaceAll('&', '&');
    final words = cleaned.split(' ');
    final capitalized = words
        .map((w) =>
    w.isEmpty ? '' : '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}')
        .join(' ');
    return capitalized;
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
