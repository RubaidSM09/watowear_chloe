import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/data/services/api_services.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiService());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
  runApp(
      ScreenUtilInit(
          designSize: const Size(440, 1006), // Set your design size (e.g., based on your design mockup)
          minTextAdapt: true, // Allows text to scale adaptively
          splitScreenMode: true, // Supports split-screen mode
          builder: (context, child) {
            return GetMaterialApp(
              title: "Application",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
            );
          },
      ),
  );
  });
}
