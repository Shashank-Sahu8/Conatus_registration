import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:webapp/model/model1.dart';

Future<void> registerUserWithApiEndpoint(User userData) async {
  try {
    Map<String, dynamic> userJson = userData.toJson();
    final response = await http.post(
      Uri.parse('https://registration-3.onrender.com'),
      body: jsonEncode(userJson),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print('API Response: ${response.body}');
    } else {
      print('Failed to register user: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error registering user: $e');
  }
}