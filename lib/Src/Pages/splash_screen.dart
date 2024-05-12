import 'dart:async';
import 'package:animated_typing/animated_typing.dart';
import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'description.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> main_page(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031148),
      body: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: AssetImage("assets/tl.png"),height: MediaQuery.of(context).size.width>600?300:150,),
                  Image(image: AssetImage("assets/tr.png"),height:  MediaQuery.of(context).size.width>600?300:150,)
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: AssetImage("assets/br.png"),height:  MediaQuery.of(context).size.width>600?300:150,),
                  Image(image: AssetImage("assets/bl.png"),height:  MediaQuery.of(context).size.width>600?300:150,)
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(height:120,decoration: BoxDecoration(image:DecorationImage(image: AssetImage('assets/Conatus Logo.png'))),),
          ),
          Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200,),
              Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedTyping(
                    text: 'Epoch Of ${MediaQuery.of(context).size.width<600?"\n":""} Cognition',loop: true,
                    duration: Duration(seconds: 2,),
                    style: GoogleFonts.brunoAceSc(fontWeight: FontWeight.w800,fontSize: 40,color: Colors.white)

                  ),
                ],
              ),
              SizedBox(height: 200,),
              SpinKitThreeInOut(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),),
        ],
      ),
    );
  }
}
