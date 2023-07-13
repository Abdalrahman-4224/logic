// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logic_study/view/login_screen.dart';
import 'package:logic_study/constant.dart';
import 'package:get/get.dart';
import 'package:logic_study/view/homepage_screen/nocollage_screen.dart';
import 'package:logic_study/view/homepage_screen/temprorary_hompage_screen.dart';

class Home_screen extends StatelessWidget {
  FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static String id = '/home_screen';
  final _scrollController = ScrollController();

  Home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: Align(alignment:Alignment.topLeft,child: my_text_normal_bold('logic study',  MediaQuery.of(context).size.shortestSide * 0.03, Colors.black)),
      //   actions: [Image.asset('assets/image_needed/unifersity_image.png'),],
      // ),

      body: SafeArea(
        child: returnedscreeen(),
      ),
    );
  }

  Widget returnedscreeen() {
    // ignore: unrelated_type_equality_checks
    if (secureStorage.containsKey(key: 'email') == true &&
        // ignore: unrelated_type_equality_checks
        secureStorage.containsKey(key: 'password') == true) {
      if (Choices.branchid.isEmpty) {
        return (NoCollege());
      } else {
        return (TemproraryHompageScreen());
      }
    } else {
      return login_screen();
    }
  }
}
