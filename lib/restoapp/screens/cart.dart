import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restoapp/restoapp/screens/profile_page.dart';
import 'package:restoapp/restoapp/screens/shopping_info_screen.dart';
import '../../const.dart';
import 'category.dart';
import 'home_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var _promo=TextEditingController();
  @override
  double posX = 0.0;
  double posQ = 0.0;
  double posZ= 0.0;
  bool flag3=false;
  bool flag = false;
  bool flag2 = false;
  int count1 =0;
  int count2 =0;
  int count3 =0;
  int price1=137;
  int price2=120;
  int price3=150;
  int result=0;
  int total=0;
  int shipping=00;
  int selected=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result=0;
    shipping= 5*(count1+count2+count3);
    total=result+shipping;
  }
  @override


  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar:CurvedNavigationBar(
          height: 75.0,
          onTap: (index)async{
            if(index==0) {
              setState(() {
                selected = index;
                Future.delayed(Duration(milliseconds: 395)).then((value) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                });
              });
            }
            if(index==1) {
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
            Icon(Icons.home_filled, color: Color(0xffE54A00), size: 33),
            Icon(CupertinoIcons.search,color: Color(0xffE54A00),size: 33,),
            Icon(CupertinoIcons.profile_circled,color: Color(0xffE54A00),size: 33),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white
          ),
          leading: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 28,))
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 10),
            child: Text("Cart", style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFFE54A00).withOpacity(0.9),
              fontSize: 30,
            ),
            ),
          ),
          centerTitle: true,
        ),
        body:
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [

                           if(flag==false)
                            _buildStack(big, "Beef Bruger",
                                "Extra Chesse", "137 L.E"),
                           if(flag==false)
                            SizedBox(height: 40,),
                           if(flag2==false)
                           _buildStack2(crepe,"Chesse crepe","Extra Chesse","137 L.E"),
                           if(flag2==false)
                            SizedBox(height: 40,),
                           if(flag3==false)
                             _buildStack3(pasta,"Spaghetti","Extra Chesse","137 L.E"),
                             if(flag3==true)
                             SizedBox(height: 140,),
                          if(flag==true)
                            SizedBox(height: 130,),
                          if(flag2==true)
                            SizedBox(height: 120,),

                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:12,bottom: 10),
                                child: Container(
                                  height: 60,
                                  width: 365,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.grey.shade100),
                                    color: Colors.grey.shade100,
                                  ),
                                  child: TextFormField(
                                    controller: _promo,
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(left: 20.0,top: 0,right: 14),
                                        child: Icon(Icons.card_giftcard_rounded,color: Color(0xFF868686),size: 32,),
                                      ),
                                      hintText: "Promo Code",
                                      hintStyle: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF868686),
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
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: InkWell(
                                          onTap: (){
                                            if(_promo.text!="0")
                                            {
                                              setState(() {
                                                if(result==0)
                                                  {
                                                    shipping=0;
                                                    total=0;

                                                  }
                                                else{

                                                  result-=int.parse(_promo.text);
                                                  shipping=4*0.5*int.parse(_promo.text)as int;
                                                  total=result+shipping;


                                                }});
                                            }
                                          },
                                          child: Text("Apply",style: TextStyle(
                                              color: Color(0xFFE54A00),
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700
                                          ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0,top:12,bottom: 10),
                                      child: Container(
                                        width: 360,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text("Sub Total :",
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.6),
                                                fontSize: 22,
                                              ),
                                            ),
//                                          SizedBox(width: 160,),
                                            Text(result.toString()+" L.E",
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.6),
                                                fontSize: 23,
                                              ),
                                            ),

                                          ],

                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12,bottom: 10,left: 5),
                                      child: Container(
                                        width: 360,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text("Shipping :",
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.6),
                                                fontSize: 22,
                                              ),
                                            ),
  //                                        SizedBox(width:172,),
                                            Text(shipping.toString()+" L.E",
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.6),
                                                fontSize: 24,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 360,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Total :",
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.6),
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            //SizedBox(width: 205,),
                                            Text(total.toString()+" L.E",
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.6),
                                                fontSize: 24,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShoppingInfoScreen()
                                              )
                                              );
                                            },
                                            child: Container(
                                                height:62,
                                                width: 380,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFE54A00),
                                                    borderRadius: BorderRadius.circular(15)
                                                ),
                                                child:Center(
                                                  child: Text("Checkout",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.w500
                                                    ),),
                                                )

                                            ),
                                          )

                                        ],
                                      ),
                                    ),

                                  ],
                                )



                            ],
                          )
                        ]
                    ),

                  ],
                ),

              ],
            ),
          ),
        )

    );
  }

  Stack _buildStack(String image, String text1, String text2, String text3) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 25),
          child: InkWell(
            onTap: () {
              flag = true;
              setState(() {});
            },
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                CupertinoIcons.delete, color: Color(0xFFE54A00), size: 32,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              color: Colors.white.withOpacity(0.11),
              width: 400 * 0.94,
              height: 115,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 5000),
                    left: posX,
                    key: const ValueKey("item 1"),
                    child: Container(
                      height: 70.0,
                      width: 380.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.11),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.11))
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(image, width: 100, height: 80,),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  text1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  text2,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  (price1).toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 42.0,
                                top: 15
                            ),
                            child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                        color: Colors.grey.shade300)
                                ),
                                child:

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0),
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              if(count1>=1)
                                              if(count1!=0) {
                                                count1--;
                                                result = result - price1;
                                                shipping = 5 *
                                                    (count1 + count2 + count3);
                                                total = result + shipping;
                                              }});
                                          },
                                          child:CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.white,
                                            child: Icon(CupertinoIcons.minus,
                                              color: Colors.black, size: 20,),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(count1.toString(), style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0,right: 12.0),
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              count1++;
                                              result=result+price1;
                                              shipping= 4*(count1+count2+count3);
                                              total=result+shipping;

                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Color(0xFFE54A00),
                                            child: Icon(CupertinoIcons.plus,
                                              color: Colors.white, size: 20,),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),


                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onPanEnd: (details) {
                      setState(() {
                        posX = 0;
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        posX = details.localPosition.dx;
                      });

                      if (posX / 380 > .94) {
                        flag = true;
                        int temp5=price1*count1;
                        setState(() {
                          result=result-temp5;
                          count1=0;
                          shipping=4*(count1+count2+count3);
                          total=result+shipping;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),

          ],
        ),

      ],
    );
  }
  Stack _buildStack3(String image, String text1, String text2, String text3) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 25),
          child: InkWell(
            onTap: () {
              flag3= true;
              setState(() {});
            },
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                CupertinoIcons.delete, color: Color(0xFFE54A00), size: 32,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              color: Colors.white.withOpacity(0.11),
              width: 380 * 0.94,
              height: 115,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 1000),
                    left: posZ,
                    key: const ValueKey("item 1"),
                    child: Container(
                      height: 70.0,
                      width: 380.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.11),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.11))
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(image, width: 100, height: 80,),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  text1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  text2,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  (price3).toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0,
                                top: 15
                            ),
                            child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                        color: Colors.grey.shade300)
                                ),
                                child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0),
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              if(count3>=1)
                                              if(count3!=0 || result!=0) {
                                                count3--;
                                                result = result - price3;
                                                shipping = 4 *
                                                    (count1 + count2 + count3);
                                                total = result + shipping;
                                              }});
                                          },
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.white,
                                            child: Icon(CupertinoIcons.minus,
                                              color: Colors.black, size: 20,),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(count3.toString(), style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0,right: 12.0),
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              count3++;
                                              result=result+price3;
                                              shipping= 4*(count1+count2+count3);
                                              total=result+shipping;
                                            });

                                          },
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Color(0xFFE54A00),
                                            child: Icon(CupertinoIcons.plus,
                                              color: Colors.white, size: 20,),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onPanEnd: (details) {
                      setState(() {
                        posZ = 0;
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        posZ = details.localPosition.dx;
                      });

                      if (posZ / 380 > .94) {
                        flag3= true;
                        int temp6=price3*count3;
                        setState(() {
                          result=result-temp6;
                          count3=0;
                          shipping=4*(count1+count2+count3);
                          total=result+shipping;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),

          ],
        ),

      ],
    );
  }
  Stack _buildStack2(String image, String text1, String text2, String text3) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 25),
          child: InkWell(
            onTap: () {
              flag2 = true;
              setState(() {});
            },
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                CupertinoIcons.delete, color: Color(0xFFE54A00), size: 32,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              color: Colors.white.withOpacity(0.11),
              width: 380 * 0.94,
              height: 115,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 1000),
                    left: posQ,
                    key: const ValueKey("item 1"),
                    child: Container(
                      height: 70.0,
                      width: 380.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.11),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.11))
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(image, width: 100, height: 80,),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  text1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  text2,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  (price2).toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 32,
                                top: 15
                            ),
                            child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                        color: Colors.grey.shade300)
                                ),
                                child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0),
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              if(count2>=1)
                                              if(count2!=0) {
                                                count2--;
                                                result = result - price2;
                                                shipping = 4 *
                                                    (count1 + count2 + count3);
                                                total = result + shipping;
                                              }
                                            });

                                          },
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.white,
                                            child: Icon(CupertinoIcons.minus,
                                              color: Colors.black, size: 20,),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(count2.toString(), style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 12.0,left: 8),
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              count2++;
                                              result=result+price2;
                                              shipping= 4*(count1+count2+count3);
                                              total=result+shipping;
                                            });

                                          },
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Color(0xFFE54A00),
                                            child: Icon(CupertinoIcons.plus,
                                              color: Colors.white, size: 20,),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),


                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onPanEnd: (details) {
                      setState(() {
                        posQ = 0;
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        posQ = details.localPosition.dx;
                      });

                      if (posQ / 380 > .94) {
                        flag2 = true;
                        int temp7=price2*count2;
                        setState(() {
                          result=result-temp7;
                          count2=0;
                          shipping=4*(count1+count2+count3);
                          total=result+shipping;                 });
                      }
                    },
                  ),
                ],
              ),
            ),

          ],
        ),

      ],
    );
  }


}