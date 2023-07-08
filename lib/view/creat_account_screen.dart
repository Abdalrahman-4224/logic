// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/controller/creat_account_controller.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:logic_study/widgets/login_cards.dart';
import 'package:get/get.dart';

class Creat_account_screen extends StatelessWidget {
  static String id = '/Creat_account_screen';

  Creat_account_screen({super.key});
  final creat_account_controller _controller = creat_account_controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefeff5),
      body: SafeArea(
        child: Obx(
          () => Stack(children: [
            ListView(
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
                        icon: Icons.account_circle_outlined,
                        onchanged: ((value) {
                      ConstantVars.username = value;
                      if (value.length < 6 || value.isEmpty || value == null) {
                        _controller.wrongusernameentered.value = true;
                      } else {
                        _controller.wrongusernameentered.value = false;
                      }
                    })),
                    Visibility(
                      visible: _controller.wrongusernameentered.value,
                      child: Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.05),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: my_text_normal(
                                'قم بادخال اسم مستخدم صالح', 15, Colors.red)),
                      ),
                    ),
                    mytextfield(context,
                        hinttext: 'ألبريد الألكتروني',
                        icon: Icons.email_outlined, onchanged: ((value) {
                      ConstantVars.email = value;
                      if (value.length < 6 || value.isEmpty || value == null) {
                        _controller.wrongemailentered.value = true;
                      } else {
                        _controller.wrongemailentered.value = false;
                      }
                    })),
                    Visibility(
                      visible: _controller.wrongemailentered.value,
                      child: Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.05),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: my_text_normal(
                                'قم بادخال بريد الكتروني صالح',
                                15,
                                Colors.red)),
                      ),
                    ),
                    passwordCard_1(
                      onchanged: ((value) {
                        ConstantVars.password = value.trim();
                        if (value.length < 11 || value.isEmpty) {
                          _controller.wrongpassowrdentered.value = true;
                        } else {
                          _controller.wrongpassowrdentered.value = false;
                        }
                      }),
                      hintext: 'كلمة المرور',
                    ),
                    Visibility(
                      visible: _controller.wrongpassowrdentered.value,
                      child: Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.05),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: my_text_normal(
                                'قم بأدخال كلمة مرور صالحة', 15, Colors.red)),
                      ),
                    ),
                    passwordCard_1(
                      hintext: 'اعد كتابة كلمه المرور',
                      onchanged: ((value) {
                        ConstantVars.confirmedpassowrd = value;
                      }),
                    ),
                    Visibility(
                      visible: _controller.dontmatch.value,
                      child: Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.05),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: my_text_normal(
                                'كلمات السر لا تتطابق', 15, Colors.red)),
                      ),
                    ),
                    CheckboxListTile(
                      title: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              my_text_normal(
                                  "بالتسجيل فانت توافق على",
                                  MediaQuery.of(context).size.shortestSide *
                                      0.02,
                                  Colors.black),
                              GestureDetector(
                                child: my_text_normal_bold(
                                    'الشروط والأحكام وسياسة الخصوصية',
                                    MediaQuery.of(context).size.shortestSide *
                                        0.02,
                                    Colors.black),
                                onTap: () {
                                  //TODO navigate to webpage
                                },
                              ),
                              my_text_normal(
                                  'الخاصة بنا',
                                  MediaQuery.of(context).size.shortestSide *
                                      0.02,
                                  Colors.black)
                            ],
                          )),
                      value: _controller.isChecked.value,
                      onChanged: (bool? value) {
                        _controller.isChecked.value = value!;
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, // Checkbox position (leading or trailing)
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Visibility(
                      visible: _controller.isChecked.value,
                      child: blue_login_button(context, 'انشاء حساب', () {
                        print(ConstantVars.password);
                        print(ConstantVars.confirmedpassowrd);
                        // Get.to(Home_screen());
                        if (ConstantVars.password !=
                            ConstantVars.confirmedpassowrd) {
                          _controller.dontmatch.value = true;
                        } else {
                          _controller.handleRegistration();
                        }
                      }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Center(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Row(
                            children: [
                              my_text_normal(
                                  'الديك حساب بالفعل',
                                  MediaQuery.of(context).size.shortestSide *
                                      0.018,
                                  Colors.black),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: my_text_normal_bold(
                                    'سجل الدخول',
                                    MediaQuery.of(context).size.shortestSide *
                                        0.018,
                                    Colors.blue),
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
          ]),
        ),
      ),
    );
  }
}
