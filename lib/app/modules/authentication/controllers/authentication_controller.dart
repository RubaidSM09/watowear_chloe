import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  RxBool isSignIn = true.obs;
  RxBool obscureText = true.obs;
  RxBool newPassObscureText = true.obs;
  RxBool confirmNewPassObscureText = true.obs;

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
