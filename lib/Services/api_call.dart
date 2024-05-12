import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:webapp/model/model1.dart';

import '../config.dart';

Future<String> registerUserWithApiEndpoint(User userData) async {
  try {
    Map<String, dynamic> userJson = userData.toJson();
    final response = await http.post(
      Uri.parse(AppConfig.key),
      body: jsonEncode(userJson),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.statusCode==200)
    {
      return 'true';
    }
    else if((response.statusCode == 401)) {
      print(response.body);
      return "Something went wrong";
    }
    else if (response.statusCode == 402) {
      print(response.body);
      return "already";
    }
    else
      {
        print(response.body);
        return "Something went wrong";
      }
  } catch (e) {
    print(e.toString());
    return "Something went wrong";
  }
}