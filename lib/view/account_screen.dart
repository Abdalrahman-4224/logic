// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:logic_study/widgets/account_cards.dart';

class AccountScreen extends StatefulWidget {
  static String id = '/accountscreen';
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordOldController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _reNewPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leadingWidth: 70,
        toolbarHeight: 40,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          "الحساب",
          style: TextStyle(
              color: Colors.black, fontSize: 21, fontFamily: 'OMNES-BOLD'),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 35),
            alignment: Alignment.topCenter,
            child: ClipOval(
              child: Image.network(
                "https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=170667a&w=0&k=20&c=MRMqc79PuLmQfxJ99fTfGqHL07EDHqHLWg0Tb4rPXQc=",
                width: 85.0,
                height: 85.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 27,
          ),
          Divider(
            thickness: 1,
          ),
          title(text: 'الاسم'),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                customTextFromFiled(_nameController,
                    hint: 'اسم المستخدم الثلاثي'),
                SizedBox(
                  height: 10,
                ),
                title(text: 'كلمة المرور'),
                customTextFromFiled(_passwordOldController,
                    hint: 'كلمة المرور القديمة'),
                SizedBox(
                  height: 5,
                ),
                customTextFromFiled(_newPasswordController,
                    hint: 'كلمة المرور الجديدة'),
                SizedBox(
                  height: 5,
                ),
                customTextFromFiled(_reNewPasswordController,
                    hint: 'اعد كتابة كلمة المرور الجديدة'),
              ],
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Container(
            height: 42,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Color(0xFFF05251),
                borderRadius: BorderRadius.circular(8)),
            child: Text("حذف الحسابِ",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'normalMyFont',
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Text(
                  "حذف الحساب يعني أنه سيتم حذف كل الاشتراكات و بيانات الحساب و كل ما يتعلق بهِ",
                  style: TextStyle(
                      fontSize: 8,
                      fontFamily: 'normalMyFont',
                      color: Color(0xFFF05251),
                      fontWeight: FontWeight.bold))),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
