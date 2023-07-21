import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/models/colleges_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:logic_study/view/login_screen.dart';

class CollegesServices {
  FlutterSecureStorage securestorage = FlutterSecureStorage();
  Future<List<Colleges_model>> fetchcolleges() async {
    final url = Uri.parse('$api/colleage');
    final token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFiZEBnbWFpbC5jb20iLCJ1c2VySWQiOiI2NGI2OWNhYWYzOGI1OGM3Mjk0MDRlYTMiLCJ1c2VybmFtZSI6IkFiZF9hbHJhaG1hbjYyNiIsInJvbGUiOiJVc2VyIiwiaWF0IjoxNjg5ODM3MjIwLCJleHAiOjE2OTAwOTY0MjB9.tsgNm8Ab6UoMtACnvp5HUY0e4RhLlLoXsD8u18P2tJg";
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final data2 =
          data.map((dynamic json) => Colleges_model.fromjson(json)).toList();
      var colleages = data2.cast<Colleges_model>();
      return colleages;
    } else {
      if (response.statusCode == 401) {
        Get.to(login_screen());
        securestorage.delete(key: 'email');
        securestorage.delete(key: 'password');
      } else {
        print('---------${response.statusCode}--------- registration_service');
      }

      throw Exception('Failed to load colleges');
    }
  }
}
