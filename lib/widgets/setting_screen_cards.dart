import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Center settingline(BuildContext context) {
  return Center(
    child: Container(
      color: Colors.black26,
      height: 1,
      width: MediaQuery.of(context).size.width * 0.9,
    ),
  );
}

GestureDetector settingbutton(String icon, String text, VoidCallback pressme) {
  return GestureDetector(
      onTap: pressme,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    icon,
                    height: 32,
                    width: 32,
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            )),
            const Padding(
              padding: EdgeInsets.all(3.0),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            )
          ],
        ),
      ));
}
