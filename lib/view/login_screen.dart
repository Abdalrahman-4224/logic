import 'package:flutter/material.dart';
import 'package:logic_study/controller/login_controller.dart';
import 'package:logic_study/services/google_signin.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:logic_study/widgets/login_cards.dart';
import 'package:get/get.dart';

class login_screen extends StatelessWidget {
  static String id = '/login_screen';
  login_screen({super.key});

  @override
  var _controller = Get.put(login_controller());

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffefeff4),
        body: Obx(() => Stack(
              children: [
                ListView(children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.29,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: my_text_normal_bold(
                            'تسجيل الدخول', 30, Colors.black)),
                    mytextfield(context,
                        hinttext: 'البريد الاكتروني', icon: Icons.email),
                    PasswordCard(
                      hintText: 'كلمة المرور',
                      icon: Icons.lock_outline,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.031),
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
                      value: _controller.isCheked.value,
                      onChanged: (bool? value) {
                        _controller.isCheked.value = value!;
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, // Checkbox position (leading or trailing)
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    blue_login_button(context, 'تسجيل دخول', () {
                      _controller.handleLogin();
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
                if (_controller.isloading.value == true)
                  LoadingIndicator(_controller.isloading.value)!,
              ],
            )));
  }
}
