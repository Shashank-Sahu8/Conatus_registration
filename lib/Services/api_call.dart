import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:webapp/model/model1.dart';
import 'package:webapp/config.dart';

Future<bool> registerUserWithApiEndpoint(User userData) async {
  try {
    Map<String, dynamic> userJson = userData.toJson();
    print("==="+userData.token+"+++");
    final response = await http.post(
      Uri.parse("https://registration-w4hb.onrender.com/registeration"),
      body: jsonEncode(userJson),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.statusCode==200)
    {
      print("success");
      print("status code for success: ${response.statusCode}");
      return true;
    }
    else if((response.statusCode == 401)) {
      print("token required");
      print('Failed to register user: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
    else if (response.statusCode == 402) {
      print('API Response: already registered ${response.body}');
      return true;
    }
    else
      {
        print('Response body: ${response.statusCode}');
        return false;
      }
  } catch (e) {
    print("api error");
    print('Error registering user: $e');
    return false;
  }
}