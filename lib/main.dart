import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:logic_study/view/account_screen.dart';
import 'package:logic_study/view/course_screen.dart';
import 'package:logic_study/view/creat_account_screen.dart';
import 'package:logic_study/view/login_screen.dart';
import 'package:logic_study/view/logo_screen.dart';
import 'package:logic_study/view/profile_screen.dart';
import 'package:logic_study/view/setting_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'view/homepage_screen/home_screen.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:get/get.dart';
import 'package:logic_study/view/homepage_screen/new_homepage_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  DartVLC.initialize();
  // await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: login_screen(),
      getPages: [
        GetPage(name: Home_screen.id, page: () => Home_screen()),
        GetPage(name: Course_screen.id, page: () => const Course_screen()),
        GetPage(name: Logo_screen.id, page: () => const Logo_screen()),
        GetPage(name: Profile_screen.id, page: () => const Profile_screen()),
        GetPage(name: Setting_screen.id, page: () => const Setting_screen()),
        GetPage(
            name: Creat_account_screen.id, page: () => Creat_account_screen()),
        GetPage(name: AccountScreen.id, page: () => const AccountScreen()),
        GetPage(name: login_screen.id, page: () => login_screen()),
      ],
    );
  }

  Widget returnedscreeen() {
    if (secureStorage.containsKey(key: 'email') == true &&
        secureStorage.containsKey(key: 'password') == true) {
      return Home_screen();
    } else {
      return login_screen();
    }
  }
}
