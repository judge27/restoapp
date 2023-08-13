import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restoapp/dio/dio_helper.dart';
import 'package:restoapp/restoapp/screens/sign_up_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  launchURL(String url) async{
    if(await canLaunch(url)){
      await launch(url);
    }
    else{throw "could not launch $url";}
  }
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool obsecureText = true;
  bool isCorrect = true;
  final _form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  void _togglePasswordtext() {
    obsecureText = !obsecureText;
    setState(() {});
  }

   bool  isChecked = false;

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
                    height: 20,
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
                    height: 600,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:45,right:35,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.login,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.7),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
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
                              hintText:AppLocalizations.of(context)!.email,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 33),
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         "Password",
                        //         style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 16,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 330,
                          height: 60,
                          child: TextFormField(
                            obscureText: obsecureText ,
                            controller: _passwordController,
                            validator: (value){

                              if(_passwordController.text.length==0){
                                return "Empty Fields,Enter your Email";
                              }
                              else if(_passwordController.text.length <= 6){
                                return "Pasword length should be more than 6 digits";
                              }
                              else{return null;}
                            },
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.password,
                              prefixIconColor: Colors.grey,
                              prefixIcon: Icon(Icons.lock_outline_sharp),
                              suffixIcon: InkWell(
                                onTap: _togglePasswordtext,
                                child: Icon(
                                  obsecureText
                                      ?CupertinoIcons.eye_fill
                                      : CupertinoIcons.eye_slash_fill,color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(13)),
                              filled: true,
                              fillColor: Colors.grey.shade200,


                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 260),
                              child: Text(
                                AppLocalizations.of(context)!.forgetpassword,
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: ()async{
                            if(_form.currentState!.validate()){
                              await DioHelper().login(email: _emailController.text,
                                  password: _passwordController.text);

                            }
                          },

                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(17)),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.login,
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
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap:(){
                                const url = "https://www.facebook.com";
                                launch(url);

                              },
                              child: CircleAvatar(
                                backgroundImage:
                                AssetImage("assets/images/facebook.png"),
                                radius: 18,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            InkWell(
                              onTap:(){
                                const url = "https://accounts.google.com";
                                launch(url);

                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage("assets/images/googleicon.png"),
                                radius: 18,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            InkWell(
                              onTap:(){
                                const url = "https://github.com/login";
                                launch(url);

                              },
                              child: CircleAvatar(
                                backgroundImage:
                                AssetImage("assets/images/g1.png"),
                                radius: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.donthaveaccount,
                              style: TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                AppLocalizations.of(context)!.signup
                               ,
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
