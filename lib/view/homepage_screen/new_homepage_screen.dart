import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logic_study/view/course_screen.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:get/get.dart';
import 'package:logic_study/view/profile_screen.dart';
import 'package:logic_study/controller/courses_controller.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/controller/Universitites_controller.dart';

class new_homepage_screen extends StatelessWidget {
  final Coursecontroller _courseController = Get.put(Coursecontroller());
  final UniversititesController _universititesController =
      Get.put(UniversititesController());

  new_homepage_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            under_appbar_icons('assets/icons/underappbar_account.svg', () {
              Get.toNamed(Profile_screen.id);
            }),
            under_appbar_icons('assets/icons/underappbar_mycourses.svg', () {}),
            under_appbar_icons(
                'assets/icons/underappbar_the_collage.svg', () {}),
          ]),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: my_text_normal_bold(
                            'logic study',
                            MediaQuery.of(context).size.shortestSide * 0.06,
                            Colors.black))),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                GestureDetector(
                    onTap: () {
                      final universities =
                          _universititesController.universitiesList!.value;
                      universisitesChoices(context,
                          universities: universities, ontap: () {});
                    },
                    child: Image.asset(
                        'assets/image_needed/unifersity_image.png')),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(4),
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final course = _courseController.courses[index];
                  return othersbutton(
                    context,
                    title: course.title,
                    onpress: () {
                      Cid = course.id;
                      Get.toNamed(Course_screen.id);
                    },
                    imageurl: course.imageurl,
                  );
                },
              ),
            ),
          ],
        )));
  }
}
