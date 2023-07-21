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
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFiZEBnbWFpbC5jb20iLCJ1c2VySWQiOiI2NGI2OWNhYWYzOGI1OGM3Mjk0MDRlYTMiLCJ1c2VybmFtZSI6IkFiZF9hbHJhaG1hbjYyNiIsInJvbGUiOiJVc2VyIiwiaWF0IjoxNjg5ODM3MjIwLCJleHAiOjE2OTAwOTY0MjB9.tsgNm8Ab6UoMtACnvp5HUY0e4RhLlLoXsD8u18P2tJg";
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    if ((response.statusCode >= 200) && (response.statusCode <= 299)) {
      print("************${response.statusCode}************** COURSES-ERVICES");
      final data = jsonDecode(response.body);
      final data2 =
          data.map((dynamic json) => Course_model.fromJson(json)).toList();
      final Courses = data2.cast<Course_model>();
      print('CCCCCCCCCCCCCCCCCCCCCCCCCCCC$Courses CCCCCCCCCCCCCCCCCCCCCCCCCCC');
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
