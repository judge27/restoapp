import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restoapp/dio/dio_helper.dart';
import 'package:restoapp/restoapp/screens/category.dart';
import 'package:restoapp/restoapp/screens/payment_page1.dart';
import 'package:restoapp/restoapp/screens/popular_now.dart';
import 'package:restoapp/restoapp/screens/profile_page.dart';
import 'package:restoapp/restoapp/screens/shopping_info_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../cubit/home_cubit.dart';
import 'cart.dart';
import 'item_details.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  launchURL(String url) async{
    if(await canLaunch(url)){
      await launch(url);
    }
    else{throw "could not launch $url";}
  }
  List<Widget> topDrawerList = [
    CartPage(),
    PaymentScreen(),
    ShoppingInfoScreen()
  ];
  List<Widget> bottmDrawerList = [
    PopularNowScreen(),
    CategoryPage(),
    ProfileScreen(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer:Container(
        width: 350,
        child: Drawer(

            child:SafeArea(
          child:Container(
              width: 380,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.8)],
                    stops: [0, 1],
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,
                    top: 20,
                    right:0
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: Image.asset("assets/images/person.png",width: 74,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context)=>ProfileScreen())
                                        );
                                    },
                                      child: Text("Mohamed",style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      ),
                                    ),
                                    SizedBox(width: 114,),
                                    InkWell(
                                      onTap: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: ClipOval(
                                          child:Container(
                                              decoration: BoxDecoration(color: Colors.white),
                                              width: 50,
                                              child:
                                              Container(child: Icon(Icons.close,size: 40,color: Colors.black,)))),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("sami@gmail.com",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15

                                      ),
                                    )

                                  ],
                                ),
                              ],
                            ),

                          ]
                      ),
                    ),
                    SizedBox(height: 15,),
                    Divider(color: Colors.black,indent: 25,endIndent: 25,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            child: ListView.separated(separatorBuilder: (context,index)=>SizedBox(height: 20,),
                                itemCount: texts1.length,
                                itemBuilder: (context,index)=>_buildBars(icons1,texts,texts1,index,topDrawerList)),
                          ),
                          Divider(color: Colors.black,indent: 16,endIndent: 16,),
                          SizedBox(height: 30,),
                          Container(
                            height: 230,
                            child: ListView.separated(

                                separatorBuilder: (context,index)=>SizedBox(height: 20,),
                                itemCount: texts2.length,
                                itemBuilder: (context,index)=>_buildBars(icons2,texts2,texts3,index,bottmDrawerList)),
                          ),
                          SizedBox(height:0,),
                          //LOCATION
                          InkWell(
                            onTap: () {
                              const url = "https://goo.gl/maps/yctXEvtnYX22jmNZ7";
                              launch(url);

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade100,width: 1),
                                color: Colors.white
                              ),
                              width: 305,
                              height: 55,
                              child: Row(
                                children: [
                                  SizedBox(width: 8,),
                                  Icon(Icons.location_on_outlined,size: 28,color: Color(0xFFE54A00)),
                                  SizedBox(width: 7,),
                                  Text("Location",style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 7),
                                    child: Icon(Icons.arrow_forward_ios,color: Color(0xFFE54A00),),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              )),
        )
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
                onPressed: (){Scaffold.of(context).openDrawer();},
                icon:Image.asset("assets/images/menu2.png",width: 28,)

            );
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
       backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Resto",
          style: TextStyle(
            color: Color(0xFFE54A00),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        // leading: InkWell(
        //   onTap: (){
        //     Scaffold.of(context).openDrawer();
        //   },
        //   child: Icon(Icons.menu_sharp,
        //     color: Color(0xFF262626),
        //   ),
        // ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
              child: Icon(
                Icons.person,
                color: Color(0xFF262626),
                size: 30,
              ),

          )
        ],
      ),
      body: BlocBuilder
      <HomeCubit,HomeState>(
        builder: (context,state) {
          if (state is HomeLoadingState) {
            return Center(child: CircularProgressIndicator(),);
          }
          else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                      child: Container(
                          width: 365,
                          height: 53,
                          child: TextFormField(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CategoryPage()));
                            },
                            decoration: InputDecoration(
                              prefixIcon: InkWell(

                                child: Icon(
                                  Icons.search,
                                  color: Colors.black.withOpacity(.5),
                                ),
                              ),
                              label: Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.6),
                                ),
                              ),
                              fillColor: Colors.grey.shade300,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                            ),
                          ))),
                  SizedBox(

                    height: 20,
                  ),
                  Container(
                    width: 365,
                    height: 145,
                    decoration: BoxDecoration(
                      color: Color(0xFFE54A00),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 19, left: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Buy 2 Get 1 Free",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "275 L.E",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context)
                                        .showMaterialBanner(
                                      MaterialBanner(
                                          padding: EdgeInsets.all(20),
                                          leading: Icon(
                                            Icons.notifications_active_outlined,
                                            color: Colors.white, size: 25,),
                                          backgroundColor: Color(0xFFE54A00),
                                          content: Text("Added to cart",
                                            style: TextStyle(fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),),
                                          actions: [InkWell(
                                              onTap: () {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentMaterialBanner();
                                              },
                                              child: Icon(Icons.exit_to_app,
                                                color: Colors.white,))
                                          ]
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 110,
                                    height: 38,
                                    child: Center(
                                        child: Text(
                                          "Order now",
                                          style: TextStyle(
                                            color: Color(0xFFE54A00),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        )),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 222,
                          child: Image.asset(
                              "assets/images/threeburgeres2.png"),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        categoryHomeBuilder(
                            name: "Burger", image: "assets/images/bur1.png"),
                        categoryHomeBuilder(
                            name: "Pizza", image: "assets/images/pizza2.png"),
                        categoryHomeBuilder(
                            name: "Creap", image: "assets/images/crepe.png"),
                        categoryHomeBuilder(
                            name: "Meals", image: "assets/images/meal.png"),

                      ],

                    ),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(name: "Beef Burger",
                                    image: "assets/images/beefburger.png",
                                    price: "138 L.E",
                                    details: "classic double cheese burger with beef patty,pickles, chesse,tomato,onion,ketchup and,mustard",
                                  ),
                            ),
                          );
                        },
                        child: itemHomeBuild(
                            itemName: "Beef Burger",
                            itemDetails: "Double beef+cheese",
                            itemPrice: "138 L.E",
                            itemImage: "assets/images/beefburger.png"),
                      ),
                      SizedBox(width: 25,),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(name: "Chicken Burger",
                                    image: "assets/images/chickenburger.png",
                                    price: "125 L.E",
                                    details: "classic cheese burger with Chicken chesse,tomato,onion,ketchup and,mustard",
                                  ),
                            ),
                          );
                        },
                        child: itemHomeBuild(
                            itemName: "Chicken Burger",
                            itemDetails: "Double chicken+cheese",
                            itemPrice: "125 L.E",
                            itemImage: "assets/images/chickenburger.png"),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  //POPULAR NOW ROW
                  Row(
                    children: [
                      SizedBox(width: 15,),
                      Text("Popular Now", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const PopularNowScreen(),
                              ),
                            );
                          },
                          child: Text("See All", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(name: "Sausage Pizza",
                                image: "assets/images/pizza5.png",
                                price: "140",
                                details: "classic Pizza with sausage and mushroom and Ranch sause on top",
                              ),
                        ),
                      );
                    },

                    child: Container(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pizza5.png"),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15,),
                              Text("Pizza with sausages\n and mushroom",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),),
                              SizedBox(height: 10,),
                              Text(" with Ranch sause", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(.5)
                              ),)
                            ],
                          )
                        ],
                      ),
                      width: 360,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }
        )
    );
  }
