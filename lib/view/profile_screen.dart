// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:logic_study/view/homepage_screen/home_screen.dart';
import 'package:logic_study/view/setting_screen.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:logic_study/widgets/coursescreen_cards.dart';
import 'package:get/get.dart';

class Profile_screen extends StatelessWidget {
  const Profile_screen({super.key});
  static String id = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              color: Colors.black,
              Icons.settings,
            ),
            onPressed: () {
              Get.to(Setting_screen());
            },
          ),
          title: const Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'الملف الشخصي',
                style: TextStyle(
                    fontFamily: 'OMNES',
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )),
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          under_appbar_icons('assets/icons/underappbar_account.svg', () {
            Get.to(Profile_screen());
          }),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: under_appbar_icons(
                'assets/icons/underappbar_mycourses.svg', () {}),
          ),
          under_appbar_icons('assets/icons/underappbar_the_collage.svg', () {
            Get.to(Home_screen());
          }),
        ]),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/image_needed/Artboard.png',
                  height: 76,
                  width: double.infinity,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                line(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.07,
                  backgroundImage:
                      AssetImage('assets/image_needed/Frame 5.png'),
                ),
                //here should be the email of user and name
              ],
            ),
          ],
        ),
        SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Color(0xffe9e9e9),
              height: 78,
              width: 382,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.06,
                      backgroundImage: AssetImage(
                          'assets/image_needed/unifersity_image.png'),
                    ),
                  ),
                  Column(
                    children: [
                      Text('الجامعة',
                          style: TextStyle(
                            fontFamily: 'OMNES-BOLD',
                            fontSize: 14,
                          )),
                      my_text_normal('الكلية', 12, Colors.black),
                      my_text_normal('الفرع', 12, Colors.black),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: my_text_normal(
            'اشتراكاتك',
            22,
            Colors.black,
          ),
        ),
        courssecard(context),
        courssecard(context),
      ]),
    );
  }
}

//TODO change this to stateless
