import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/models/courses_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Courseservices {
  FlutterSecureStorage securestorage = FlutterSecureStorage();
  Future<List<Course_model>> fetchcourses() async {
    print('called');
    final url = Uri.parse('$api/course');
    final token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFiZDFAZ21haWwuY29tIiwidXNlcklkIjoiNjRiNzA1MjBiZjE0YTY3YTBmMzdhMWE4Iiwicm9sZSI6IlVzZXIiLCJpYXQiOjE2ODk3MTYwMDEsImV4cCI6MTY4OTk3NTIwMX0.xGRMiFzHqpT6WFF2BVF9s51_FLwbhskiGCBD1hQmsFg";
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    if ((response.statusCode >= 200) && (response.statusCode <= 299)) {
      print("************${response.statusCode}**************");
      final data = jsonDecode(response.body) as List<dynamic>;
      final Courses =
          data.map((dynamic json) => Course_model.fromJson(json)).toList();
      print(Courses);
      return Courses;
    } else {
      if (response.statusCode == 401) {
        //TODOLG
        print(response.body);
        securestorage.delete(key: 'email');
        securestorage.delete(key: 'password');
      } else {
        ('---------${response.statusCode}--------- registration_service');
      }

      throw Exception('Failed to load videos');
    }
  }
}
