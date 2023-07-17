import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/view/login_screen.dart';
import 'package:get/get.dart';

//  Services
class AuthService {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Future<bool> loginUser(String email, String password) async {
    final url = Uri.parse('$api/login'); // Replace with your API endpoint
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );
    // Handle the response
    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
      final String bearerToken = jsondata['token'];
      secureStorage.write(key: 'bearerToken', value: bearerToken);

      // Successful login
      return true;
    } else {
      // Handle specific status codes or display a general error message
      if (response.statusCode == 401) {
        // Unauthorized error
        // Handle unauthorized error
        // TODOLG
      } else {
        print('---------${response.statusCode}--------- registration_service');

        // Other error codes
        // Extract and display the error message from the response body
        String errorMessage = parseErrorMessage(response.body);
        throw errorMessage; // Throw an exception to indicate login failure
      }
      return false;
    }
  }

  String parseErrorMessage(String responseBody) {
    // Implement your parsing logic here to extract the error message
    // from the response body and return it as a string
    // You may need to adjust this based on the structure of your API response
    return 'Failed to log in. Please try again.';
  }
}
