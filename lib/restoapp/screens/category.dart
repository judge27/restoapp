import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:restoapp/restoapp/screens/profile_page.dart';


import '../../const.dart';
import 'home_screen.dart';
class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  int selected =0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  selected=0;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:CurvedNavigationBar(
        height: 75.0,
        onTap: (index)async{
          if(index==1) {
            setState(() {
              selected = index;
              Future.delayed(Duration(milliseconds: 395)).then((value) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              });
            });
          }
          if(index==0) {
            setState(() {
              selected = index;
              Future.delayed(Duration(milliseconds: 395)).then((value) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CategoryPage()));
              });
            });
          }
          if(index==2) {
            setState(() {
              selected = index;
              Future.delayed(Duration(milliseconds: 395)).then((value) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              });
            });
          }
        },
        backgroundColor: Color(0xFFE54A00),
        items:[
           Icon(CupertinoIcons.search,color: Color(0xffE54A00),size: 33,),
          Icon(Icons.home_filled, color: Color(0xffE54A00), size: 33),
          Icon(CupertinoIcons.profile_circled,color: Color(0xffE54A00),size: 33),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white
        ),
        title: Text("Search",style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFFE54A00),
            fontSize: 38,
          ),
        ),centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,size: 32,
            color: Colors.black,
          ),
        ),
      ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
            left: 12.0,
          top: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchField(),
              SizedBox(height: 24,),
              Text("Top Categories",
              style: TextStyle(
                color: Color(0xFF727272),
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),),
              SizedBox(height: 21,),
                _buildCategories("Pizza",pizza,"Crepe",crepe),
              SizedBox(height: 18,),
              _buildCategories("Pasta", pasta, "Bruger", bruger),
              SizedBox(height: 18,),
              _buildCategories("Meals", meals, "Coffee", coffee),



            ]
          ),
        ),
      ),

    );
  }


  Padding _buildCategories(String text1,String img1,
      String text2,String img2) {
    return Padding(
            padding: const EdgeInsets.only(
                left: 0.0
            ),
            child: Row(
            children: [
              Stack(
                  children: [
                    Container(
                      width: 182,
                      height: 175,
                      margin: EdgeInsets.only(right: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(img1,fit: BoxFit.fill,),
                    ),
                    Container(
                      width: 185,
                      height: 178,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    Positioned(
                      top: 65,
                      left: 44,
                      child: Text(text1,
                        style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                        ),
                      ),
                    )
                  ]
              ),
              Stack(
                  children: [
                    Container(
                      width: 183,
                      height: 175,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(img2,fit: BoxFit.fill,)
                      )
                    ),
                    Container(
                      width: 185,
                      height: 178,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    Positioned(
                      top: 65,
                      left: 42,
                      child: Text(text2,
                        style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                        ),
                      ),
                    )
                  ]
              ),
            ],
            ),
          );
  }
}
Widget _buildSearchField(){

  return Container(
    height: 52,
    width: 376,
    margin: EdgeInsets.only(left: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade200),
      color: Colors.grey.shade200,
    ),
    child: TextFormField(
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: Icon(CupertinoIcons.search,color: Color(0xFF868686),),
        hintText: "Search",
        hintStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF868686)
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(243, 245, 247, 1)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(243, 245, 247, 1)),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(243, 245, 247, 1) ),
        ),
      ),
    ),
  );



}
