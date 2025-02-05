import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webapp/Src/Registration/Leader/leader.dart';

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {

  @override
  Widget build(BuildContext context) {
    Duration difference = DateTime(2024, 5, 16).difference(DateTime.now());
    int days = difference.inDays;
    int hours = difference.inHours.remainder(24);
    int minutes = difference.inMinutes.remainder(60);

    return Scaffold(
        backgroundColor: Color(0xff031148),

      body: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0,top: 5),
                child: Image(image: AssetImage("assets/Conatus Logo.png"),width: 100,),
              ),
            ],
          )],),
          MediaQuery.of(context).size.width<600?SizedBox(): Image(image: AssetImage("assets/illustration.png"),height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: AssetImage("assets/topleftill.png"),height: MediaQuery.of(context).size.width>600?150:70,),
                  Image(image: AssetImage("assets/topill.png"),height: MediaQuery.of(context).size.width>600?150:70)
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(fit: BoxFit.scaleDown, child: Padding(
                  padding: const EdgeInsets.only(top: 50.0,left: 25.0,right: 25.0),
                  child: Text("Epoch Of Congnition",textAlign: TextAlign.center,style: GoogleFonts.brunoAceSc(fontWeight: FontWeight.w700,fontSize: 50,color: Colors.white),),
                ),
                ),
                 Text(
                '${days}d : ${hours}h : ${minutes}m',
                  style: GoogleFonts.orbitron(
                    textStyle: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(width: 1,),

                ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Leader()));
                    }
                  ,child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Register",style: TextStyle(color: Color(0xff031148) ,fontSize: 20,fontWeight: FontWeight.w700),),
                  ),style: ElevatedButton.styleFrom(elevation: 100,backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),),

                Container(
                  decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.only(topRight:Radius.circular(50),topLeft:Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("INSTRUCTIONS",style: TextStyle(fontSize: 24,fontWeight:  FontWeight.w600),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("\u2022 The team must be of 3 members.",style:GoogleFonts.montserrat(fontWeight:FontWeight.w500,fontSize:16,),),
                        Text("\u2022 College email must be used for the registration.",style:GoogleFonts.montserrat(fontWeight:FontWeight.w500,fontSize:16,),),
                        Text("\u2022 Only team leader has to fill the registration form.",style:GoogleFonts.montserrat(fontWeight:FontWeight.w500,fontSize:16,),),
                        Text("\u2022The team name must have a minimum 4 characters without the use of special characters like(-,_,@,etc).",style:GoogleFonts.montserrat(fontWeight:FontWeight.w500,fontSize:16,),),

                      ],
                    ),
                  ),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}
