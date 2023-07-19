import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logic_study/models/branches_model.dart';
import 'package:logic_study/constant.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:logic_study/view/login_screen.dart';

class BranchesServices {
  FlutterSecureStorage securestorage = FlutterSecureStorage();

  Future<List> fetchBranches() async {
    final url = Uri.parse('$api/branch');
    final token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFiZDFAZ21haWwuY29tIiwidXNlcklkIjoiNjRiNzA1MjBiZjE0YTY3YTBmMzdhMWE4Iiwicm9sZSI6IlVzZXIiLCJpYXQiOjE2ODk3MTYwMDEsImV4cCI6MTY4OTk3NTIwMX0.xGRMiFzHqpT6WFF2BVF9s51_FLwbhskiGCBD1hQmsFg";
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data;
    }
    throw Exception('Failed to load branches');
  }
}
















//*********************************************************************** */
// import 'dart:convert';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:logic_study/models/branches_model.dart';
// import 'package:logic_study/constant.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:logic_study/view/login_screen.dart';

// class BranchesServices {
//   FlutterSecureStorage securestorage = FlutterSecureStorage();

//   Future<List<BranchesModel>?> fetchBranches() async {
//     final url = Uri.parse('$api/branch');
//     final token =
//         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFiZDFAZ21haWwuY29tIiwidXNlcklkIjoiNjRiNzA1MjBiZjE0YTY3YTBmMzdhMWE4Iiwicm9sZSI6IlVzZXIiLCJpYXQiOjE2ODk3MTYwMDEsImV4cCI6MTY4OTk3NTIwMX0.xGRMiFzHqpT6WFF2BVF9s51_FLwbhskiGCBD1hQmsFg";
//     final headers = {'Authorization': 'Bearer $token'};
//     final response = await http.get(url, headers: headers);

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body) as List<dynamic>;
//       final branches =
//           data.map((dynamic json) => BranchesModel.fromjson(json)).toList();
//       return branches;
//     } else if (response.statusCode == 401) {
//       print('error 401');
//       Get.to(login_screen());
//       securestorage.delete(key: 'email');
//       securestorage.delete(key: 'password');
//       throw Exception('Unauthorized: Please log in again');
//     } else {
//       print(response.body);
//       print('---------${response.statusCode}--------- branches_services.dart');
//       throw Exception('Failed to load branches');
//     }
//   }
// }









