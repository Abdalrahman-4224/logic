import 'package:flutter/material.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:video_player/video_player.dart';
import '../constant.dart';
import 'package:logic_study/widgets/coursescreen_cards.dart';

class Video_screen extends StatefulWidget {
  const Video_screen({Key? key}) : super(key: key);

  @override
  State<Video_screen> createState() => _Video_screenState();
}

class _Video_screenState extends State<Video_screen> {
  void changeResolution(String resolution) async {
    String? videoUrl;
    switch (resolution) {
      case '480p':
        videoUrl =
            'https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4';
        break;
      case '720p':
        videoUrl =
            'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4';
        break;
      case '1080p':
        videoUrl =
            'https://www.sample-videos.com/video123/mp4/1080/big_buck_bunny_1080p_1mb.mp4';
        break;
    }
    VideoPlayerController newController =
        VideoPlayerController.network(videoUrl!);
    newController.initialize().then((_) {
      setState(() {
        Ccontroller.dispose();
        Ccontroller = newController;
        Ccontroller.play();
      });
    });
  }

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    Ccontroller = VideoPlayerController.network(
        'https://youtu.be/HQOQ52FkRzQ?list=RD4i982Kz0SAI');
    Ccontroller.addListener(() {
      setState(() {});
    });
    Ccontroller.initialize().then((value) {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: videoscreen(),
    );
  }
}
