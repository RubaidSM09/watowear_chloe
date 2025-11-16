class Profile {
  int? id;
  String? profileImage;
  String? dateOfBirth;
  String? phoneNumber;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? province;
  String? postalCode;
  String? country;
  String? language;
  String? wardrobeInspiration;
  bool? agreesToCommercialCommunications;
  String? gender;
  int? age;
  double? heightCm;
  double? weightKg;
  bool? enableLocationForClimate;
  double? latitude;
  double? longitude;
  String? bodyType;
  String? skinTone;
  String? eyeColor;
  String? comfortZone;
  List<String>? favoriteColors;
  List<String>? avoidedColors;
  List<String>? muses;
  String? referralCode;
  int? user;

  Profile({
    this.id,
    this.profileImage,
    this.dateOfBirth,
    this.phoneNumber,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.province,
    this.postalCode,
    this.country,
    this.language,
    this.wardrobeInspiration,
    this.agreesToCommercialCommunications,
    this.gender,
    this.age,
    this.heightCm,
    this.weightKg,
    this.enableLocationForClimate,
    this.latitude,
    this.longitude,
    this.bodyType,
    this.skinTone,
    this.eyeColor,
    this.comfortZone,
    this.favoriteColors,
    this.avoidedColors,
    this.muses,
    this.referralCode,
    this.user,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profileImage = json['profile_image'];
    dateOfBirth = json['date_of_birth'];
    phoneNumber = json['phone_number'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    city = json['city'];
    province = json['province'];
    postalCode = json['postal_code'];
    country = json['country'];
    language = json['language'];
    wardrobeInspiration = json['wardrobe_inspiration'];
    agreesToCommercialCommunications =
    json['agrees_to_commercial_communications'];
    gender = json['gender'];
    age = json['age'];

    heightCm = (json['height_cm'] as num?)?.toDouble();
    weightKg = (json['weight_kg'] as num?)?.toDouble();
    enableLocationForClimate = json['enable_location_for_climate'];
    latitude = (json['latitude'] as num?)?.toDouble();
    longitude = (json['longitude'] as num?)?.toDouble();

    bodyType = json['body_type'];
    skinTone = json['skin_tone'];
    eyeColor = json['eye_color'];
    comfortZone = json['comfort_zone'];

    // Safely handle missing or null lists
    favoriteColors = (json['favorite_colors'] as List?)
        ?.map((e) => e.toString())
        .toList() ??
        [];
    avoidedColors = (json['avoided_colors'] as List?)
        ?.map((e) => e.toString())
        .toList() ??
        [];
    muses = (json['muses'] as List?)?.map((e) => e.toString()).toList() ?? [];

    referralCode = json['referral_code'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['profile_image'] = profileImage;
    data['date_of_birth'] = dateOfBirth;
    data['phone_number'] = phoneNumber;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['city'] = city;
    data['province'] = province;
    data['postal_code'] = postalCode;
    data['country'] = country;
    data['language'] = language;
    data['wardrobe_inspiration'] = wardrobeInspiration;
    data['agrees_to_commercial_communications'] =
        agreesToCommercialCommunications;
    data['gender'] = gender;
    data['age'] = age;
    data['height_cm'] = heightCm;
    data['weight_kg'] = weightKg;
    data['enable_location_for_climate'] = enableLocationForClimate;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['body_type'] = bodyType;
    data['skin_tone'] = skinTone;
    data['eye_color'] = eyeColor;
    data['comfort_zone'] = comfortZone;
    data['favorite_colors'] = favoriteColors;
    data['avoided_colors'] = avoidedColors;
    data['muses'] = muses;
    data['referral_code'] = referralCode;
    data['user'] = user;
    return data;
  }
}
