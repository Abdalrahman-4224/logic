import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:logic_study/view/home_screen.dart';
import 'package:flutter/material.dart';

//  Services
class AuthService {
  Future<bool> loginUser(String email, String password) async {
    final url =
        'https://example.com/api/login'; // Replace with your API endpoint
    final response = await http.post(
      Uri.parse(url),
      body: {
        'email': email,
        'password': password,
      },
    );
    // Handle the response
    if (response.statusCode == 200) {
      // Successful login
      return true;
    } else {
      // Handle specific status codes or display a general error message
      if (response.statusCode == 401) {
        // Unauthorized error
        // Handle unauthorized error
      } else {
        // Other error codes
        // Extract and display the error message from the response body
        String errorMessage = parseErrorMessage(response.body);
        throw errorMessage; // Throw an exception to indicate login failure
      }
    }
    return false;
  }

  String parseErrorMessage(String responseBody) {
    // Implement your parsing logic here to extract the error message
    // from the response body and return it as a string
    // You may need to adjust this based on the structure of your API response
    return 'Failed to log in. Please try again.';
  }
}
