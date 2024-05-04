import 'package:flutter/material.dart';
import 'package:webapp/Src/Registration/Leader/leader.dart';

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Leader()));},child: Text("Register"),),
      ),
    );
  }
}
