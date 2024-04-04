import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:webapp/Utils/Colour.dart';
import 'package:webapp/Utils/constants.dart';

class container1 extends StatefulWidget {
  const container1({super.key});

  @override
  State<container1> createState() => _container1State();
}

class _container1State extends State<container1> {
  final namec =TextEditingController();
  String branchc="empty";
  final stdc =TextEditingController();
  String yearc ="empty";
  final mailc =TextEditingController();
  final phonec =TextEditingController();
  String scholarc ="empty";
  ScrollController _scrollController = ScrollController();
  final formfield = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Mobile1(),
      desktop: Desktop1(),
    );
  }

  // MOBILE VIEW

  Widget Mobile1()
  {
    return Container(
      height: h!,
      color: appcolor.secondary,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          child: Column(
            children: [
              Container(
                width: w!,
                height: h! /5.0,
                color: appcolor.tertary,
              ),
              Expanded(
                child: Container(
                  width: w,height: h,
                  child: similarform(),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: (){setState(() {
                        namec.clear();branchc="empty";yearc="empty";scholarc="empty";stdc.clear();mailc.clear();phonec.clear();
                      });}, child: Text("Reset")),
                      ElevatedButton(onPressed: (){}, child: Text("Submit"))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  //  DESKTOP VIEW

  Widget Desktop1()
  {
    return Container(height: h,width: w,
      color: appcolor.secondary,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          child: Row(
            children: [
              Container(
                width: w! /4.0,
                color: appcolor.tertary,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: h,
                        width: w,
                        child: similarform(),
                      ),
                    ),
                
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(onPressed: (){setState(() {
                              namec.clear();branchc="empty";yearc="empty";scholarc="empty";stdc.clear();mailc.clear();phonec.clear();
                            });}, child: Text("Reset")),
                            ElevatedButton(onPressed: (){}, child: Text("Submit"))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


  Widget similarform()
  {
    return Container(
      color: Colors.white,
      child: Form(
        key: formfield,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name :",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  width: w!/1.5,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.grey, width: 1.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: namec,
                      decoration: const InputDecoration(
                          hintText: "User Name",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 17),
                          focusColor: Color(0xff8F57FF),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox
                  (
                  height: 8,
                ),


                Text(
                  "Select Branch :",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  width: w!/1.5,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.grey, width: 1.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton(
                    underline: Container(),
                    isExpanded: true,
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(branchc=="empty"?"Select Branch":branchc),
                    ),
                      onChanged: (newValue){setState(() {
                        branchc=newValue.toString();
                      });}, items: branch.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),),
                ),

              const SizedBox
                (
                height: 8,
              ),

                Text(
                  "Select Year :",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  width: w!/1.5,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.grey, width: 1.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton(
                    underline: Container(),
                    isExpanded: true,
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(yearc=="empty"?"Select Year":yearc),
                    ),
                    onChanged: (newValue){setState(() {
                      yearc=newValue.toString();
                    });}, items: year.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),),
                ),

                const SizedBox
                  (
                  height: 8,
                ),

                Text(
                  "Student Number :",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  width: w!/1.5,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.grey, width: 1.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: stdc,
                      decoration: const InputDecoration(
                          hintText: "Student Number",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 17),
                          focusColor: Color(0xff8F57FF),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox
                  (
                  height: 8,
                ),



                Text(
                  "Email :",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  width: w!/1.5,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.grey, width: 1.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller:mailc,
                      decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 17),
                          focusColor: Color(0xff8F57FF),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox
                  (
                  height: 8,
                ),



                Text(
                  "Phone Number :",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  width: w!/1.5,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.grey, width: 1.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: phonec,
                      decoration: const InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 17),
                          focusColor: Color(0xff8F57FF),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox
                  (
                  height: 8,
                ),


                Text(
                  "Scholar Type :",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  width: w!/1.5,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.grey, width: 1.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton(
                    underline: Container(),
                    isExpanded: true,
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(scholarc=="empty"?"Select":scholarc),
                    ),
                    onChanged: (newValue){setState(() {
                      scholarc=newValue.toString();
                    });}, items: scholar.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),),
                ),

                const SizedBox
                  (
                  height: 8,
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
