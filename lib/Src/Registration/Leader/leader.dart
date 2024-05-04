import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webapp/Src/Registration/Leader/widgets/poster.dart';
import 'package:webapp/Src/description.dart';

import 'widgets/from_L.dart';

class Leader extends StatefulWidget {
  const Leader({super.key});

  @override
  State<Leader> createState() => _LeaderState();
}

class _LeaderState extends State<Leader> {
  bool isdesktop(BuildContext context)=>MediaQuery.of(context).size.width>=600;
  bool ismobile(BuildContext context)=>MediaQuery.of(context).size.width<600;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031148),
        body: MediaQuery.of(context).size.width<600?mobile():desktop()
    );
  }

  Widget desktop()
  {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width/4,
          child: poster(),
        ),

        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width/(4/3),
            child: form_l()
        )
      ],
    );
  }

  Widget mobile()
  {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Epoch Of Coginition",textAlign: TextAlign.center,style: GoogleFonts.brunoAceSc(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: FittedBox(fit: BoxFit.scaleDown,child: Image.asset("assets/robot.png",fit: BoxFit.scaleDown,height: 380,width: 230,)),

                ),
              ),)
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height,
              child: form_l()
          ),
        ],
      ),
    );
  }
}
