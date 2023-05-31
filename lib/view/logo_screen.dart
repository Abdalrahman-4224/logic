import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logic_study/view/home_screen.dart';
import 'package:logic_study/view/login_screen.dart';

class Logo_screen extends StatefulWidget {
  static String id = 'splash_screen';
  @override
  _Logo_screenState createState() => _Logo_screenState();
}

class _Logo_screenState extends State<Logo_screen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the home screen after 2 seconds
    Timer(Duration(seconds: 1), () {
      Navigator.pushNamed(context, Login_screen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset('assets/icons/logo.svg')),
    );
  }
}
