// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
    FlutterSecureStorage secureStorage = FlutterSecureStorage();
    Future<String?> universitytittle =
        secureStorage.read(key: 'universitytittle');
    final Future<String?> collegetittle =
        secureStorage.read(key: 'collegetittle');
    final Future<String?> branchtittle =
        secureStorage.read(key: 'branchtittle');
    final Future<String?> email = secureStorage.read(key: 'email');
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
          title: Center(
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: mytextbold('الملف الشخصي', 20, Colors.black)),
          )),
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          underappbaricons('assets/icons/underappbar_account.svg', () {
            Get.to(Profile_screen());
          }),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: underappbaricons(
                'assets/icons/underappbar_mycourses.svg', () {}),
          ),
          underappbaricons('assets/icons/underappbar_the_collage.svg', () {
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
                Stack(children: [
                  line(),
                  Center(
                    child: FutureBuilder(
                      future: email,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data ?? '',
                            style: TextStyle(color: Colors.black),
                          );
                        } else {
                          return Text('loading...');
                        }
                      },
                    ),
                  )
                ]),
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
                      AssetImage('assets/image_needed/no-profile-picture.jpg'),
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
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: FutureBuilder(
                            future: universitytittle,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return mytextbold(
                                    snapshot.data ?? '', 14, Colors.black);
                              } else {
                                return Text('Loading...');
                              }
                            }),
                      ),
                      FutureBuilder(
                        future: collegetittle,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return mytextbold(
                                snapshot.data ?? '', 12, Colors.black);
                          } else {
                            return Text('loading...');
                          }
                        },
                      ),
                      FutureBuilder(
                        future: branchtittle,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return mytextbold(
                                snapshot.data ?? '', 12, Colors.black);
                          } else {
                            return Text('loading...');
                          }
                        },
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: mytextnormal(
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
