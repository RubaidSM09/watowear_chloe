class MyProgress {
  Summary? summary;
  String? currentBadge;
  int? progressPercentage;
  String? nextBadgeToUnlock;
  List<BadgeLevels>? badgeLevels;

  MyProgress(
      {this.summary,
        this.currentBadge,
        this.progressPercentage,
        this.nextBadgeToUnlock,
        this.badgeLevels});

  MyProgress.fromJson(Map<String, dynamic> json) {
    summary =
    json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    currentBadge = json['current_badge'];
    progressPercentage = json['progress_percentage'];
    nextBadgeToUnlock = json['next_badge_to_unlock'];
    if (json['badge_levels'] != null) {
      badgeLevels = <BadgeLevels>[];
      json['badge_levels'].forEach((v) {
        badgeLevels!.add(new BadgeLevels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    data['current_badge'] = this.currentBadge;
    data['progress_percentage'] = this.progressPercentage;
    data['next_badge_to_unlock'] = this.nextBadgeToUnlock;
    if (this.badgeLevels != null) {
      data['badge_levels'] = this.badgeLevels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  int? itemCount;
  int? outfitFeedbackCount;
  int? inviteCount;

  Summary({this.itemCount, this.outfitFeedbackCount, this.inviteCount});

  Summary.fromJson(Map<String, dynamic> json) {
    itemCount = json['item_count'];
    outfitFeedbackCount = json['outfit_feedback_count'];
    inviteCount = json['invite_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_count'] = this.itemCount;
    data['outfit_feedback_count'] = this.outfitFeedbackCount;
    data['invite_count'] = this.inviteCount;
    return data;
  }
}

class BadgeLevels {
  String? name;
  String? level;

  BadgeLevels({this.name, this.level});

  BadgeLevels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['level'] = this.level;
    return data;
  }
}
