// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:logic_study/widgets/coursescreen_cards.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:logic_study/models/video.dart';
import 'package:logic_study/services/video_services.dart';
import 'package:logic_study/controller/videos_controller.dart';

class Course_screen extends StatefulWidget {
  static String id = '/course_screen';

  const Course_screen({super.key});
  @override
  State<Course_screen> createState() => _Course_screenState();
}

class _Course_screenState extends State<Course_screen> {
  final Videos_Controller _controller = Videos_Controller();
  static String id = 'course_screen';
  final bool _showvideo = false;

  final List<Video_Model> _videos = [];
  Video_services video = Video_services();

  @override
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
          //show to video player if the user pressed on the video button
          Stack(children: [
            courseimage(context),
            if (_showvideo)
              Center(
                child: videoscreen(),
              ),
          ]),

          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final video = _controller.video[index];
                itemCount:
                _controller.video.length;

                return othersbutton(context, title: video.title, onpress: () {
                  Curl = video.videoUrl;
                }, imageurl: video.imageurl);
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
