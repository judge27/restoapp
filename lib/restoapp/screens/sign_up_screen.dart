import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restoapp/dio/dio_helper.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../dio/dio_helper.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static final email = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool obsecureText = true;
  bool isCorrect = true;
  final _form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  void _togglePasswordtext() {
    obsecureText = !obsecureText;
    setState(() {});
  }
  @override

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: SingleChildScrollView(
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset("assets/images/logo2.png"),
                  SizedBox(height: 15,),
                  Text("Resto",style:TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35))),
                    width: double.infinity,
                    height: 710,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 33),
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 330,
                          height: 60,
                          child: TextFormField(
                            controller: _nameController,
                            validator: (value) {
                              if (_nameController.text.length == 0) {
                                return "Empty Fields,Enter your name";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              prefixIconColor: Colors.grey,
                              prefixIcon: Icon(Icons.person_2_outlined),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(13)),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              hintText:AppLocalizations.of(context)!.name,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 33),
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.email,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 330,
                          height: 60,
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (_emailController.text.length == 0) {
                                return "Empty Fields,Enter your Email";
                              }
                              else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w ]{2,4}').hasMatch(value!))
                              {
                                return "email form is not validated";
                              }
                              else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              prefixIconColor: Colors.grey,
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(13)),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              hintText: "example@gmail.com",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 33),
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.password,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 330,
                          height: 60,
                          child: TextFormField(
                            obscureText: obsecureText,
                            controller: _passwordController,
                            validator: (value) {
                              if (_passwordController.text.length == 0) {
                                return "Empty Fields,Enter your Password";
                              } else if (_passwordController.text.length <= 6) {
                                return "Pasword length should be more than 6 digits";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              prefixIconColor: Colors.grey,
                              prefixIcon: Icon(Icons.lock_outline_sharp),
                              suffixIcon: InkWell(
                                onTap: _togglePasswordtext,
                                child: Icon(
                                  obsecureText
                                      ? CupertinoIcons.eye_fill
                                      : CupertinoIcons.eye_slash_fill,
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(13)),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              hintText: "* * * * * * * * * * ",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 33),
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.phone,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 330,
                          height: 60,
                          child: TextFormField(
                            controller: _phoneController,
                            validator: (value) {
                              if (_phoneController.text.length == 0) {
                                return "Empty Fields,Enter your phone number";
                              } else if (_phoneController.text[0]!="0"
                              ) {
                                return "Phone number should start with 0";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              prefixIconColor: Colors.grey,
                              prefixIcon: Icon(Icons.phone_android,size: 20,color: Colors.grey,),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(13)),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              hintText: "01*********",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: ()async{
                            if (_form.currentState!.validate()) {
                              await DioHelper().register(
                                email: _emailController.text,
                                password: _passwordController.text,
                                name: _nameController.text,
                                phone: _phoneController.text,
                              );
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => const HomePage(),
                              //   ),
                              // );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(17)),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.signup,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                            width: 330,
                            height: 60,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          AppLocalizations.of(context)!.or,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.havaccount,
                              style: TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                AppLocalizations.of(context)!.login,
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
