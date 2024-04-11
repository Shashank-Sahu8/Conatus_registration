import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:webapp/model/model1.dart';

Future<bool> registerUserWithApiEndpoint(User userData) async {
  try {
    Map<String, dynamic> userJson = userData.toJson();
    final response = await http.post(
      Uri.parse('https://registration-3.onrender.com'),
      body: jsonEncode(userJson),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 401) {
      print('API Response: ${response.body}');
      return true;
    } else {
      print('Failed to register user: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
  } catch (e) {
    print("api error");
    print('Error registering user: $e');
    return false;
  }
}