import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(fit: BoxFit.scaleDown, child: Padding(
                padding: const EdgeInsets.only(top: 28.0,left: 25.0,right: 25.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Epoch Of",textAlign: TextAlign.center,style: GoogleFonts.brunoAceSc(fontWeight: FontWeight.w600,fontSize: 35,color: Colors.white),),Text("Congnition",textAlign: TextAlign.center,style: GoogleFonts.brunoAceSc(fontWeight: FontWeight.w600,fontSize: 35,color: Colors.white),)],
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0,left: 25.0,right: 25.0),
                child: Text("Learn | Improvise | Grow",style: GoogleFonts.montserrat(fontSize:15,color:Colors.white),),
              )
            ],
          ),
          Expanded(child: SizedBox(height: 150)),
          Expanded(child: Image(image: AssetImage("assets/robo_rev.png")))
        ],
      )
    );
  }
}
