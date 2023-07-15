import 'package:get/get.dart';
import 'dart:convert';
import 'package:logic_study/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logic_study/view/login_screen.dart';

class Video_services {
  final securestorage = const FlutterSecureStorage();
  Future<RxList<Video_Model>> fetchVideos() async {
    final url = Uri.parse('https://api.v2.logicstudy.com/videos');
    final token = await securestorage.read(key: 'token');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as RxList<dynamic>;
      final videos = data.map((json) => Video_Model.fromJson(json)).toList();
      final videosRx = RxList<Video_Model>(videos);
      return videosRx;
    } else {
      if (response.statusCode == 401) {
        //TODOLG
        securestorage.delete(key: 'email');
        securestorage.delete(key: 'password');
      }

      throw Exception('Failed to load videos');
    }
  }
}
