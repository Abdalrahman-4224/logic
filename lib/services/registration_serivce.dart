import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logic_study/constant.dart';

class AuthService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<bool> registerUser(
      {required String email,
      required String username,
      required String password}) async {
    String url = '$api/signup';
    final response = await http.post(Uri.parse(url), body: {
      'username': username,
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
      final String bearerToken = jsondata['token'];
      await secureStorage.write(key: 'Bearer Token', value: bearerToken);

      return true;
    } else {
      if (response.statusCode == 409) {
      } else {
        // Other error codes
        // Extract and display the error message from the response body
        String errorMessage = parseErrorMessage(response.body);
        throw errorMessage; // Throw an exception to indicate registration failure
      }
    }
    return false;
  }

  String parseErrorMessage(String responseBody) {
    //TODO Implement your parsing logic here to extract the error message
    // from the response body and return it as a string
    // You may need to adjust this based on the structure of your API response
    return 'Failed to register. Please try again.';
  }

  String extractBearerToken(String responseBody) {
    // Parse the JSON response body
    final jsonData = json.decode(responseBody);

    // Extract the Bearer token from the response
    final String bearerToken = jsonData['token'];

    return bearerToken;
  }

  void myerror(String text) => print(text);
}
