// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/services/google_signin.dart';
import 'package:logic_study/view/home_screen.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:logic_study/widgets/login_cards.dart';
import 'package:logic_study/services/auth_service.dart';
import 'package:get/get.dart';

class oldlogin extends StatefulWidget {
  static String id = '/login_screen';
  const oldlogin({super.key});

  @override
  State<oldlogin> createState() => _oldloginState();
}

class _oldloginState extends State<oldlogin> {
  final AuthService authService = AuthService();
  bool _isloading = false;
  void _handleLogin() {
    String email = cemail.text.trim();
    String password = cpassowrd.text.trim();
    setState(() {
      _isloading = true;
    });
    authService.loginUser(email, password).then((_) {
      Get.to(Home_screen());
    }).catchError((error) {
      _isloading = false;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Error'),
          content: Text('Failed to log in. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      //TODO Handle login error and show an error message to the user
    }).whenComplete(() {
      setState() {
        _isloading = false;
      }
    });
  }

  String? useremail;

  String? userpassword;

  bool _obscureText = true;
  bool _isChecked = false;
  @override
  void dispose() {
    cemail.dispose();
    cpassowrd.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffefeff4),
        body: Stack(
          children: [
            ListView(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.29,
                ),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:
                        my_text_normal_bold('تسجيل الدخول', 30, Colors.black)),
                // mytextfield(context,
                //     hinttext: 'البريد الاكتروني', icon: Icons.email),
                PasswordCard(
                  hintText: 'كلمة المرور',
                  icon: Icons.lock_outline,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.031),
                    child: TextButton(
                        onPressed: () {},
                        child: my_text_normal(
                            'نسيت كملة المرور؟', 12, Colors.black)),
                  ),
                ),
                CheckboxListTile(
                  title: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          my_text_normal(
                              "بالتسجيل فإنك توافق على ", 10, Colors.black),
                          GestureDetector(
                            child: my_text_normal(
                                'الشروط والأحكام وسياسة الخصوصية',
                                10,
                                Colors.black),
                            onTap: () {},
                          ),
                          my_text_normal(
                            "الخاصة بنا",
                            10,
                            Colors.black,
                          ),
                        ],
                      )),
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity
                      .leading, // Checkbox position (leading or trailing)
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                blue_login_button(context, 'تسجيل دخول', () {
                  _handleLogin();
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                or_byusing(context),
                google_icon(context, () {
                  handleGoogleSignIn(context);
                })
              ])
            ]),
            if (_isloading == true) LoadingIndicator(_isloading)!,
          ],
        ));
  }
}
