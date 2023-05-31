// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:logic_study/view/home_screen.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<void> handleGoogleSignIn(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      String name = googleUser.displayName ?? '';
      String email = googleUser.email;
      String photoUrl = googleUser.photoUrl ?? '';
      Get.to(const Home_screen());

      // Successful login, handle user data
      // ...
    } else {
      // Google Sign-In canceled by the user
      // Handle accordingly
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Error'),
          content: const Text('user canceled logingin'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  } catch (e) {
    // Handle any errors
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Error'),
        content: const Text('try again later'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    print('Error: $e');
  }
}
