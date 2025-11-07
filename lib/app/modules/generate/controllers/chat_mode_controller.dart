import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({
    required this.text,
    required this.isUser,
  });
}


class ChatModeController extends GetxController {
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final TextEditingController inputController = TextEditingController();
  final RxBool isTyping = false.obs;

  final count = 0.obs;

  void sendMessage() {
    final text = inputController.text.trim();
    if (text.isEmpty) return;

    messages.add(ChatMessage(text: text, isUser: true));
    inputController.clear();

    // Fake typing / reply demo
    isTyping.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      messages.add(ChatMessage(
        text: "Nice choice! I’ll find some looks for you 🤍",
        isUser: false,
      ));
      isTyping.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();

    // Sample messages to match the screenshot
    messages.addAll([
      ChatMessage(
        text: "What's the occasion today?",
        isUser: false,
      ),
      ChatMessage(
        text: "A date in a Beach bar",
        isUser: true,
      ),
      ChatMessage(
        text:
        "Great! ✋ do you have any colour or vibe preferences?",
        isUser: false,
      ),
      ChatMessage(
        text: "Something light and warm colors",
        isUser: true,
      ),
    ]);

    // Show typing indicator (demo)
    Future.delayed(const Duration(milliseconds: 500), () {
      isTyping.value = true;
    });
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
