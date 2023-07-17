import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logic_study/constant.dart';

class AuthService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<bool> registerUser(
      {required String email,
      required String username,
      required String password}) async {
    String url = '$api/signup';
    final response = await http.post(Uri.parse(url), body: {
      'username': username,
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
      final String bearerToken = jsondata['token'];
      await secureStorage.write(key: 'Bearer Token', value: bearerToken);

      return true;
    } else {
      print('---------${response.statusCode}--------- registration_service');
    }
    return false;
  }

  void myerror(String text) => print(text);
}
