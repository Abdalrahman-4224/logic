// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logic_study/widgets/coursescreen_cards.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:logic_study/models/onecourse_model.dart';
import 'package:logic_study/services/onecoursebyId_services.dart';
import 'package:logic_study/controller/videos_controller.dart';

class Course_screen extends StatelessWidget {
  static String id = '/course_screen';

  const Course_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final Videos_Controller controller = Get.put(Videos_Controller());
    final RxBool showvideo = false.obs;
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  //show to video player if the user pressed on the video button
                  Stack(children: [
                    courseimage(context),
                    if (showvideo.value) Center(child: videoscreen()),
                  ]),
                  Expanded(
                    // Add the Expanded widget here
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 460,
                      width: 375,

                      // child: ListView.builder(
                      //   itemCount: controller.video!.length,
                      //   itemBuilder: (context, index) {
                      //     final video = controller.video![index];

                      //     return othersbutton(
                      //       context,
                      //       title: video.title,
                      //       onpress: () {
                      //         Curl = video.videoUrl!;
                      //       },
                      //       imageurl: video.imageurl!,
                      //     );
                      //   },
                      // ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: !cisfree,
                child: SizedBox(
                  width: 380,
                  height: 80,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Center(
                      child: Row(children: [
                        mytextbold(
                            '${Course.coursePrice} د.ع ', 21, Colors.black),
                        GestureDetector(
                          onTap: () {
                            openTelegramChat(
                                Course.cid!, 'courseName', 'telegramUser');
                            //TODO DO THE TELEGRAM METHOD ABOVE
                          },
                          child: Container(
                            height: 42,
                            width: 230,
                            child: mytextbold(
                                "انضم الان", 17.5, Color(0xff0e4f8b)),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
