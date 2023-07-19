import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:logic_study/models/university_model.dart';
import 'package:logic_study/view/login_screen.dart';

import '../constant.dart';

class Universitites_services {
  Future<List<UniversitiesModel>> fetchuniversitites() async {
    FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final url = Uri.parse('$api/university');
    final token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFiZDFAZ21haWwuY29tIiwidXNlcklkIjoiNjRiNzA1MjBiZjE0YTY3YTBmMzdhMWE4Iiwicm9sZSI6IlVzZXIiLCJpYXQiOjE2ODk3MTYwMDEsImV4cCI6MTY4OTk3NTIwMX0.xGRMiFzHqpT6WFF2BVF9s51_FLwbhskiGCBD1hQmsFg"; // Replace with your JWT token
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      print(
          '-------------------${response.statusCode}-----------------universities_services');

      final data = jsonDecode(response.body);

      final data2 =
          data.map((json) => UniversitiesModel.fromJson(json)).toList();
      var universities = data2.cast<UniversitiesModel>();

      return universities;
    } else if (response.statusCode == 401) {
      print('error 401');
      Get.to(login_screen());
      secureStorage.delete(key: 'email');
      secureStorage.delete(key: 'password');
      throw Exception('Unauthorized: Please log in again');
    } else {
      print('---------${response.statusCode}--------- registration_service');
      throw Exception('Failed to load Universities');
    }
  }
}
