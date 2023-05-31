import 'package:flutter/material.dart';
import 'package:logic_study/view/account_screen.dart';
import 'package:logic_study/view/course_screen.dart';
import 'package:logic_study/view/creat_account.dart';
import 'package:logic_study/view/login_screen.dart';
import 'package:logic_study/view/logo_screen.dart';
import 'package:logic_study/view/profile_screen.dart';
import 'package:logic_study/view/setting_screen.dart';
import 'package:logic_study/view/video_screen.dart';
import 'view/home_screen.dart';
import 'package:dart_vlc/dart_vlc.dart';

void main() {
  DartVLC.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Login_screen.id,
      routes: {
        Home_screen.id: (context) => Home_screen(),
        Course_screen.id: (context) => Course_screen(),
        Logo_screen.id: (context) => Logo_screen(),
        profile_screen.id: (context) => profile_screen(),
        Setting_screen.id: (context) => Setting_screen(),
        Login_screen.id: (context) => Login_screen(),
        Creat_account_screen.id: (context) => Creat_account_screen(),
        AccountScreen.id: (context) => AccountScreen(),
      },
    );
  }
}
