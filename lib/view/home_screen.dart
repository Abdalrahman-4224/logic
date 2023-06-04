// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:logic_study/view/video_screen.dart';
import '../widgets/cards.dart';

class Home_screen extends StatefulWidget {
  static String id = '/home_screen';
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Logic Study',
          style: TextStyle(color: Colors.black),
        ),
        actions: [Image.asset('assets/image_needed/unifersity_image.png')],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          underappbar_icons('assets/icons/underappbar_account.svg'),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: underappbar_icons('assets/icons/underappbar_mycourses.svg'),
          ),
          underappbar_icons('assets/icons/underappbar_the_collage.svg'),
        ]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              line(),
              Container(
                width: double.infinity,
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'المزيد',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'تم تنزيله مؤخرًا',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.zero,
                height: MediaQuery.of(context).size.height * 0.2,
                child: PageView(
                  padEnds: false,
                  controller: PageController(
                    initialPage: 1,
                    viewportFraction: 0.48,
                  ),
                  scrollDirection: Axis.horizontal,
                  children: [],
                ),
              ),
              line(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'المزيد',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5, top: 5),
                    child: Text(
                      'كورسات قد تهمك',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'تم وضع افضل الكورسات بنائا على اهماماتك',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              Container(
                height: 200,
                child: PageView(
                  padEnds: false,
                  controller:
                      PageController(initialPage: 1, viewportFraction: 0.94),
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  children: [
                    coursesmyimportant(context),
                    coursesmyimportant(context),
                    coursesmyimportant(context),
                  ],
                ),
              ),
              line(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'المزيد',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5, top: 5),
                    child: Text(
                      'كورسات المواد الاساس',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                  ),
                ],
              ),
              Container(
                height: 132,
                width: 380,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFF0085FF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 54,
                          width: 178,
                          decoration: BoxDecoration(
                            color: const Color(0xFF007CFF).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.centerRight,
                                  width: 90,
                                  margin: const EdgeInsets.only(left: 12),
                                  child: const Text("تكامل مبتدئين",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'normalMyFont'))),
                              const SizedBox(
                                width: 9,
                              ),
                              const CircleAvatar(
                                radius: 24,
                                backgroundColor: Color(0xFFD3D3D3),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          height: 54,
                          width: 178,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF007CFF).withOpacity(0.4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.centerRight,
                                  width: 90,
                                  margin: const EdgeInsets.only(left: 12),
                                  child: const Text("تكامل متقدم",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'normalMyFont',
                                          fontWeight: FontWeight.bold))),
                              const SizedBox(
                                width: 9,
                              ),
                              const CircleAvatar(
                                radius: 24,
                                backgroundColor: Color(0xFFD3D3D3),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 54,
                          width: 178,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF007CFF).withOpacity(0.4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.centerRight,
                                  width: 90,
                                  margin: const EdgeInsets.only(left: 12),
                                  child: const Text("اساسيات طيران",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'normalMyFont'))),
                              const SizedBox(
                                width: 9,
                              ),
                              const CircleAvatar(
                                radius: 24,
                                backgroundColor: Color(0xFFD3D3D3),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 54,
                          width: 178,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF007CFF).withOpacity(0.4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.centerRight,
                                  width: 90,
                                  margin: const EdgeInsets.only(left: 12),
                                  child: const Text("مبادئ كيمياوي",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'normalMyFont'))),
                              const SizedBox(
                                width: 9,
                              ),
                              const CircleAvatar(
                                radius: 24,
                                backgroundColor: Color(0xFFD3D3D3),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              line(),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'اكمل من حيث انتهيت',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [],
              ),
              line(),
            ],
          ),
        ),
      ),
    );
  }
}
