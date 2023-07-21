import 'package:get/get.dart';
import 'dart:convert';
import 'package:logic_study/models/onecourse_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logic_study/view/login_screen.dart';
import 'package:logic_study/constant.dart';

class OneCoursebyId {
  final securestorage = const FlutterSecureStorage();

  Future<dynamic> fetchVideoById(String id) async {
    print('video_services called');
    final url = Uri.parse('$api/video/$id');
    final token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFiZEBnbWFpbC5jb20iLCJ1c2VySWQiOiI2NGI2OWNhYWYzOGI1OGM3Mjk0MDRlYTMiLCJ1c2VybmFtZSI6IkFiZF9hbHJhaG1hbjYyNiIsInJvbGUiOiJVc2VyIiwiaWF0IjoxNjg5ODM3MjIwLCJleHAiOjE2OTAwOTY0MjB9.tsgNm8Ab6UoMtACnvp5HUY0e4RhLlLoXsD8u18P2tJg"; // Replace this with your actual token
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      if (response.statusCode == 401) {
        Get.to(login_screen());
        securestorage.delete(key: 'email');
        securestorage.delete(key: 'password');
      } else {
        print('---------${response.statusCode}--------- video_services');
      }

      throw Exception('Failed to load videos');
    }
  }

  Future<OneCourseModel> fetchonecourse() async {
    //هسه هاي تجيبلك كورس واحد هوه و معلوماته
    // use english its ok
    //this will bring one course by id and its contain a list of video id's
    //the stubid document below if you want to watch ok
    print('video_services called');
    final url = Uri.parse('$api/course/64b6719d6f9ba2949481ef9b');
    final token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFiZEBnbWFpbC5jb20iLCJ1c2VySWQiOiI2NGI2OWNhYWYzOGI1OGM3Mjk0MDRlYTMiLCJ1c2VybmFtZSI6IkFiZF9hbHJhaG1hbjYyNiIsInJvbGUiOiJVc2VyIiwiaWF0IjoxNjg5ODM3MjIwLCJleHAiOjE2OTAwOTY0MjB9.tsgNm8Ab6UoMtACnvp5HUY0e4RhLlLoXsD8u18P2tJg"; // Replace this with your actual token
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      return OneCourseModel.fromJson(jsonData);
    } else {
      if (response.statusCode == 401) {
        Get.to(login_screen());
        securestorage.delete(key: 'email');
        securestorage.delete(key: 'password');
      } else {
        print('---------${response.statusCode}--------- video_services');
      }

      throw Exception('Failed to load videos');
    }
  }
}

//        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFiZEBnbWFpbC5jb20iLCJ1c2VySWQiOiI2NGI2OWNhYWYzOGI1OGM3Mjk0MDRlYTMiLCJ1c2VybmFtZSI6IkFiZF9hbHJhaG1hbjYyNiIsInJvbGUiOiJVc2VyIiwiaWF0IjoxNjg5ODM3MjIwLCJleHAiOjE2OTAwOTY0MjB9.tsgNm8Ab6UoMtACnvp5HUY0e4RhLlLoXsD8u18P2tJg";
