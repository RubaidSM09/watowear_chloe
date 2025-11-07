import 'package:get/get.dart';

class FaqController extends GetxController {
  final List<Map<String, dynamic>> faqs = [
    // ✅ Getting Started
    {
      'type': 'Getting Started',
      'question': 'How do I create an account?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Getting Started',
      'question': 'How do I upload items to my wardrobe?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Getting Started',
      'question': 'Can I import photos directly from my phone?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },

    // ✅ Wardrobe
    {
      'type': 'Wardrobe',
      'question': 'How do I organize my wardrobe in the app?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Wardrobe',
      'question': 'Can I tag clothes by season, color, or style?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Wardrobe',
      'question': 'How do I edit or delete an item?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Wardrobe',
      'question': 'Can I export or back up my wardrobe?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },

    // ✅ Outfits
    {
      'type': 'Outfits',
      'question': 'How does the AI create outfit suggestions?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Outfits',
      'question': 'Can I save or favorite an outfit?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Outfits',
      'question': 'How do I give feedback on an outfit?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Outfits',
      'question': 'Can I request outfits for a specific occasion?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },

    // ✅ Chloé – Your Style Assistant
    {
      'type': 'Chloé – Your Style Assistant',
      'question': 'What can Chloé help me with?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Chloé – Your Style Assistant',
      'question': 'How do I chat with Chloé?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Chloé – Your Style Assistant',
      'question': 'Can Chloé adapt to my personal style over time?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Chloé – Your Style Assistant',
      'question': 'Is Chloé available in different languages?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },

    // ✅ Gamification & Missions
    {
      'type': 'Gamification & Missions',
      'question': 'What are style missions?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Gamification & Missions',
      'question': 'How do I earn badges and tiers?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Gamification & Missions',
      'question': 'What rewards do I unlock as I progress?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Gamification & Missions',
      'question': 'How do invites and referrals work?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },

    // ✅ Community & Sharing
    {
      'type': 'Community & Sharing',
      'question': 'Can I share my outfits with other users?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Community & Sharing',
      'question': 'How do I interact with the community?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Community & Sharing',
      'question': 'Can I be featured in WATOWEAR content?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Community & Sharing',
      'question': 'How do I report inappropriate content?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },

    // ✅ Account & Privacy
    {
      'type': 'Account & Privacy',
      'question': 'How do I reset my password?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Account & Privacy',
      'question': 'How do I update my profile information?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Account & Privacy',
      'question': 'How is my wardrobe data stored?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Account & Privacy',
      'question': 'Can other users see my wardrobe?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Account & Privacy',
      'question': 'How do I delete my account?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },

    // ✅ Plans & Subscriptions
    {
      'type': 'Plans & Subscriptions',
      'question': 'What’s included in the free version?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Plans & Subscriptions',
      'question': 'What’s included in Premium?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Plans & Subscriptions',
      'question': 'How do I upgrade or downgrade my plan?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Plans & Subscriptions',
      'question': 'What happens if my payment fails?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },

    // ✅ Technical Support
    {
      'type': 'Technical Support',
      'question': 'The app won’t load, what should I do?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Technical Support',
      'question': 'I can’t upload pictures, how do I fix this?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Technical Support',
      'question': 'How do I report a bug?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Technical Support',
      'question': 'Which devices are supported?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },

    // ✅ Legal & Policies
    {
      'type': 'Legal & Policies',
      'question': 'Where can I find the Terms & Conditions?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Legal & Policies',
      'question': 'Where can I read the Privacy Policy?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
    {
      'type': 'Legal & Policies',
      'question': 'What are the Legal Mentions?',
      'answer': '',
      'isAnswerVisible': false.obs,
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
