// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:logic_study/widgets/coursescreen_cards.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:logic_study/models/video.dart';
import 'package:video_player/video_player.dart';
import 'package:logic_study/services/video_services.dart';

class Course_screen extends StatefulWidget {
  static String id = '/course_screen';
  @override
  State<Course_screen> createState() => _Course_screenState();
}

class _Course_screenState extends State<Course_screen> {
  static String id = 'course_screen';
  bool _showvideo = false;
  List<Video> _videos = [];

  void initState() {
    super.initState();
    fetchVideos().then((videos) {
      setState(() {
        _videos = videos;
      });
    }).catchError((error) {
      print('Error fetching videos: $error');
    });
  }

  void dispose() {
    Ccontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          Stack(children: [
            courseimage(context),
            if (_showvideo)
              Center(
                child: videoscreen(),
              ),
          ]),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.builder(
              itemCount: _videos.length,
              itemBuilder: (context, index) {
                final video = _videos[index];
                return othersbutton(video.title, () {
                  Curl = video.videoUrl;
                }, '', context);
              },
            ),
          )
        ],
      )),
    );
  }
}


// class Coursehomepage extends StatelessWidget {
//   bool _showvideo=false;
//   @override
//   void initState(){
//     super.initState();
//   }
//   Widget build(BuildContext context) {
//     return 
//   }
// }


