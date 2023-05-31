// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logic_study/view/video_screen.dart';

Directionality addedlatley(BuildContext context, VoidCallback ontap) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () {
          ontap;
        },
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  // height: MediaQuery.of(context).size.height * 0.16,
                  // width: MediaQuery.of(context).size.width * 0.3,

                  child: Flexible(
                      child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/image_needed/construction-site.png'),
              ))),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("مقاومة مواد - اسئلة فاينل",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'normalMyFont',
                            fontWeight: FontWeight.bold)),
                    Text("تم رفعة امس",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'normalMyFont')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Column coursesmyimportant(BuildContext context) {
  return Column(
    children: [
      Expanded(child: rowbutton('وصف', () {}, context)),
      SizedBox(
        height: 5,
      ),
      Expanded(child: rowbutton('وصف', () {}, context)),
    ],
  );
}

Directionality rowbutton(
    String? des, VoidCallback pressme, BuildContext context) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: GestureDetector(
      onTap: pressme,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/image_needed/E6V5.png',
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
          ),
          Expanded(
              child: Text(
            '$des',
            style: TextStyle(color: Colors.black),
          )),
        ],
      ),
    ),
  );
}

Padding line() {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      height: 1,
      color: Colors.grey,
      width: double.infinity,
    ),
  );
}

SizedBox space() {
  return SizedBox(
    height: 10,
    width: 2,
  );
}

Padding othersbutton(
    String? des, VoidCallback pressme, String myImage, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: GestureDetector(
      onTap: pressme,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.13,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  myImage,
                ),
              ),
              Text(
                '$des',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

GestureDetector underappbar_icons(String icon) {
  return GestureDetector(
    child: SvgPicture.asset(icon),
    onTap: () {},
  );
}

GestureDetector basiccourses({String? title, String? imagetitle}) {
  return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.centerRight,
              width: 90,
              margin: const EdgeInsets.only(left: 12),
              child: Text("$title",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'normalMyFont'))),
          const SizedBox(
            width: 9,
          ),
          CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xFFD3D3D3),
            child: Image.asset('$imagetitle'),
          )
        ],
      ));
}

Text my_text_normal(String text, double size, Color color) {
  return Text(
    text,
    style: TextStyle(fontFamily: 'OMNES', fontSize: size, color: color),
  );
}

Text my_text_normal_bold(String text, double size, Color color) {
  return Text(
    text,
    style: TextStyle(fontFamily: 'OMNES-BOLD', fontSize: size, color: color),
  );
}



// 'assets/image_needed/unifersity_image.png'
