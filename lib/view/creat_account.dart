// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:logic_study/view/home_screen.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:logic_study/widgets/login_cards.dart';
import 'package:logic_study/services/auth_service.dart';
import 'package:get/get.dart';

class Creat_account_screen extends StatefulWidget {
  static String id = '/creat_account_screen';
  const Creat_account_screen({super.key});

  @override
  State<Creat_account_screen> createState() => _Creat_account_screenState();
}

class _Creat_account_screenState extends State<Creat_account_screen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefeff5),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(children: [
                      Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      my_text_normal_bold('رجوع', 20, Colors.black)
                    ]),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: my_text_normal_bold(
                            "انشاء حساب", 30, Colors.black))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                mytextfield(context,
                    hinttext: "اسم الحساب",
                    icon: Icons.account_circle_outlined),
                mytextfield(context,
                    hinttext: 'ألبريد الألكتروني', icon: Icons.email_outlined),
                PasswordCard(hintText: "كلمة المرور", icon: Icons.lock_outline),
                PasswordCard(
                    hintText: 'اعد كتابة كلمة المرور',
                    icon: Icons.lock_outline),
                CheckboxListTile(
                  title: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          my_text_normal(
                              "بالتسجيل فانت توافق على", 10, Colors.black),
                          GestureDetector(
                            child: my_text_normal_bold(
                                'الشروط والأحكام وسياسة الخصوصية',
                                10,
                                Colors.black),
                            onTap: () {
                              //TODO navigate
                            },
                          ),
                          my_text_normal('الخاصة بنا', 10, Colors.black)
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
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                blue_login_button(context, 'انشاء حساب', () {}),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                or_byusing(context),
                google_icon(context, () {}),
                Align(
                  alignment: Alignment.center,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      width: 130,
                      child: Row(
                        children: [
                          my_text_normal('الديك حساب بالفعل', 10, Colors.black),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: my_text_normal_bold(
                                'سجل الدخول', 10, Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
