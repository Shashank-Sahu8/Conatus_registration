import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:webapp/Page_2/Form_page.dart';

class Container1 extends StatefulWidget {
  const Container1({super.key});

  @override
  State<Container1> createState() => _Container1State();
}

class _Container1State extends State<Container1> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile:Mobile1() ,
      desktop: Desktop1(),
    );
  }


  Widget Mobile1()
  {
    return Container(
      child: Center(
        child: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Form_page()));},child: Text("Register Now"),),
      ),
    );
  }

  Widget Desktop1()
  {
    return Container(
      child: Center(
        child: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Form_page()));},child: Text("Register Now"),),
      ),
    );
  }
}
