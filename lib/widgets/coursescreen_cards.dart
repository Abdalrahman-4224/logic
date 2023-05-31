import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:logic_study/constant.dart';

Padding courseimage(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.blue,
          width: 4,
        )),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/image_needed/construction-site.png',

            height: MediaQuery.of(context).size.height *
                0.3, // 20% of screen height
            width:
                MediaQuery.of(context).size.width * 0.9, // 60% of screen width
          ),
        ),
      ),
    ),
  );
}

Padding courssecard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Color(0xffe9e9e9),
        height: MediaQuery.of(context).size.height * 0.099,
        width: MediaQuery.of(context).size.width * 0.91,
      ),
    ),
  );
}

Container videoscreen() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayer(Ccontroller),
        ),
        Container(
          child: Text(
              "${Ccontroller.value.duration.inHours.toString().padLeft(2, '0')}:${(Ccontroller.value.duration.inMinutes % 60).toString().padLeft(2, '0')}:${(Ccontroller.value.duration.inSeconds % 60).toString().padLeft(2, '0')}"),
        ),
        Container(
            child: VideoProgressIndicator(Ccontroller,
                allowScrubbing: true,
                // ignore: prefer_const_constructors
                colors: VideoProgressColors(
                  backgroundColor: Colors.white70,
                  playedColor: Colors.blue,
                  bufferedColor: Colors.grey,
                ))),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.replay_10),
                onPressed: () {
                  Ccontroller.seekTo(Duration(
                      seconds: Ccontroller.value.position.inSeconds - 10));
                },
              ),
              IconButton(
                  onPressed: () {
                    if (Ccontroller.value.isPlaying) {
                      Ccontroller.pause();
                    } else {
                      Ccontroller.play();
                    }
                  },
                  icon: Icon(Ccontroller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow)),
              IconButton(
                icon: Icon(Icons.forward_10),
                onPressed: () {
                  Ccontroller.seekTo(Duration(
                      seconds: Ccontroller.value.position.inSeconds + 10));
                },
              ),
              // DropdownButton<String>(
              //   // ignore: prefer_const_constructors
              //   icon: Icon(Icons.settings),
              //   value: vselectedResolution,
              //   onChanged: (value) {
              //     setState(() {
              //       vselectedResolution = value!;
              //     });
              //     changeResolution(vselectedResolution);
              //   },
              //   items: vresolutions
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),
            ],
          ),
        ),
      ],
    ),
  );
}
