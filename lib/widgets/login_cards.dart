// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:logic_study/controller/creat_account_controller.dart';
import 'cards.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

Center mytextfield(BuildContext context,
    {required String hinttext,
    required IconData icon,
    required ValueSetter onchanged}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            onChanged: onchanged, // ((String value) => cemail.text = value)
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: Icon(icon),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                hintText: hinttext,
                hintStyle: TextStyle(fontFamily: 'OMNES')),
          ),
        ),
      ),
    ),
  );
}

class passwordCard_1 extends StatelessWidget {
  String hintext;
  ValueSetter<String> onchanged;
  final creat_account_controller _controller = creat_account_controller();
  passwordCard_1({
    super.key,
    required this.hintext,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Obx(
                () => TextField(
                  onChanged: onchanged,
                  obscureText: _controller.obscureText.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline),
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                    hintText: hintext,
                    hintStyle: TextStyle(fontFamily: 'OMNES'),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _controller.obscureText.value =
                            !_controller.obscureText.value;
                      },
                      child: Icon(
                        _controller.obscureText.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

Center blue_login_button(
    BuildContext context, String text, VoidCallback ontap) {
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.049,
          width: MediaQuery.of(context).size.width * 0.73,
          color: Color(0xff0e4f8b),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'OMNES-BOLD'),
          )),
        ),
      ),
    ),
  );
}

Padding google_icon(BuildContext context, VoidCallback onpressed) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Center(
        child: IconButton(
      iconSize: MediaQuery.of(context).size.height * 0.07,
      onPressed: onpressed,
      icon: SvgPicture.asset(
        'assets/icons/google_icon.svg',
      ),
    )),
  );
}

Center or_byusing(BuildContext context) {
  return Center(
    child: Stack(children: [
      line(),
      Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.02,
          width: MediaQuery.of(context).size.width * 0.16,
          color: Color(0xffefeff4),
          child: Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'أو بأستخدام',
                style: TextStyle(fontFamily: 'OMNES', fontSize: 10),
              ),
            ),
          ),
        ),
      )
    ]),
  );
}


// Center passowrd_card(BuildContext context) {
//   return Center(
//     child: Container(
//       height: MediaQuery.of(context).size.height * 0.05,
//       width: MediaQuery.of(context).size.width * 0.9,
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: TextField(
//           obscureText: _obscureText,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             prefixIcon: Icon(Icons.lock_outline),
//             contentPadding: EdgeInsets.symmetric(vertical: 8.0),
//             hintText: 'كلمة المرور',
//             hintStyle: TextStyle(fontFamily: 'OMNES'),
//             suffixIcon: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _obscureText = !_obscureText;
//                 });
//               },
//               child: Icon(
//                 _obscureText ? Icons.visibility : Icons.visibility_off,
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
