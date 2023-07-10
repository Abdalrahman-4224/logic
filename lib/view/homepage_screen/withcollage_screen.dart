import 'package:flutter/material.dart';
import 'package:logic_study/view/course_screen.dart';
import 'package:logic_study/view/profile_screen.dart';
import '../../widgets/cards.dart';
import 'package:get/get.dart';

class With_collage_screen extends StatefulWidget {
  const With_collage_screen({super.key});

  @override
  State<With_collage_screen> createState() => _With_collage_screenState();
}

class _With_collage_screenState extends State<With_collage_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: my_text_normal_bold(
                            'logic study',
                            MediaQuery.of(context).size.shortestSide * 0.06,
                            Colors.black))),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                GestureDetector(
                    onTap: () {
                      // TODO showModalBottomSheet(
                    },
                    child: Image.asset(
                        'assets/image_needed/unifersity_image.png')),
              ],
            ),
            line(),
            const SizedBox(
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
                      child: const Text(
                        'المزيد',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'تم تنزيله مؤخرًا',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.zero,
              height: MediaQuery.of(context).size.height * 0.2,
              child: PageView(
                reverse: true,
                padEnds: false,
                controller: PageController(
                  initialPage: 1,
                  viewportFraction: 0.48,
                ),
                scrollDirection: Axis.horizontal,
                children: [
                  addedlatley(context, () {
                    Get.to(const Course_screen());
                  }),
                  addedlatley(context, () {
                    Get.to(const Course_screen());
                  }),
                  addedlatley(context, () {
                    Get.to(const Course_screen());
                  }),
                  addedlatley(context, () {
                    Get.to(const Course_screen());
                  }),
                  addedlatley(context, () {
                    Get.to(const Course_screen());
                  }),
                  addedlatley(context, () {
                    Get.to(const Course_screen());
                  }),
                  addedlatley(context, () {
                    Get.to(const Course_screen());
                  }),
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
                      child: const Text(
                        'المزيد',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 5, top: 5),
                  child: Text(
                    'كورسات قد تهمك',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'تم وضع افضل الكورسات بنائا على اهماماتك',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            SizedBox(
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
                      child: const Text(
                        'المزيد',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 5, top: 5),
                  child: Text(
                    'كورسات المواد الاساس',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: double.infinity,
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
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: const Color(0xFF007CFF).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  margin: const EdgeInsets.only(left: 12),
                                  child: Text("تكامل مبتدئين",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .shortestSide *
                                              0.03,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'normalMyFont'))),
                            ),
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
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.centerRight,
                          height: 54,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF007CFF).withOpacity(0.4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.centerRight,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  margin: const EdgeInsets.only(left: 12),
                                  child: Text("تكامل متقدم",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .shortestSide *
                                              0.03,
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
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 54,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF007CFF).withOpacity(0.4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.centerRight,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  margin: const EdgeInsets.only(left: 12),
                                  child: Text("اساسيات طيران",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .shortestSide *
                                              0.03,
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
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 54,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF007CFF).withOpacity(0.4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.centerRight,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  margin: const EdgeInsets.only(left: 12),
                                  child: Text("مبادئ كيمياوي",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .shortestSide *
                                              0.03,
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
                      ),
                    ],
                  )
                ],
              ),
            ),
            line(),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'اكمل من حيث انتهيت',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [],
            ),
            line(),
            BottomAppBar(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    under_appbar_icons('assets/icons/underappbar_account.svg',
                        () {
                      Get.to(const Profile_screen());
                    }),
                    under_appbar_icons(
                        'assets/icons/underappbar_mycourses.svg', () {}),
                    under_appbar_icons(
                        'assets/icons/underappbar_the_collage.svg', () {}),
                  ]),
            ),
          ],
        ),
      )),
    );
  }
}

List<String> thislist = [
  'صباحي',
  'مسائي',
];
