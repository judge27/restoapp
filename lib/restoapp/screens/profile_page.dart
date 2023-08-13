import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_screen.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  launchURL(String url) async{
    if(await canLaunch(url)){
      await launch(url);
    }
    else{throw "could not launch $url";}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context)=>HomeScreen()));
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 25,)),
        centerTitle: true,
        title: Text("Profile",style: TextStyle(
          fontSize: 23,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage:AssetImage("assets/images/person.png"),
                          backgroundColor: Colors.white,

                        ),
                      ),
                    SizedBox(width: 20,),
                      Text("Mohamed Sami",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 23,
                      ),)
                    ],
                  ),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.email_outlined,color: Colors.white,),
                            SizedBox(width: 7,),
                            Text("Email",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                            SizedBox(width: 40,),
                            Text("msamii@gmail.com",style: TextStyle(
                              color: Colors.white,
                              fontSize: 19
                            ),)
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Icon(Icons.phone_android_rounded,color: Colors.white,),
                            SizedBox(width: 5,),
                            Text("Phone number",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),SizedBox(width: 30,),
                            Text("01005666277",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),)
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,color: Colors.white,),
                            SizedBox(width: 5,),
                            Text("Country",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                            SizedBox(width: 30,),
                            Text("Egypt",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Icon(Icons.location_city_rounded,color: Colors.white,),
                            SizedBox(width: 5,),

                            Text("Company",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                            SizedBox(width: 30,),
                            Text("Amazon",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Icon(Icons.info_outline,color: Colors.white,),
                            SizedBox(width: 5,),
                            Text("About",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Retail food delivery is a courier "
                            "service in which a restaurant, store,"
                            " or independent food-delivery company delivers food to a customer. "
                            "An order is typically made either through a restaurant or grocer's website "
                            "or mobile app, or through a food ordering company",style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),),
                        SizedBox(height: 45,),
                        Center(child: Text("Social Media",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),)),
                        SizedBox(height: 35,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap:(){
                                const url = "https://www.facebook.com/profile.php?id=100006480371425";
                                launch(url);

                              },
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/images/f2.png"),
                                radius: 25,
                                backgroundColor: Colors.white,

                              ),
                            ),InkWell(
                              onTap: (){
                                const url = "https://www.linkedin.com/in/mohamed-sami-a3a846223/";
                                launch(url);
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage("assets/images/linkedin.png"),
                                backgroundColor: Colors.white,
                              ),
                            ),InkWell(
                              onTap: (){
                                const url = "https://github.com/3arfa11";
                                launch(url);
                              },
                              child: CircleAvatar(
                                child: Image.asset("assets/images/github3.png",),
                                // backgroundImage: AssetImage("assets/images/github.png"),
                                radius: 25,
                                backgroundColor: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              width: double.infinity,
              height: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20)),
                color: Color(0xFFE54A00)
              ),
            )
          ],
        ),
      ),

    );
  }
}
