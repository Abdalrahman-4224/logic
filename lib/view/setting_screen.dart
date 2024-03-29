import 'package:flutter/material.dart';
import 'package:logic_study/view/account_screen.dart';
import 'package:logic_study/widgets/setting_screen_cards.dart';
import 'package:get/get.dart';

class Setting_screen extends StatelessWidget {
  static String id = '/setting_screen';
  const Setting_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Directionality(
            textDirection: TextDirection.rtl,
            child: Center(
              child: Text(
                'الاعدادات',
                style: TextStyle(color: Colors.black),
              ),
            )),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            width: double.infinity,
          ),
          Center(child: settingline(context)),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'عام',
              style: TextStyle(fontSize: 21),
            ),
          ),
          settingbutton('assets/icons/account.svg', 'الحساب', () {
            Get.to(const AccountScreen());
          }),
          settingline(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('اخرى', style: TextStyle(fontSize: 21)),
          ),
          settingbutton(
              'assets/icons/question_mark.svg', 'الاسئلة الشائعة', () {}),
          settingline(context),
          settingbutton('assets/icons/privecy.svg', 'سياسة الخصوصية', () {}),
          settingline(context),
          settingbutton('assets/icons/rules.svg', 'الشروط والأحكام', () {}),
          settingline(context),
          settingbutton('assets/icons/logout.svg', 'تسجيل الخروج', () {}),
          settingline(context),
        ]),
      ),
    );
  }
}
