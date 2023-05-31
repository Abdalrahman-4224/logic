import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

late String Curl;
String vselectedResolution = '480p';
List<String> vresolutions = ['480p', '720p', '1080p'];
late VideoPlayerController Ccontroller = VideoPlayerController.network('$Curl');
TextEditingController cpassowrd = TextEditingController();
TextEditingController cemail = TextEditingController();
