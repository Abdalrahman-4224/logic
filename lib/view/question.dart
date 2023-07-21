import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logic_study/widgets/cards.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

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
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, top: 20),
              child: mytextbold('الاسئلة الشائعة', 21, Colors.black),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        line(),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 114,
          width: 300,
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 113,
                color: Color(0xffdbdada),
                child: Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Center(
                      child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: mytextnormal(
                          'مدة الاشتراك في الكورس على طول الفترة الدراسية، اي بعد ان تنتهي الامتحانات النهائية و اعلان النتائج تتوقف الاشتراكات جميعاً',
                          14,
                          Colors.black),
                    ),
                  )),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 43,
                width: 376,
                color: Color(0xffe9e9e9),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: mytextbold(
                          'كم هي مدة الاشتراك في الكورس؟', 16, Colors.black),
                    )),
              ),
            )
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 114,
          width: 300,
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 100,
                color: Color(0xffdbdada),
                child: Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Center(
                      child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: mytextnormal(
                          'نحن نأسف لذلك، الا ان المادة الدراسة مخصصة لسنة دراسية واحدة',
                          14,
                          Colors.black),
                    ),
                  )),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 43,
                width: 376,
                color: Color(0xffe9e9e9),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: mytextbold(
                          'رسبت في مادة مسجل فيها سابقاً مال الحل؟',
                          16,
                          Colors.black),
                    )),
              ),
            )
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 114,
          width: 300,
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 100,
                color: Color(0xffdbdada),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Center(
                      child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: mytextnormal(
                          'يمكنك التواصل معنا عن طريق التلجرام ( logic_100@ )',
                          14,
                          Colors.black),
                    ),
                  )),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 43,
                width: 376,
                color: Color(0xffe9e9e9),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: mytextbold(
                          'كيف يمكنني التواصل معكم؟', 16, Colors.black),
                    )),
              ),
            )
          ]),
        )
      ]),
    ));
  }
}
