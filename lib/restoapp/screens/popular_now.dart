import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'item_details.dart';

class PopularNowScreen extends StatefulWidget {
  const PopularNowScreen({super.key});

  @override
  State<PopularNowScreen> createState() => _PopularNowScreenState();
}

class _PopularNowScreenState extends State<PopularNowScreen> {
  List<String> itemNameList =[
    "Fettuccine",
    "Supreme Pizza",
    "Panzenella",
    "Hawaiian Pizza",
    "Cheesse Burger",
    "BBQ Pizza",
    "Steak Dish",
    "Pepperoni Pizza"
  ];
  List<String> itemDetailsList =[
    "Fettuccine",
    "Supreme Pizza",
    "Panzenella",
    "Hawaiian Pizza",
    "Cheesse Burger",
    "BBQ Pizza",
    "Steak Dish",
    "Pepperoni Pizza"
  ];
  List<String> itemPriceList =[
    "90 L.E",
    "120 L.E",
    "150 L.E",
    "160 L.E",
    "75 L.E",
    "180 L.E",
    "190 L.E",
    "135 L.E"

  ];
  List<String> itemImageList =[
    "assets/images/Fettuccine.png",
    "assets/images/SupremePizza.png",
    "assets/images/Panzenella.png",
    "assets/images/HawaiianPizza.png",
    "assets/images/cheesseburger.png",
    "assets/images/BBQPizza1.png",
    "assets/images/meal.png",
    "assets/images/pizza2.png"


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
appBar: AppBar(
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Color(0xFFE54A00),
  ),
  backgroundColor: Color(0xFFE54A00),
  leading: InkWell(
      onTap: (){
        Navigator.of(context).pop();},
      child: Icon(Icons.arrow_back_ios_new_rounded)),
  centerTitle: true,
  title: Text("Popular Now",style: TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),),
),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Center(
          child: InkWell(
            // onTap: (){
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context)=> DetailsPage(name: itemNameList,
            //         image: itemImageList,
            //         price: itemPriceList,
            //         details: itemDetailsList,
            //       )
            //   )
            //   );
            // },
            child: Container(
              width: 380,
              child: ListView.separated(
                   separatorBuilder: (context,index)=>SizedBox(height: 15,),
                  scrollDirection: Axis.vertical,
                  itemCount: itemNameList.length,
                  itemBuilder:(context,index)=>itemHomeBuild(itemName: itemNameList,
                      itemDetails: itemDetailsList,
                      itemPrice: itemPriceList,
                      itemImage: itemImageList,
                      index: index
                  ) ),
            ),
          ),
        ),
      ),
    );
  }
  Widget itemHomeBuild({
    required List<String> itemName,
    required List<String> itemDetails,
    required List<String> itemPrice,
    required List<String> itemImage,
    required int index

  }) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> DetailsPage(name: itemNameList[index],
              image: itemImageList[index],
              price: itemPriceList[index],
              details: itemDetailsList[index],
            )
        )
        );
      },
      child: Container(
        child: Column(
          children: [
            Container(
                height: 200,
                child: Image.asset(itemImage[index])),
            SizedBox(height: 6,),
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Row(children: [Text(itemName[index],style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
              ),)],),
            ),
            SizedBox(height:5,),
            Padding(
              padding: const EdgeInsets.only(left:9),
              child: Row(
                children: [
                  Text(itemDetails[index],style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                  ),),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Row(children: [
                Text(itemPrice[index],style: TextStyle(
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
                            leading: Icon(Icons.notifications_active_outlined,color: Colors.white,),
                            backgroundColor: Color(0xFFE54A00),
                            content: Text("Added to cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
        width: 100,
        height: 310,
        decoration:BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ) ,
      ),
    );
  }
}



