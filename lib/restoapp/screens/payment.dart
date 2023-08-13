
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const.dart';
import 'navbar.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

List<String> options=["Option1"];
class _PaymentPageState extends State<PaymentPage> {
  @override
  String currentOption= options[0];
  final _name= TextEditingController();
  final _cardnumber =TextEditingController();
  final _expire =TextEditingController();
  final _cvv=TextEditingController();
  bool obsecureText = true;
  final _form = GlobalKey<FormState>();
  void _togglePasswordtext() {
    obsecureText = !obsecureText;
    setState(() {});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50.withOpacity(0.97),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50.withOpacity(.2),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade50.withOpacity(0.2),
        ),
        leading: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 28,))
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 18.0, right: 10),
          child: Text("Payment", style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.9),
            fontSize: 28,
          ),
          ),
        ),
        centerTitle: true,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SingleChildScrollView(
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Center(
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(mastercard,width: 60,),
                            SizedBox(width: 4,),
                            Text("Master card",
                              style:TextStyle(
                                color: Colors.black.withOpacity(0.9),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Radio(
                              value: options[0],
                              groupValue: currentOption,
                              focusColor: Color(0xFFE54A00),
                              activeColor: Color(0xFFE54A00),
                              onChanged: (value){
                                setState(() {
                                  currentOption=value.toString();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 45,),
                  Text("Card holder name",
                    style:  TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ) ,
                  ),
                  SizedBox(height: 12,),
                  Container(
                    height: 57,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      controller: _name,
                      validator: (value) {
                        if (_name.text.length == 0) {
                          return "Empty Fields,Enter your Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "full name",
                        hintStyle: TextStyle(
                          fontSize:22 ,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 45,),
                  Text("Card number",
                    style:  TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ) ,
                  ),
                  SizedBox(height: 12,),
                  Container(
                    height: 57,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextFormField(
                      obscureText: obsecureText,
                      textAlign: TextAlign.start,
                      controller: _cardnumber,
                      validator: (value) {
                        if (_cardnumber.text.length == 0) {
                          return "Empty Fields,Enter your card number";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: _togglePasswordtext,
                          child: Icon(
                            obsecureText
                                ? CupertinoIcons.eye_fill
                                : CupertinoIcons.eye_slash_fill,
                            color: Colors.black.withOpacity(.2),
                          ),
                        ),
                        hintText:    "....  ....  ....  ....",
                        hintStyle: TextStyle(
                          fontSize:40 ,
                        ),

                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 45,),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expiry date",
                            style:  TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ) ,
                          ),
                          SizedBox(height: 8,),
                          Container(
                            height: 57,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white),
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.start,
                              controller: _expire,
                              validator: (value) {
                                if (_expire.text.length == 0) {
                                  return "Empty Fields,Enter expiry date";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Month/Year",
                                hintStyle: TextStyle(
                                  fontSize:22 ,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(width: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CVV",
                            style:  TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ) ,
                          ),
                          SizedBox(height: 8,),
                          Container(
                            height: 57,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white),
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.start,
                              controller: _cvv,
                              obscureText: true,
                              validator: (value) {
                                if (_cvv.text.length == 0) {
                                  return "Empty Fields,Enter CVV";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: _togglePasswordtext,
                                  child: Icon(
                                    obsecureText
                                        ? CupertinoIcons.eye_fill
                                        : CupertinoIcons.eye_slash_fill,
                                    color: Colors.black.withOpacity(.2),
                                  ),
                                ),
                                hintText: "...",
                                hintStyle: TextStyle(
                                  fontSize:45 ,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      )


                    ],
                  ),
                  SizedBox(height: 130,),
                  InkWell(

                    onTap: () {





                      if(_form.currentState!.validate()){
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                            insetPadding: EdgeInsets.zero,
                            contentPadding: EdgeInsets.zero,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            content: Builder(
                              builder: (context) {
                                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                var height = MediaQuery.of(context).size.height;
                                var width = MediaQuery.of(context).size.width;

                                return Container(
                                  height: height - 500,
                                  width: width - 40,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 18.0),
                                    child: Column(
                                      children: [
                                        Image.asset(party,height: 180,),
                                        SizedBox(height: 8,),
                                        Text("Congratulations",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 28,
                                              color: Colors.black
                                          ),
                                        ),
                                        SizedBox(height: 16,),
                                        Text("Your order has been confirmed successfully",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17,
                                              color: Colors.grey.shade500
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        InkWell(
                                          onTap: (){
                                            Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(builder: (context) => NavBar()));
                                          },
                                          child: Container(
                                              height:55,
                                              width: width-200,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFE54A00),
                                                  borderRadius: BorderRadius.circular(15)
                                              ),
                                              child:Center(
                                                child: Text("Back To Home",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.w500
                                                  ),),
                                              )

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },

                            ),
                          )
                      );
                      }



                      //                     showDialog(
                      //                     context: context,
                      //                     builder: (BuildContext context) {
                      //               showDialog(
                      //   context: context,
                      //   builder: (_) => new AlertDialog(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius:
                      //       BorderRadius.all(
                      //         Radius.circular(10.0))),
                      //     content: Builder(
                      //       builder: (context) {
                      //         // Get available height and width of the build area of this widget. Make a choice depending on the size.
                      //         var height = MediaQuery.of(context).size.height;
                      //         var width = MediaQuery.of(context).size.width;
                      //
                      //         return Container(
                      //           height: height - 400,
                      //           width: width - 400,
                      //         );
                      //       },
                      //     ),
                      //   )
                      // );      return AlertDialog(
                      //                     content: Container(
                      //                     height: 330.0,
                      //                     width: 460.0,
                      //                             child:Container(
                      //
                      //                               child: Padding(
                      //                                 padding: const EdgeInsets.all(0.0),
                      //                                 child: Column(
                      //                                   crossAxisAlignment: CrossAxisAlignment.center,
                      //                                   mainAxisAlignment: MainAxisAlignment.center,
                      //                                   children: [
                      //                                     Padding(
                      //                                       padding: const EdgeInsets.only(left: 65.0),
                      //                                       child: Row(
                      //                                         children: [
                      //                                           Image.asset(party,height: 190,),
                      //                                         ],
                      //                                       ),
                      //                                     ),
                      //                                     SizedBox(height: 2,),
                      //                                     Padding(
                      //                                       padding: const EdgeInsets.only(left: 38.0),
                      //                                       child: Row(
                      //                                         children: [
                      //
                      //
                      //                                         ],
                      //                                       ),
                      //                                     )
                      //
                      //
                      //                                   ],
                      //
                      //                                 ),
                      //                               ),
                      //                             ) ,

                      // actions: [
                      //                      TextButton(
                      //                     child: Text("Cancel",style: TextStyle(
                      //                       fontSize: 28,
                      //                       fontWeight: FontWeight.w700,
                      //                       color: Colors.black,
                      //                     ),),
                      //                       onPressed:  () {
                      //                                   Navigator.of(context).pop();
                      //                       },
                      //                       )
                      //
                      // ],
                      //                     );
                      // }
                      // );



                    },
                    child: Container(
                        height:62,
                        width: 380,
                        decoration: BoxDecoration(
                            color: Color(0xFFE54A00),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child:Center(
                          child: Text("Confirm",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500
                            ),),
                        )

                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}