import 'package:flutter/material.dart';
import 'package:webapp/Page_1/Widgets/Container1.dart';
import 'package:webapp/Utils/constants.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Container1(),

            ],
          ),

        ),
      ),
    );
  }
}
