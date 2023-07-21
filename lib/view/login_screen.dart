import 'package:flutter/material.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/controller/login_controller.dart';
import 'package:logic_study/view/creat_account_screen.dart';
import 'package:logic_study/widgets/cards.dart';
import 'package:logic_study/widgets/login_cards.dart';
import 'package:logic_study/services/login_services.dart';
import 'package:get/get.dart';

class login_screen extends StatelessWidget {
  static String id = '/login_screen';
  const login_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(login_controller());

    final bool _obscureText = true;
    LoginServices loginServices = LoginServices();

    return Scaffold(
        backgroundColor: const Color(0xffefeff4),
        body: Obx(() => Stack(
              children: [
                ListView(children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.20,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: mytextbold('تسجيل الدخول', 30, Colors.black)),
                    mytextfield(context,
                        hinttext: 'البريد الاكتروني',
                        icon: Icons.email, onchanged: ((value) {
                      ConstantVars.email = value;
                    })),
                    passwordCard_1(
                      hintext: 'كلمة المرور',
                      onchanged: ((value) {
                        ConstantVars.password = value;
                      }),
                    ),
                    CheckboxListTile(
                      title: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              mytextnormal(
                                  "بالتسجيل فإنك توافق على ",
                                  MediaQuery.of(context).size.shortestSide *
                                      0.026,
                                  Colors.black),
                              GestureDetector(
                                child: mytextnormal(
                                    'الشروط والأحكام وسياسة الخصوصية',
                                    MediaQuery.of(context).size.shortestSide *
                                        0.026,
                                    Colors.blue),
                                onTap: () {},
                              ),
                              mytextnormal(
                                "الخاصة بنا",
                                MediaQuery.of(context).size.shortestSide *
                                    0.026,
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
                    Visibility(
                      visible: _controller.isCheked.value,
                      child: blue_login_button(context, 'تسجيل دخول', () {
                        print(
                          ConstantVars.email,
                        );
                        print(ConstantVars.password);
                        // _controller.handleLogin();
                        loginServices.loginUser();
                      }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              mytextnormal('ليس لديك حساب؟', 12, Colors.black),
                              GestureDetector(
                                onTap: () {
                                  Get.to(Creat_account_screen());
                                },
                                child:
                                    mytextbold('انشاء حساب', 12, Colors.blue),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ])
                ]),
                if (_controller.isloading.value == true)
                  loadingIndicator(_controller.isloading.value)!,
              ],
            )));
  }
}
