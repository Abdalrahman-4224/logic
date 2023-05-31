// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:logic_study/widgets/coursescreen_cards.dart';

class profile_screen extends StatefulWidget {
  static String id = 'profile_screen';
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  static String id = 'profile_screen';
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
            onPressed: () {},
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
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  child: Image.asset(
                    'assets/image_needed/Artboard.png',
                    height: MediaQuery.of(context).size.height * 0.086,
                    width: double.infinity,
                  ),
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
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: Color(0xffe9e9e9),
            height: MediaQuery.of(context).size.height * 0.088,
            width: MediaQuery.of(context).size.width * 0.91,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.06,
                    backgroundImage:
                        AssetImage('assets/image_needed/unifersity_image.png'),
                  ),
                ),
                Column(
                  children: [
                    Text('الجامعة',
                        style: TextStyle(
                          fontFamily: 'OMNES-BOLD',
                          fontSize: 14,
                        )),
                    Text('الكلية',
                        style: TextStyle(fontFamily: 'OMNES', fontSize: 12)),
                    Text(
                      'الفرع',
                      style: TextStyle(fontFamily: 'OMNES', fontSize: 12),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'اشتراكاتك',
            style: TextStyle(fontSize: 22),
          ),
        ),
        courssecard(context),
        courssecard(context),
      ]),
    );
  }
}
