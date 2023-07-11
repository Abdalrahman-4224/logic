import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logic_study/view/profile_screen.dart';
import 'package:logic_study/controller/Universitites_controller.dart';
import 'package:logic_study/controller/branches_controller.dart';
import 'package:logic_study/controller/colleges_controller.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final UniversititesController _universititesController =
        Get.put(UniversititesController());
    final CollegesController _collegesController =
        Get.put(CollegesController());
    final BranchesController _branchesController =
        Get.put(BranchesController());

    return Scaffold(
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
          ],
        ),
      ),
    );
  }
}
