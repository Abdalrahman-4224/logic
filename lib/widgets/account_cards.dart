import 'package:flutter/material.dart';

title({text = ""}) {
  return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child:
          Text(text, style: const TextStyle(fontSize: 18, fontFamily: 'boldMyFont')));
}

customTextFromFiled(controller, {hint, isPassword = false}) {
  return Container(
    height: 42,
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Theme(
      data: ThemeData(
        primaryColor: Colors.grey,
        primaryColorDark: Colors.grey,
      ),
      child: TextField(
        style: const TextStyle(
            fontSize: 16,
            fontFamily: 'normalMyFont',
            fontWeight: FontWeight.bold),
        obscureText: isPassword,
        controller: controller,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5.0),
            hintTextDirection: TextDirection.rtl,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )),
            hintText: hint),
      ),
    ),
  );
}
