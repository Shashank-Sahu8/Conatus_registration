import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:webapp/model/model1.dart';



Future<bool> registerUserWithApiEndpoint(User userData) async {
  try {
    Map<String, dynamic> userJson = userData.toJson();
    final response = await http.post(
      Uri.parse('https://registration-w4hb.onrender.com/user/Registeration'),
      body: jsonEncode(userData),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 402) {
      print('API Response: ${response.body}');
      return true;
    } else if((response.statusCode == 401)) {
      print('Failed to register user: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
    else
      {
        print("status code error ${response.statusCode}");
        return false;
      }
  } catch (e) {
    print("api error");
    print('Error registering user: $e');
    return false;
  }
}