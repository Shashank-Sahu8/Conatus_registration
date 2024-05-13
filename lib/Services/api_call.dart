import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:webapp/model/model1.dart';

import '../config.dart';

Future<String> registerUserWithApiEndpoint(User userData) async {
  try {
    Map<String, dynamic> userJson = userData.toJson();
    final response = await http.post(
      Uri.parse(AppConfig.api),
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
      return "Something went wrong i";
    }
    else if (response.statusCode == 402) {
      print(response.body);
      return "already";
    }
    else
      {
        print(response.body);
        return "Something went wrong 223 ${response.statusCode}";
      }
  } catch (e) {
    print(e.toString());
    return "Something went wrong no api hit";
  }
}