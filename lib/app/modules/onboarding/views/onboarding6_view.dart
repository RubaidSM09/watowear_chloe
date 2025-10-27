import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Onboarding6View extends GetView {
  const Onboarding6View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding6View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Onboarding6View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
