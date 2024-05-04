import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class poster extends StatelessWidget {
  const poster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031148),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              FittedBox(fit: BoxFit.scaleDown, child: Padding(
                padding: const EdgeInsets.only(top: 28.0,left: 25.0,right: 25.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Epoch Of",textAlign: TextAlign.center,style: GoogleFonts.brunoAceSc(fontWeight: FontWeight.w600,fontSize: 35,color: Colors.white),),Text("Congnition",textAlign: TextAlign.center,style: GoogleFonts.brunoAceSc(fontWeight: FontWeight.w600,fontSize: 35,color: Colors.white),)],
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0,left: 25.0,right: 25.0),
                child: Text("Learn | Improvise | Grow",style: GoogleFonts.montserrat(fontSize:16,color:Colors.white),),
              )
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: FittedBox(fit: BoxFit.scaleDown,child: Image.asset("assets/robot.png",fit: BoxFit.scaleDown,height: 400,width: 350,)),

              ),
            ),
          )
        ],
      )
    );
  }
}
