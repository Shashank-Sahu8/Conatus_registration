import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webapp/Src/Pages/description.dart';

class thanks extends StatefulWidget {
  String mail;String name;
   thanks({super.key,required this.name,required this.mail});

  @override
  State<thanks> createState() => _thanksState();
}

class _thanksState extends State<thanks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: true,
      backgroundColor:  Color(0xff031148),
      body: Center(
        child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(image: AssetImage("assets/topleftill.png"),fit: BoxFit.cover,height: 100,),
                    Image(image: AssetImage("assets/topill.png"),fit: BoxFit.cover,height: 100,)
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(image: AssetImage("assets/bottomleftill.png"),height: 100,),
                    Image(image: AssetImage("assets/bottomrigill.png"),height: 100,)
                  ],
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width>800?60:40.0,right: 40,top: 40,bottom: 40),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Image(image: AssetImage("assets/Conatus Logo.png"),fit: BoxFit.cover,height: 100,),
                  ),
                  Text("Epoch Of Cognition",textAlign: TextAlign.center,style: GoogleFonts.brunoAceSc(fontWeight: FontWeight.w600,fontSize: 35,color: Colors.white),),
                  Expanded(child: SizedBox(height: 50,)),
                  Text("Successfully registered 👍",style: GoogleFonts.montserrat(color: Colors.white,fontSize:20,fontWeight:FontWeight.w700),),
                  Expanded(child: SizedBox(height: 50,)),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18),
                    child: Text("Thank you ${widget.name}, for registering. Confirmation emails have been sent to ${widget.mail} and  the email addresses of your other team members.",textAlign: TextAlign.center,style: GoogleFonts.montserrat(color:Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),
                  ),
                  Expanded(child: SizedBox(height: 50,)),
                  ElevatedButton(onPressed: (){Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>main_page()));}, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back,color: Color(0xff031148),),
                        SizedBox(width: 1,),
                        Text("Get Back",style: GoogleFonts.montserrat(color: Color(0xff031148),fontSize: 18,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),style: ElevatedButton.styleFrom(maximumSize: Size(180, 70),elevation: 200,backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
