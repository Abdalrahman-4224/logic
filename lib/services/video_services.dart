import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:logic_study/models/video.dart';
import 'package:http/http.dart' as http;

Future<RxList<Video>> fetchVideos() async {
  final response = await http.get(Uri.parse('https://example.com/api/videos'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as RxList<dynamic>;
    final videos = data.map((json) => Video.fromJson(json)).toList();
    final videosRx = RxList<Video>(videos);
    return videosRx;
  } else {
    throw Exception('Failed to load videos');
  }
}
