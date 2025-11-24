import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/services/api_services.dart';

class HelpController extends GetxController {
  final TextEditingController textController = TextEditingController();

  final int maxLength = 9500;
  final RxInt currentLength = 0.obs;

  final ApiService _apiService = ApiService();

  final RxBool isSending = false.obs;
  final Rx<File?> selectedPhoto = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

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

  Future<void> onSend() async {
    final String message = textController.text.trim();

    if (message.isEmpty) {
      Get.snackbar(
        'Message required',
        'Please write a message before sending.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (isSending.value) return;

    isSending.value = true;

    try {
      final response = await _apiService.createSupportMessage(
        // you can later add a subject field in UI; for now use a generic one
        'WATOWEAR support',
        message,
        selectedPhoto.value,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          'Sent',
          'Your support message has been sent successfully.',
          snackPosition: SnackPosition.BOTTOM,
        );
        textController.clear();
        selectedPhoto.value = null;
      } else {
        debugPrint(
            'Support message failed: ${response.statusCode} ${response.body}');
        Get.snackbar(
          'Error',
          'Failed to send your message. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint('Support message exception: $e');
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isSending.value = false;
    }
  }

  Future<void> onAttachPressed() async {
    try {
      final XFile? picked =
      await _picker.pickImage(source: ImageSource.gallery);

      if (picked != null) {
        selectedPhoto.value = File(picked.path);
        Get.snackbar(
          'Attachment',
          'Photo attached successfully.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      Get.snackbar(
        'Error',
        'Could not pick an image.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
