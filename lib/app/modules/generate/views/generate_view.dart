import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/generate_controller.dart';

class GenerateView extends GetView<GenerateController> {
  const GenerateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GenerateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GenerateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
