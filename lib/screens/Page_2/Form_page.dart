import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:webapp/screens/Page_2/Widgets/container1.dart';

class Form_page extends StatefulWidget {
  const Form_page({super.key});

  @override
  State<Form_page> createState() => _Form_pageState();
}

class _Form_pageState extends State<Form_page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                container1(),
              ],
            ),
          )
      ),
    );
  }
}
