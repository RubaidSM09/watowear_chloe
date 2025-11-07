import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RewardsController extends GetxController {
  final rewards = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();

    rewards.addAll([
      {
        'title': 'Bronze – Refiner',
        'subtitle': 'Upload 25 items . 10 Outfit feedback. 3 Invites. 2 Missions',
        'color': const Color(0xFFFDF3E5),
        'tasks': [
          'Upload items across 3 categories (tops, bottoms, shoes).',
          'Complete your profile setup (fill in all profile fields and preferences).',
        ],
        'rewards': [
          'Bronze Refiner Badge on your profile.',
          'Unlock new style Recommendations.',
          'Early access to new features.',
          '10% off on partner brands.',
        ],
        'isExpanded': false.obs,
      },
      {
        'title': 'Silver – Curator',
        'subtitle': 'Upload 50 items . 20 Outfit feedback. 6 Invites. 4 Missions',
        'color': const Color(0xFFF4F4F6),
        'tasks': [
          'Upload 50 items across 3 categories (tops, bottoms, shoes).',
          'Give feedback on 20 outfits.',
          'Send 6 invites to friends.',
          'Complete 4 style missions.',
        ],
        'rewards': [
          'Silver Curator Badge on your profile.',
          'Unlock new style Recommendations.',
          'Early access to new features.',
          '20% off on partner brands.',
        ],
        'isExpanded': false.obs,
      },
      {
        'title': 'Gold – Connaisseur',
        'subtitle': 'Upload 120 items . 50 Outfit feedback. 15 Invites. 10 Missions',
        'color': const Color(0xFFFBD6B4),
        'tasks': [
          'Complete a “Capsule Wardrobe” mission (build 10 versatile outfits with 20 pieces).',
          'Style with prints or bold combinations (e.g., mix two patterns).',
          'Complete one “Color Challenge” (use one color you rarely wear for one week).',
          'Curate 3 “signature looks” that define your style identity.',
          'Experiment with a new silhouette or cut outside your usual comfort zone.',
          'Submit 1 feature idea or style feedback directly to the WATOWEAR team.',
          'Share 3 outfits, for 3 successive days, to your profile highlights.',
          'Use the app for twenty consecutive days.',
          'Participate in two small community events.',
          'Contribute to a featured article or a user-generated style guide.',
        ],
        'rewards': [
          'Gold – Connaisseur Badge on your profile.',
          'Unlock new style Recommendations.',
          'Early access to new features.',
          '40% off on partner brands.',
        ],
        'isExpanded': false.obs,
      },
      {
        'title': 'Platinum – Couture Insider',
        'subtitle': 'Upload 200 items . 100 Outfit feedback. 20 Invites. 20 Missions',
        'color': const Color(0xFFBF7A4E),
        'tasks': [
          'Maintain a 30-day style streak (use WATOWEAR daily for a month).',
          'Complete a full seasonal rotation (upload + tag new season items).',
          'Create a “work capsule”.',
          'Host or contribute to a community style challenge (e.g., “Monochrome Week”).',
          'Share a public capsule that inspires others (e.g., “10 outfits for autumn”).',
          'Mentor or help 3 new users (comment on their outfits, answer questions).',
          'Vote or participate in community polls to shape WATOWEAR features.',
          'Collaborate in testing a new feature and submit structured feedback.',
          'Contribute to a community style guide (tips, do’s & don’ts, favorite combos).',
          'Color Diary – Wear and log outfits in 5 different colors over a week.',
          'Minimalist Week – Create 7 daily outfits using only 10 wardrobe pieces.',
          'Closet Detox Pro – Archive or remove 15 unworn items in one month.',
          'Texture Play – Style 3 outfits mixing fabrics (silk + wool, cotton + leather).',
          'Signature Piece – Build 5 outfits around a single “statement” item.',
          'Before/After – Upload a picture of a “forgotten” item and restyle it into a new look.',
          'Style Streak 100 – Log in and engage for 100 consecutive days.',
          'Style Swap – Collaborate with another user: exchange outfit challenges.',
          'Trend Translator – Take one current trend and reinterpret it in your own style.',
          'Community Stylist – Comment constructively on 10 other users’ outfits in a week.',
        ],
        'rewards': [
          'Platinum – Couture Insider Badge on your profile.',
          'Unlock new style Recommendations.',
          'Early access to new features.',
          '50% off on partner brands.',
        ],
        'isExpanded': false.obs,
      },
    ]);
  }

  void toggleExpansion(int index) {
    final rx = rewards[index]['isExpanded'] as RxBool;
    rx.toggle();
  }
}
