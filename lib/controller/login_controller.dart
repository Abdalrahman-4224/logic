import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logic_study/services/login_services.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/view/homepage_screen/home_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Controller
class login_controller extends GetxController {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  RxBool isloading = false.obs;
  RxBool isCheked = false.obs;
  final AuthService authService = AuthService();

  void handleLogin() {
    String email = ConstantVars.email.trim();
    String password = ConstantVars.password.trim();
    isloading.value = true;
    authService.loginUser(email, password).then((success) {
      if (success) {
        secureStorage.write(key: 'email', value: email);
        secureStorage.write(key: 'password', value: password);
        Get.to(() => Home_screen());
      } else {
        Get.dialog(AlertDialog(
          title: const Text('Login Error'),
          content: const Text('Failed to log in. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('OK'),
            ),
          ],
        ));
        // Handle login failure
        // Display error message or perform any necessary actions
      }
    }).catchError((error) async {
      isloading.value = false;
      await Get.dialog(AlertDialog(
        title: const Text('Login Error'),
        content: const Text('Failed to log in. Please try again later.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ));
    }).whenComplete(() {
      isloading.value = false;
    });
  }
}
