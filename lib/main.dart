import 'package:flutter/material.dart';
import 'package:webapp/Src/Pages/description.dart';

import 'Src/Pages/splash_screen.dart';
import 'Src/Pages/thanks.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const start()
    );
  }
}

class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    // User teamdetails=User(teamname: 'teamc.text',name: ['namec1.text'], email: ['mailc1.text'], contactNumber: [int.parse('98')], gender: ['genderc1'], studentId: ['stdc1.text'], residency: ['resc1'], branch: ['branchc1'], currentYear: [int.parse('87')], token: "empty");
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:splash_screen()// Member3(teamdetails: teamdetails,),
    );
  }
}
