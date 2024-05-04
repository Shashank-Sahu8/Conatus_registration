import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webapp/Src/Registration/Member3/Widgets/form_2.dart';

import '../../../model/model1.dart';
import '../Leader/widgets/poster.dart';

class Member3 extends StatefulWidget {
  User teamdetails;
   Member3({super.key,required this.teamdetails});

  @override
  State<Member3> createState() => _Member3State();
}

class _Member3State extends State<Member3> {
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
            child: form_2(teamdetails: widget.teamdetails,)
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
              child: form_2(teamdetails: widget.teamdetails,)
          ),
        ],
      ),
    );
  }
}
