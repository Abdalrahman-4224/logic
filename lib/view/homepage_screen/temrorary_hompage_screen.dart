import 'package:flutter/material.dart';
import 'package:logic_study/view/course_screen.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:get/get.dart';
import 'package:logic_study/view/profile_screen.dart';
import 'package:logic_study/controller/courses_controller.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/controller/Universitites_controller.dart';
import 'package:logic_study/controller/colleges_controller.dart';
import 'package:logic_study/controller/branches_controller.dart';

class new_homepage_screen extends StatelessWidget {
  final Coursecontroller _courseController = Get.put(Coursecontroller());
  final UniversititesController _universititesController =
      Get.put(UniversititesController());
  final CollegesController _collegesController = Get.put(CollegesController());
  final BranchesController _branchesController = Get.put(BranchesController());

  new_homepage_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            underappbaricons('assets/icons/underappbar_account.svg', () {
              Get.toNamed(Profile_screen.id);
            }),
            underappbaricons('assets/icons/underappbar_mycourses.svg', () {}),
            underappbaricons('assets/icons/underappbar_the_collage.svg', () {}),
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
                        child: mytextbold(
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
                      final colleges = _collegesController.collegesList!.value;
                      final branches = _branchesController.branchesList!.value;
                      universisitesChoices(context, universities: universities,
                          ontap: () {
                        collegeschoices(context, choices: colleges,
                            onpress: () {
                          brancheschoices(context, branches: branches,
                              onpress: () {
                            //TODO do the post event
                          });
                        });
                      });
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
                  dynamic course = _courseController.courses[index];
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