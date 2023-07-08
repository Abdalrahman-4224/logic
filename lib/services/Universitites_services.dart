import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logic_study/models/university_model.dart';

class Universitites_services {
  Future<RxList<UniversitiesModel>> fetchuniversitites() async {
    FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final url = Uri.parse('https://dashboard.logic-study.com/api/course');
    final token = await secureStorage.read(key: 'token');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as RxList;
      final Universities =
          data.map((dynamic json) => UniversitiesModel.fromjson(json)).toList();
      final UniversitiesRx = RxList<UniversitiesModel>(Universities);
      return UniversitiesRx;
    } else {
      throw Exception('Failed to load Universities');
    }
  }
}
