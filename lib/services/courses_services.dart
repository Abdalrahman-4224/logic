import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/models/courses_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Courseservices {
  FlutterSecureStorage securestorage = FlutterSecureStorage();
  Future<RxList<Course_model>> fetchcourses() async {
    final url = Uri.parse('$api/course');
    final token = await securestorage.read(key: 'token');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as RxList;
      final Courses =
          data.map((dynamic json) => Course_model.fromJson(json)).toList();
      final CoursesRx = RxList<Course_model>(Courses);
      return CoursesRx;
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
