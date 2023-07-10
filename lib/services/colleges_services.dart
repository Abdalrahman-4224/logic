import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/models/colleges_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CollegesServices {
  FlutterSecureStorage securestorage = FlutterSecureStorage();
  Future<RxList<Colleges_model>> fetchcolleges() async {
    final url = Uri.parse('$api/colleage');
    final token = await securestorage.read(key: 'token');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as RxList;
      final colleges =
          data.map((dynamic json) => Colleges_model.fromjson(json)).toList();
      final collegeRx = RxList<Colleges_model>(colleges);
      return collegeRx;
    } else {
      throw Exception('Failed to load colleges');
    }
  }
}
