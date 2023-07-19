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
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFiZDFAZ21haWwuY29tIiwidXNlcklkIjoiNjRiNzA1MjBiZjE0YTY3YTBmMzdhMWE4Iiwicm9sZSI6IlVzZXIiLCJpYXQiOjE2ODk3MTYwMDEsImV4cCI6MTY4OTk3NTIwMX0.xGRMiFzHqpT6WFF2BVF9s51_FLwbhskiGCBD1hQmsFg";
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('CCCCCCCCCCCCCCCCCCCCC${data}cccccccccccccccccccc');

      final data2 =
          data.map((dynamic json) => Colleges_model.fromjson(json)).toList();
      var colleages = data2.cast<Colleges_model>();
      print('CCCCCCCCCCCCCCCCCCCCC${colleages}cccccccccccccccccccc');
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
