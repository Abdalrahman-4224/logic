import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logic_study/constant.dart';
import 'package:dio/dio.dart';

class RegistrationService {
  FlutterSecureStorage secureStorage = FlutterSecureStorage();
  void registerUser() async {
    const url = "https://dashboard.logic-study.com/api/signup";
    try {
      final response = await Dio().post(
        url,
        data: {
          "username": ConstantVars.username,
          "email": ConstantVars.email,
          "password": ConstantVars.password,
        },
      );
      if ((response.statusCode == 200 || response.statusCode == 299)) {
        secureStorage.write(key: 'username', value: ConstantVars.username);
        secureStorage.write(key: 'email', value: ConstantVars.email);
        secureStorage.write(key: 'password', value: ConstantVars.password);
        final token = response.data['token'];
        await secureStorage.write(key: 'Bearer Token', value: token);
      }

      debugPrint(response.data.toString());
    } on DioError catch (e) {
      print(e.response?.data);
      print(e.error);
      print(e.message);
    }
  }
  // final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  // Future<bool> registerUser(
  //     {required String email,
  //     required String username,
  //     required String password}) async {
  //   print('registerservice called ');
  //   print(email);
  //   print(username);
  //   print(password);
  //   print(ConstantVars.confirmedpassowrd);
  //   String url = '$api/signup';
  //   final response = await http.post(Uri.parse(url), body: {
  //     "username": username,
  //     "email": email,
  //     "password": password,
  //   });
  //   if ((response.statusCode >= 200) && (response.statusCode < 299)) {
  //     final jsondata = json.decode(response.body);
  //     final String bearerToken = jsondata['token'];
  //     await secureStorage.write(key: 'Bearer Token', value: bearerToken);

  //     return true;
  //   } else {
  //     print('------${response.body}');
  //     print(response);
  //     print('---------${response.statusCode}--------- registration_service');
  //     return false;
  //   }
  // }

  // void myerror(String text) => print(text);
}
