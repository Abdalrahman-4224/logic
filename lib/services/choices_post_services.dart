import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/view/homepage_screen/temprorary_hompage_screen.dart';
import 'package:logic_study/view/login_screen.dart';

class ChoicesServices {
  FlutterSecureStorage secureStorage = FlutterSecureStorage();
  Future<bool> postchoices(String CId, String BId, String UId) async {
    final url = Uri.parse('$api/colleage');
    final token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFiZEBnbWFpbC5jb20iLCJ1c2VySWQiOiI2NGI2OWNhYWYzOGI1OGM3Mjk0MDRlYTMiLCJ1c2VybmFtZSI6IkFiZF9hbHJhaG1hbjYyNiIsInJvbGUiOiJVc2VyIiwiaWF0IjoxNjg5ODM3MjIwLCJleHAiOjE2OTAwOTY0MjB9.tsgNm8Ab6UoMtACnvp5HUY0e4RhLlLoXsD8u18P2tJg";
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.post(url, headers: headers, body: {
      'universityid': UId,
      'collegeid': CId,
      'branchesid': BId,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      if (response.statusCode == 401) {
        Get.to(login_screen());

        secureStorage.delete(key: 'email');
        secureStorage.delete(key: 'password');
      } else {
        print('---------${response.statusCode}--------- choices_post_services');
      }
      return false;
    }
  }
}
