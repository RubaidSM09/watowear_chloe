import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpController extends GetxController {
  final TextEditingController textController = TextEditingController();

  final int maxLength = 9500;
  final RxInt currentLength = 0.obs;

  @override
  void onInit() {
    super.onInit();
    textController.addListener(() {
      currentLength.value = textController.text.length;
    });
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  void onSend() {
    // TODO: handle send action
    debugPrint("Sending: ${textController.text}");
  }

  void onAttachPressed() {
    // TODO: open file picker
  }
}
