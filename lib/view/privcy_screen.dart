import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logic_study/widgets/cards.dart';

class PrivecyScreen extends StatelessWidget {
  const PrivecyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffefeff5),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Color(0xffefeff5),
      //   title: Center(child: mytextbold('الاسئلة الشائعة', 21, Colors.black)),
      //   leading:
      // ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, top: 20),
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: mytextbold('سياسة الخصوصية', 21, Colors.black)),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        line(),
        SizedBox(
          height: 10,
        ),
        Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  mytextnormal('ماهي السياسات الخاصة بنا ؟', 16, Colors.black),
            )),
        SizedBox(
          height: 10,
        ),
        Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: mytextnormal(
                  'تخضع جميع الكورسات المسجلة لدينا الى سياسة الخصوصية الخاصة بنا ، هذا يعني انك لا تستطيع اعادة نشر الكورسات بأي شكل من الاشكال، بخلاف ذلك ستخضع للمخالفات القانونيةـ',
                  12,
                  Colors.black),
            )),
      ]),
    ));
  }
}
