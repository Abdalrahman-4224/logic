import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
//هنا ال backend من اجيبه من حسن

class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String videoUrl;
  final int duration;

  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.duration,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
      videoUrl: json['videoUrl'],
      duration: json['duration'],
    );
  }
}
