import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logic_study/services/auth_service.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/view/home_screen.dart';

// Controller
class login_controller extends GetxController {
  RxBool isloading = false.obs;
  RxBool isCheked = false.obs;
  final AuthService authService = AuthService();

  void handleLogin() {
    String email = cemail.text.trim();
    String password = cpassowrd.text.trim();
    isloading.value = true;
    authService.loginUser(email, password).then((success) {
      if (success) {
        Get.to(() => Home_screen());
      } else {
        // Handle login failure
        // Display error message or perform any necessary actions
      }
    }).catchError((error) async {
      isloading.value = false;
      await Get.dialog(AlertDialog(
        title: Text('Login Error'),
        content: Text('Failed to log in. Please try again later.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
      ));
    }).whenComplete(() {
      isloading.value = false;
    });
  }
}
