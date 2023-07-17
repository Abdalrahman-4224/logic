import 'dart:convert';
import 'dart:io';

import 'package:logic_study/models/branches_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:logic_study/constant.dart';
import 'package:http/http.dart' as http;
import 'package:logic_study/view/homepage_screen/home_screen.dart';
import 'package:logic_study/view/login_screen.dart';
import 'package:logic_study/widgets/cards.dart';

class BranchesServices {
  FlutterSecureStorage securestorage = FlutterSecureStorage();
  Future<RxList<BranchesModel>?> fetchBranches() async {
    final url = Uri.parse('$api/branchs');
    final token = await securestorage.read(key: 'token');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as RxList;
        final branches =
            data.map((dynamic json) => BranchesModel.fromjson(json)).toList();
        final branchRx = RxList<BranchesModel>(branches);
        return branchRx;
      } else {
        if (response.statusCode == 401) {
          print('error 401');
          Get.to(login_screen());
          securestorage.delete(key: 'email');
          securestorage.delete(key: 'password');
        }
        print(
            '---------${response.statusCode}--------- branches_services.dart');

        throw Exception('Failed to load branches');
      }
    } on SocketException {
      mydialog(
          title: 'خطأ في الانترنيت',
          error: "خطأ في الاتصال بالشبكة تأكد من مزود الخدمة");
    } on FormatException {
      mydialog(title: 'خطأ في الخادم ', error: "خطأ في استلام البيانات ");
    } catch (error) {
      mydialog(title: 'حصل خطأ', error: "حصل خطأ في الخادم حاول لاحقا");
    }
  }
}
