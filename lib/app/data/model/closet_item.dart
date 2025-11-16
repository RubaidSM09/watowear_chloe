class ClosetItem {
  int? id;
  String? imageUrl;
  bool? isFavorite;
  String? lastViewedAt;
  String? description;
  String? weather;
  String? season;
  String? category;
  String? subcategory;
  String? colour;
  String? silhouette;
  String? material;
  String? pattern;
  String? style;
  String? formality;
  String? layer;
  String? gender;
  List<String>? tags;
  dynamic sourceLibraryItem;

  ClosetItem({
    this.id,
    this.imageUrl,
    this.isFavorite,
    this.lastViewedAt,
    this.description,
    this.weather,
    this.season,
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
    this.tags,
    this.sourceLibraryItem,
  });

  ClosetItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    isFavorite = json['is_favorite'];
    lastViewedAt = json['last_viewed_at'];
    description = json['description'];
    weather = json['weather'];
    season = json['season'];
    category = json['category'];
    subcategory = json['subcategory'];
    colour = json['colour'];
    silhouette = json['silhouette'];
    material = json['material'];
    pattern = json['pattern'];
    style = json['style'];
    formality = json['formality'];
    layer = json['layer'];
    gender = json['gender'];
    tags = (json['tags'] as List?)?.map((e) => e.toString()).toList() ?? [];
    sourceLibraryItem = json['source_library_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['is_favorite'] = isFavorite;
    data['last_viewed_at'] = lastViewedAt;
    data['description'] = description;
    data['weather'] = weather;
    data['season'] = season;
    data['category'] = category;
    data['subcategory'] = subcategory;
    data['colour'] = colour;
    data['silhouette'] = silhouette;
    data['material'] = material;
    data['pattern'] = pattern;
    data['style'] = style;
    data['formality'] = formality;
    data['layer'] = layer;
    data['gender'] = gender;
    data['tags'] = tags;
    data['source_library_item'] = sourceLibraryItem;
    return data;
  }
}
