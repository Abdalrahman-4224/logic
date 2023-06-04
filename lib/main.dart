import 'package:flutter/material.dart';
import 'package:logic_study/view/account_screen.dart';
import 'package:logic_study/view/course_screen.dart';
import 'package:logic_study/view/creat_account.dart';
import 'package:logic_study/view/oldlogin.dart';
import 'package:logic_study/view/login_screen.dart';
import 'package:logic_study/view/logo_screen.dart';
import 'package:logic_study/view/profile_screen.dart';
import 'package:logic_study/view/setting_screen.dart';
import 'view/home_screen.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:get/get.dart';

void main() {
  DartVLC.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: login_screen(),
      getPages: [
        GetPage(name: Home_screen.id, page: () => const Home_screen()),
        GetPage(name: Course_screen.id, page: () => Course_screen()),
        GetPage(name: Logo_screen.id, page: () => Logo_screen()),
        GetPage(name: profile_screen.id, page: () => const profile_screen()),
        GetPage(name: Setting_screen.id, page: () => const Setting_screen()),
        GetPage(name: oldlogin.id, page: () => const oldlogin()),
        GetPage(
            name: Creat_account_screen.id,
            page: () => const Creat_account_screen()),
        GetPage(name: AccountScreen.id, page: () => const AccountScreen()),
        GetPage(name: login_screen.id, page: () => login_screen()),
      ],
    );
  }
}
