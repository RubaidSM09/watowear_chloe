class LibraryItem {
  final int id;
  final String imageUrl;
  final String? description;
  final String? weather;
  final String? season;
  final String? itemType;
  final String? category;
  final String? subcategory;
  final String? colour;
  final String? silhouette;
  final String? material;
  final String? pattern;
  final String? style;
  final String? formality;
  final String? layer;
  final String? gender;
  final List<String> tags;
  final List<String> occasionTags;
  final List<String> moodTags;
  final List<String> rotationTags;
  final List<String> bodyFocusTags;

  LibraryItem({
    required this.id,
    required this.imageUrl,
    this.description,
    this.weather,
    this.season,
    this.itemType,
    this.category,
    this.subcategory,
    this.colour,
    this.silhouette,
    this.material,
    this.pattern,
    this.style,
    this.formality,
    this.layer,
    this.gender,
    required this.tags,
    required this.occasionTags,
    required this.moodTags,
    required this.rotationTags,
    required this.bodyFocusTags,
  });

  factory LibraryItem.fromJson(Map<String, dynamic> json) {
    return LibraryItem(
      id: json['id'] ?? 0,
      imageUrl: json['image_url'] ?? '',
      description: json['description'],
      weather: json['weather'],
      season: json['season'],
      itemType: json['item_type'],
      category: json['category'],
      subcategory: json['subcategory'],
      colour: json['colour'],
      silhouette: json['silhouette'],
      material: json['material'],
      pattern: json['pattern'],
      style: json['style'],
      formality: json['formality'],
      layer: json['layer'],
      gender: json['gender'],
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      occasionTags: (json['occasion_tags'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      moodTags: (json['mood_tags'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      rotationTags: (json['rotation_tags'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      bodyFocusTags: (json['body_focus_tags'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
    );
  }
}
