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
    final token = await secureStorage.read(key: 'token');
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
