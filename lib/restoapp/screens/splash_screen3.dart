import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restoapp/restoapp/screens/sign_up_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'login_screen.dart';
class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      body:  Directionality(
        textDirection: TextDirection.ltr,
        child:Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 0,),
            Container(
              height: 616,
                child: Image.asset("assets/images/map.jpg")),
            SizedBox(height: 15,),
            Text(AppLocalizations.of(context)!.freedelivryoffers,style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),),
            SizedBox(height: 10,),
            Text(AppLocalizations.of(context)!.getallyourlovedfoods,style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepOrange.withOpacity(.5),
                  radius: 5,
                ),
                SizedBox(width: 15,),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange.withOpacity(.5),
                  radius: 5,
                ),
                SizedBox(width: 15,),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 5,
                ),
              ],
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(17)
                ),
                child: Center(
                  child: Text(AppLocalizations.of(context)!.next,style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),),
                ),
                width: 330,
                height: 60,
              ),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Text(AppLocalizations.of(context)!.skip,style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),),
            ),
          ],
        ),
      ),
      )
    );
  }
}
