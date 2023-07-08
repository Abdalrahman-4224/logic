// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// contentBox(context) {
//   return Stack(
//     children: <Widget>[
//       Container(
//         padding: EdgeInsets.only(
//             left: Constants.padding,
//             top: Constants.avatarRadius + Constants.padding,
//             right: Constants.padding,
//             bottom: Constants.padding),
//         margin: EdgeInsets.only(top: Constants.avatarRadius),
//         decoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(Constants.padding),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
//             ]),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               widget.title,
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//               widget.descriptions,
//               style: TextStyle(fontSize: 14),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 22,
//             ),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: FlatButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text(
//                     widget.text,
//                     style: TextStyle(fontSize: 18),
//                   )),
//             ),
//           ],
//         ),
//       ),
//       Positioned(
//         left: 20,
//         right: 20,
//         child: CircleAvatar(
//           backgroundColor: Colors.transparent,
//           radius: 45,
//           child: ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(45)),
//               child: Image.asset("assets/model.jpeg")),
//         ),
//       ),
//     ],
//   );
// }

Future<dynamic> modalbottomsheet_choices(
  BuildContext context, {
  required String title,
  required List list,
}) {
  return showModalBottomSheet(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 20, top: 45 + 20, right: 20, bottom: 20),
              margin: EdgeInsets.only(top: 45, right: 15, left: 15, bottom: 15),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                my_text_normal_bold(
                    title,
                    MediaQuery.of(context).size.shortestSide * 0.07,
                    Colors.black),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            color: Color(0xffe9e9e9),
                            height: MediaQuery.of(context).size.height * 0.065,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: TextButton(
                              onPressed: () {},
                              child: my_text_normal_bold(
                                  '${list[index]}',
                                  MediaQuery.of(context).size.shortestSide *
                                      0.05,
                                  Colors.black),
                            )),
                      );
                    },
                  ),
                )
              ]),
            ),
            Positioned(
              left: 20,
              right: 20,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 55,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(55)),
                    child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Color(0xffe9e9e9),
                        child: SvgPicture.asset("assets/icons/logo.svg"))),
              ),
            ),
          ],
        );
      });
}

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
      Expanded(child: rowbutton('وصف', () {}, context, '')),
      SizedBox(
        height: 5,
      ),
      Expanded(child: rowbutton('وصف', () {}, context, '')),
    ],
  );
}

Directionality rowbutton(
    String? des, VoidCallback pressme, BuildContext context, String image) {
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
              child: Image.network(
                image,
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

ClipRRect othersbutton(BuildContext context,
    {required title, required VoidCallback onpress, required String imageurl}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: GestureDetector(
      onTap: onpress,
      child: Container(
        color: Color(0xFFD3D3D3),
        margin: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.13,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageurl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: my_text_normal('$title', 15, Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

GestureDetector under_appbar_icons(String icon, VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: SvgPicture.asset(icon),
  );
}

// GestureDetector basiccourses({String? title, String? imagetitle}) {
//   return GestureDetector(
//       onTap: () {},
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//               alignment: Alignment.centerRight,
//               width: 90,
//               margin: const EdgeInsets.only(left: 12),
//               child: Text("$title",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'normalMyFont'))),
//           const SizedBox(
//             width: 9,
//           ),
//           CircleAvatar(
//             radius: 24,
//             backgroundColor: Color(0xFFD3D3D3),
//             child: Image.asset('$imagetitle'),
//           )
//         ],
//       ));
// }

Directionality my_text_normal(String text, double size, Color color) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Text(
      text,
      style: TextStyle(fontFamily: 'OMNES', fontSize: size, color: color),
    ),
  );
}

Text my_text_normal_bold(String text, double size, Color color) {
  return Text(
    text,
    style: TextStyle(fontFamily: 'OMNES-BOLD', fontSize: size, color: color),
  );
}



// 'assets/image_needed/unifersity_image.png'
