import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logic_study/view/homepage_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logic_study/controller/Universitites_controller.dart';

class Logo_screen extends StatefulWidget {
  static String id = '/splash_screen';

  const Logo_screen({super.key});
  @override
  _Logo_screenState createState() => _Logo_screenState();
}

class _Logo_screenState extends State<Logo_screen> {
  UniversititesController universitycontroller =
      Get.put(UniversititesController());
  @override
  void initState() {
    super.initState();
    universitycontroller.fetchUniversities();
    // Navigate to the home screen after 2 seconds
    Timer(const Duration(seconds: 1), () {
      Get.to(Home_screen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset('assets/icons/logo.svg')),
    );
  }
}