//CATEGORY
  Widget categoryHomeBuilder({required String name,required String image}) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>CategoryPage()));
      },
      child: Container(
                    child: Column(
                      children: [
                        Container(
                            height: 68,
                            width: 80,
                            child: Image.asset(image)),
                        Text(name,style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 17
                        ),)
                      ],
                    ),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
    );
  }

  Widget itemHomeBuild({
    required String itemName,
    required String itemDetails,
    required String itemPrice,
    required String itemImage
}) {
    return Container(
                child: Column(
                  children: [
                    Container(
                        width:140,
                          child: Image.asset(itemImage)),
                        SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Row(children: [Text(itemName,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),)],),
                    ),
                    SizedBox(height:5,),
                    Padding(
                      padding: const EdgeInsets.only(left:9),
                      child: Row(
                        children: [
                          Text(itemDetails,style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.only(left: 9.0),
                      child: Row(children: [
                        Text(itemPrice,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: (){
                              ScaffoldMessenger.of(context).showMaterialBanner(
                                  MaterialBanner(
                                    padding: EdgeInsets.all(20),
                                    leading: Icon(Icons.notifications_active_outlined,color: Colors.white,size: 25,),
                                      backgroundColor: Color(0xFFE54A00),
                                      content: Text("Added to cart",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                                      actions: [InkWell(
                                          onTap: (){
                                            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                                          },
                                          child: Icon(Icons.exit_to_app,color: Colors.white,))]
                                  ),
                              );
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFE54A00),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Icon(Icons.add,color: Colors.white,size: 25,),
                            ),
                          ),
                        )
                      ],),
                    )
                  ],
                ),
                width: 165,
                height: 200,
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ) ,
              );
  }
  List<Widget> icons1=[
    Icon(Icons.shopping_bag_outlined,color: Color(0xFFE54A00),size: 28,),
    Icon(Ionicons.wallet_outline,color: Color(0xFFE54A00),size: 28,),
    Icon(CupertinoIcons.location_circle,color: Color(0xFFE54A00),size: 28,),
  ];
  List<Widget> icons2=[
    Icon(Icons.local_fire_department_outlined,color: Color(0xFFE54A00),size: 28,),
    Icon(Icons.category_outlined,color: Color(0xFFE54A00),size: 28,),
    Icon(CupertinoIcons.info_circle,color: Color(0xFFE54A00),size: 28,),
  ];
  List<String> texts=[
    "Cart",
    "Payment",
    "Location",
  ];
  List<String> texts1=[
    "3 items",
    "PayPal",
    "2 locations",
  ];

  List<String> texts2=[
    "Popular now",
    "Category",
    "About ",
  ];

  List<String> texts3=[
    "",
    "",
    "",
    "",
  ];
  Row _buildBars(List<Widget> icon,List<String> text,List<String> text2,int index,List<Widget> list ) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder:(context)=>list[index]));
          },
          child: Container(
              width:305 ,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Color(0xFFF6F6F6))
              ),
              child:Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 5),
                child: Row(
                  children: [
                    icon[index],
                    SizedBox(width: 8,),
                    Text(text[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 28,),
                    Text(text2[index],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded,color: Color(0xFFE54A00),)
                  ],
                ),
              )
          ),
        ),
      ],
    );
  }

}

