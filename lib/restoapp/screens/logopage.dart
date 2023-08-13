import 'dart:async';
import 'package:flutter/material.dart';

import 'splash_screen1.dart';
class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),() => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context)=> SplashScreen1() ),
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo2.png"),
          Text("Food Delivry",style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 50,),
          CircularProgressIndicator(color: Colors.white),

        ],
      )),
    );;
  }
}