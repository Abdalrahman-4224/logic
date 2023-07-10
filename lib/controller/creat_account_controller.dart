import 'package:get/get.dart';
import 'package:logic_study/services/registration_serivce.dart';
import 'package:flutter/material.dart';
import 'package:logic_study/view/homepage_screen/home_screen.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class creat_account_controller extends GetxController {
  RxBool isloading = false.obs;
  RxBool isChecked = false.obs;
  RxBool obscureText = true.obs;
  RxBool dontmatch = false.obs;
  RxBool wrongemailentered = false.obs;
  RxBool wrongpassowrdentered = false.obs;
  RxBool wrongusernameentered = false.obs;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final AuthService authService = AuthService();
  final formKey = GlobalKey<FormState>();

  void handleRegistration() {
    print('called');
    String email = ConstantVars.email;
    String password = ConstantVars.password;
    String username = ConstantVars.username;

    if (wrongemailentered == false &&
        wrongpassowrdentered == false &&
        wrongusernameentered == false) {
      // You can add more specific password validation rules if needed
      isloading.value = true;
      authService
          .registerUser(email: email, password: password, username: username)
          .then((success) {
        if (success) {
          secureStorage.write(key: 'email', value: email);
          secureStorage.write(key: 'password', value: password);
          secureStorage.write(key: 'username', value: username);
          Get.to(() => Home_screen());
          isloading.value = false;
        } else {
          // Handle registration failure
          // Display error message or perform any necessary actions
        }
      }).catchError((error) async {
        isloading.value = false;
        if (error is String) {
          // Handle specific error (e.g., conflict error)
          if (error.contains('conflict')) {
            // Handle conflict error
            // Display error message or perform any necessary actions
          } else {
            // Handle other errors if necessary
          }
        } else {
          // Handle general error
          // Display error message or perform any necessary actions
          await Get.dialog(AlertDialog(
            title: const Text('Registration Error'),
            content: const Text('Failed to register. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('OK'),
              ),
            ],
          ));
        }
      }).whenComplete(() {
        isloading.value = false;
      });
    } else {
      Get.dialog(AlertDialog(
        title: mytextnormal('خطأ في التسجيل', 12, Colors.red),
        content:
            mytextnormal('قم بأدخال المعلومات بصورة صحيحة', 15, Colors.black),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: mytextnormal('تم', 12, Colors.blue),
          ),
        ],
      ));
    }
  }
}


//TODO perfom validation from the below class and understand it well 
// class RegistrationController extends GetxController {
//   RxBool isLoading = false.obs;
//   final AuthService authService = AuthService();

//   void handleRegistration() async {
//     if (_validateForm()) {
//       String email = cemail.text.trim();
//       String password = cpassword.text.trim();
      
//       isLoading.value = true;

//       try {
//         await authService.registerUser(email, password);
//         // Registration successful
//         Get.to(() => HomeScreen());
//       } catch (error) {
//         // Registration failed
//         await Get.dialog(AlertDialog(
//           title: Text('Registration Error'),
//           content: Text('Failed to register. Please try again later.'),
//           actions: [
//             TextButton(
//               onPressed: () => Get.back(),
//               child: Text('OK'),
//             ),
//           ],
//         ));
//       } finally {
//         isLoading.value = false;
//       }
//     }
//   }

//   bool _validateForm() {
//     // Perform form validation
//     if (!GetUtils.isEmail(cemail.text.trim())) {
//       Get.snackbar('Validation Error', 'Invalid email');
//       return false;
//     }

//     if (cpassword.text.trim().isEmpty) {
//       Get.snackbar('Validation Error', 'Password cannot be empty');
//       return false;
//     }

//     // All validations passed
//     return true;
//   }
// }