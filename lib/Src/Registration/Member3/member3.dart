import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:html'as html;
import 'dart:ui_web'as ui;
import '../../../Services/api_call.dart';
import '../../../Utils/constants.dart';
import '../../../model/model1.dart';
import '../../Pages/description.dart';
import '../../Pages/thanks.dart';
import '../Widgets/poster.dart';


class Member3 extends StatefulWidget {
  User teamdetails;
   Member3({super.key,required this.teamdetails});

  @override
  State<Member3> createState() => _Member3State();
}

class _Member3State extends State<Member3> {

  final namec1=TextEditingController();
  final stdc1=TextEditingController();
  final mailc1=TextEditingController();
  final phonec1=TextEditingController();
  final formfield1= GlobalKey<FormState>();
  String branchc1="empty";
  String genderc1="empty";
  String yearc1="empty";
  String resc1="empty";
  final ScrollController _scrollController = ScrollController();
  bool isdesktop(BuildContext context)=>MediaQuery.of(context).size.width>=600;
  bool ismobile(BuildContext context)=>MediaQuery.of(context).size.width<600;
  String createdViewId = 'recaptcha_element';
  bool isLoading = false;
  bool isContainerVisible = false;

  void toggleContainerVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
    });
  }
  void lodingvisibilty() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    ui.platformViewRegistry.registerViewFactory(
      createdViewId,
          (int viewId) => html.IFrameElement()
        ..style.height = '100%'
        ..style.width = '100%'
        ..src = '/assets/recaptcha.html'
        ..style.border = 'none',
    );

    html.window.onMessage.listen((msg)   async {
      String token = msg.data;
      lodingvisibilty();
      toggleContainerVisibility();
      setState(() {
        widget.teamdetails.token=token;
      });
      if(widget.teamdetails.token!='empty')
      {
        if ( await registerUserWithApiEndpoint(widget.teamdetails)) {
         lodingvisibilty();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => thanks(name: widget.teamdetails.name[0], mail:widget.teamdetails.email[0] )));
        } else {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => main_page()));
           lodingvisibilty();
        }
      }
      else
      {
        showTopSnackBar(
          Overlay.of(context),
          SizedBox(
            height: 40,
            child: CustomSnackBar.error(
              message:
              "Please try again,Internet not conected",
              backgroundColor: Colors.blueGrey,
            ),
          ),
        );
      }

    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    body: Stack(
      children: [
        Stack(
          children: [
            MediaQuery.of(context).size.width<600?mobile():desktop(),

            Visibility(
              visible: isLoading,
              child: Container(
                color: Colors.black.withOpacity(0.2), // Transparent red
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                  child: Center(child:SpinKitCircle(

                  size: 100.0, color: Colors.white,
                ) ,),
              ),
            ),
          ],
        ),

        Visibility(
          visible: isContainerVisible,
          child: GestureDetector(
            onTap: toggleContainerVisibility,
            child: Container(
              color: Colors.black.withOpacity(0.2), // Transparent red
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Container(height:400,width:300,child: HtmlElementView(viewType: createdViewId)),
            ),
          ),
        ),
      ],
    )
    );
  }

  Widget desktop()
  {
    return  Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width/4,
          child: poster(),
        ),

        Container(color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width/(4/3),
            child:  forrm()
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
          Container(height: 220,width: MediaQuery.of(context).size.width,
            color:Color(0xff031148) ,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top:15,bottom:13),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Epoch Of Coginition",textAlign: TextAlign.center,style: GoogleFonts.brunoAceSc(fontWeight: FontWeight.w600,fontSize: 21,color: Colors.white)),
                      Expanded(child: SizedBox(height: 200,)),
                      Text("Learn | Improvise | Grow",style: GoogleFonts.montserrat(fontSize:13,color:Colors.white),),
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(image: AssetImage('assets/robot.png'),),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30.0),
            child:  Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formfield1,
                child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(fit: BoxFit.scaleDown,child: Text("Member 3 Details",style: GoogleFonts.montserrat(fontSize:isdesktop(context)==true?34:24,fontWeight:FontWeight.w700),)),
                      ],
                    ),
                    SizedBox(height:20 ,),
                    Text("Member Name",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      alignment: Alignment.center,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: namec1,
                        decoration: InputDecoration(
                          helperText: '',
                          isDense: true,
                          isCollapsed: false,
                          hintText: "User Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enert Name";
                          }
                          else if(isValidName(value.toString())==false)
                          {
                            return "Invalid Name";
                          }
                          return null;
                        },
                      ),
                    ),
                    Text("Student Number",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      alignment: Alignment.center,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: stdc1,
                        decoration: InputDecoration(
                          isDense: true,
                          helperText: '',
                          isCollapsed: false,
                          hintText: "Student Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Student Number";
                          }
                          else if(isValidStudentNumber(value)==false)
                          {
                            return "Incorrect Student Number";
                          }
                          return null;
                        },
                      ),
                    ),
                    Text("Email",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      alignment: Alignment.center,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: mailc1,
                        decoration: InputDecoration(
                          isDense: true,
                          helperText: '',
                          isCollapsed: false,
                          hintText: "Student Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty )
                          {
                            return "Enter email";
                          }
                          else if(isValidEmail(value.toString())==false)
                          {
                            return "Incorrect email";
                          }
                          return null;
                        },
                      ),
                    ),
                    Text("Mobile Number",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      alignment: Alignment.center,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: phonec1,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          isDense: true,
                          helperText: '',
                          isCollapsed: false,
                          hintText: "Contact Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffB5B5B5),
                              width: 1.8,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter phone number";
                          }
                          else if(isValidPhoneNumber(value.toString())==false)
                          {
                            return "Incorrect number";
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Branch",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                            Container(
                              width:ismobile(context)?MediaQuery.of(context).size.width/2.5:MediaQuery.of(context).size.width/3.2,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.grey, width: 1.4),
                                  borderRadius: BorderRadius.circular(8)),
                              child: DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                hint: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(branchc1=="empty"?"Select":branchc1),
                                ),
                                onChanged: (newValue){setState(() {
                                  branchc1=newValue.toString();
                                });}, items: branch.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox(width: 50,)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Year",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                            Container(
                              width:ismobile(context)?MediaQuery.of(context).size.width/2.5:MediaQuery.of(context).size.width/3.2,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.grey, width: 1.4),
                                  borderRadius: BorderRadius.circular(8)),
                              child:DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                hint: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(yearc1=="empty"?"Select Year":yearc1),
                                ),
                                onChanged: (newValue){setState(() {
                                  yearc1=newValue.toString();
                                });}, items: year.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Residence",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                            Container(
                              width:ismobile(context)?MediaQuery.of(context).size.width/2.5:MediaQuery.of(context).size.width/3.2,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.grey, width: 1.4),
                                  borderRadius: BorderRadius.circular(8)),
                              child: DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                hint: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(resc1=="empty"?"Residence":resc1,style: TextStyle(fontSize: 16),),
                                ),
                                onChanged: (newValue){setState(() {
                                  resc1=newValue.toString();
                                });}, items: scholar.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox(width: 50,)),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Gender",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),

                            Container(
                              width:ismobile(context)?MediaQuery.of(context).size.width/2.5:MediaQuery.of(context).size.width/3.2,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.grey, width: 1.4),
                                  borderRadius: BorderRadius.circular(8)),
                              child: DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                hint: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(genderc1=="empty"?"Select":genderc1),
                                ),
                                onChanged: (newValue){setState(() {
                                  genderc1=newValue.toString();
                                });}, items: gender.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: ()   {
                              if(formfield1.currentState!.validate()&&((mailc1.text.contains(stdc1.text)==false&&stdc1.text.length==7)||( mailc1.text.contains(stdc1.text.substring(0,stdc1.text.length-1))==false && stdc1.text.length==8 )))
                              {

                                showTopSnackBar(
                                  Overlay.of(context),
                                  SizedBox(
                                    height: 40,
                                    child: CustomSnackBar.error(
                                      message:
                                      "student number and email not matching",
                                      backgroundColor: Colors.blueGrey,
                                    ),
                                  ),
                                );
                              }
                              else if(formfield1.currentState!.validate()&&(branchc1 =="empty" || yearc1 =="empty" || resc1 =="empty"))
                              {
                                showTopSnackBar(
                                  Overlay.of(context),
                                  SizedBox(
                                    height: 40,
                                    child: CustomSnackBar.error(
                                      message:
                                      "Some field is missing",
                                      backgroundColor: Colors.blueGrey,
                                    ),
                                  ),
                                );
                              }
                              else if(formfield1.currentState!.validate()) {
                                widget.teamdetails.name.add(namec1.text);
                                widget.teamdetails.email.add(mailc1.text);
                                widget.teamdetails.contactNumber.add(int.parse(phonec1.text));
                                widget.teamdetails.gender.add(genderc1);
                                widget.teamdetails.studentId.add(stdc1.text);
                                widget.teamdetails.residency.add(resc1);
                                widget.teamdetails.currentYear.add(int.parse(yearc1));
                                widget.teamdetails.branch.add(branchc1);
                                toggleContainerVisibility();
                              }
                            },style: ElevatedButton.styleFrom(backgroundColor: Color(0xff031148),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0,right: 18.0,top: 12,bottom: 12),
                              child: Text("Continue",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                            )),
                      ],
                    ),
                    SizedBox(height: 40,)
                  ],
                )
            ),
          ),
          // Container(
          //     height: MediaQuery.of(context).size.height,
          //     child: form_2(teamdetails: widget.teamdetails,)
          // ),
        ],
      ),
    );
  }


  Widget forrm(){
    final wid=(MediaQuery.of(context).size.width);
    final pl=wid/12;
    final prr=wid/10;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: _scrollController,
      child:  Padding(
      padding: ismobile(context)==true? const EdgeInsets.only(left: 30.0,right: 30.0): EdgeInsets.only(left: pl,right:prr),
      child:  Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formfield1,
            child:Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(fit: BoxFit.scaleDown,child: Text("Member 3 Details",style: GoogleFonts.montserrat(fontSize:isdesktop(context)==true?34:24,fontWeight:FontWeight.w600),)),
                  ],
                ),
                SizedBox(height:20 ,),
                Text("Member Name",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  alignment: Alignment.center,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: namec1,
                    decoration: InputDecoration(
                      helperText: '',
                      isDense: true,
                      isCollapsed: false,
                      hintText: "User Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enert Name";
                      }
                      else if(isValidName(value.toString())==false)
                      {
                        return "Invalid Name";
                      }
                      return null;
                    },
                  ),
                ),
                Text("Student Number",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  alignment: Alignment.center,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: stdc1,
                    decoration: InputDecoration(
                      isDense: true,
                      helperText: '',
                      isCollapsed: false,
                      hintText: "Student Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Student Number";
                      }
                      else if(isValidStudentNumber(value)==false)
                      {
                        return "Incorrect Student Number";
                      }
                      return null;
                    },
                  ),
                ),
                Text("Email",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  alignment: Alignment.center,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: mailc1,
                    decoration: InputDecoration(
                      isDense: true,
                      helperText: '',
                      isCollapsed: false,
                      hintText: "Student Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty )
                      {
                        return "Enter email";
                      }
                      else if(isValidEmail(value.toString())==false)
                      {
                        return "Incorrect email";
                      }
                      return null;
                    },
                  ),
                ),
                Text("Mobile Number",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  alignment: Alignment.center,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: phonec1,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      isDense: true,
                      helperText: '',
                      isCollapsed: false,
                      hintText: "Contact Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xffB5B5B5),
                          width: 1.8,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter phone number";
                      }
                      else if(isValidPhoneNumber(value.toString())==false)
                      {
                        return "Incorrect number";
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Branch",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                        Container(
                          width:ismobile(context)?MediaQuery.of(context).size.width/2.5:MediaQuery.of(context).size.width/3.8,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.grey, width: 1.4),
                              borderRadius: BorderRadius.circular(8)),
                          child: DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(branchc1=="empty"?"Select Branch":branchc1),
                            ),
                            onChanged: (newValue){setState(() {
                              branchc1=newValue.toString();
                            });}, items: branch.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox(width: 50,)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Year",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                        Container(
                          width:ismobile(context)?MediaQuery.of(context).size.width/2.5:MediaQuery.of(context).size.width/3.8,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.grey, width: 1.4),
                              borderRadius: BorderRadius.circular(8)),
                          child:DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(yearc1=="empty"?"Select Year":yearc1),
                            ),
                            onChanged: (newValue){setState(() {
                              yearc1=newValue.toString();
                            });}, items: year.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Residence",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),
                        Container(
                          width:ismobile(context)?MediaQuery.of(context).size.width/2.5:MediaQuery.of(context).size.width/3.8,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.grey, width: 1.4),
                              borderRadius: BorderRadius.circular(8)),
                          child: DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(resc1=="empty"?"Residence":resc1,style: TextStyle(fontSize: 16),),
                            ),
                            onChanged: (newValue){setState(() {
                              resc1=newValue.toString();
                            });}, items: scholar.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox(width: 50,)),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gender",style: GoogleFonts.montserrat(fontSize:18,fontWeight:FontWeight.w500),),

                        Container(
                          width:ismobile(context)?MediaQuery.of(context).size.width/2.5:MediaQuery.of(context).size.width/3.8,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.grey, width: 1.4),
                              borderRadius: BorderRadius.circular(8)),
                          child: DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(genderc1=="empty"?"Select":genderc1),
                            ),
                            onChanged: (newValue){setState(() {
                              genderc1=newValue.toString();
                            });}, items: gender.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: ()   {
                          if(formfield1.currentState!.validate()&&((mailc1.text.contains(stdc1.text)==false&&stdc1.text.length==7)||( mailc1.text.contains(stdc1.text.substring(0,stdc1.text.length-1))==false && stdc1.text.length==8 )))
                          {
                            showTopSnackBar(
                              Overlay.of(context),
                              SizedBox(
                                height: 40,
                                child: CustomSnackBar.error(
                                  message:
                                  "student number and email not matching",
                                  backgroundColor: Colors.blueGrey,
                                ),
                              ),
                            );
                          }
                          else if(formfield1.currentState!.validate()&&(branchc1 =="empty" || yearc1 =="empty" || resc1 =="empty"))
                          {
                            showTopSnackBar(
                              Overlay.of(context),
                              SizedBox(
                                height: 40,
                                child: CustomSnackBar.error(
                                  message:
                                  "Some field is missing",
                                  backgroundColor: Colors.blueGrey,
                                ),
                              ),
                            );
                          }
                          else if(formfield1.currentState!.validate()) {
                            widget.teamdetails.name.add(namec1.text);
                            widget.teamdetails.email.add(mailc1.text);
                            widget.teamdetails.contactNumber.add(int.parse(phonec1.text));
                            widget.teamdetails.gender.add(genderc1);
                            widget.teamdetails.studentId.add(stdc1.text);
                            widget.teamdetails.residency.add(resc1);
                            widget.teamdetails.currentYear.add(int.parse(yearc1));
                            widget.teamdetails.branch.add(branchc1);
                            toggleContainerVisibility();
                          }
                        },style: ElevatedButton.styleFrom(backgroundColor: Color(0xff031148),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,right: 18.0,top: 12,bottom: 12),
                          child: Text("Continue",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                        )),
                  ],
                ),
                SizedBox(height: 40,)
              ],
            )
        ),
      ),
    );
  }


  // Future<void> _showRecaptchaDialog()async {
  //   await showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return Center(
  //           child: HtmlElementView(viewType: createdViewId)
  //       );
  //     },
  //   );
  //
  // }

}
