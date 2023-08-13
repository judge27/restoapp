import 'package:flutter/material.dart';
import 'package:restoapp/restoapp/screens/payment.dart';
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}
List<String> list =["method 1","method 2","method 3"];
String x="";
class _PaymentScreenState extends State<PaymentScreen> {
  String currentMethod = list[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F6F6),
        elevation: 0,
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        centerTitle: true,
        title: Text("Payment",style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left:15),
              child: Text("Payment Method",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
            SizedBox(height: 30,),
            paymentMethodBuilder(name: "PayPal",image:"assets/images/paypal.png",index:0,sizedBox: 190),
            SizedBox(height: 20,),
            paymentMethodBuilder(name: "Master card",image:"assets/images/mastercar.png",index:1,sizedBox: 147),
            SizedBox(height: 20,),
            paymentMethodBuilder(name: "Applepay",image:"assets/images/applePay.png",index:2,sizedBox: 172),
            SizedBox(height: 140,),
            Center(
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentPage()));
                },
                child: Container(
                  child: Center(child: Text("Continue",style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  width: 360,
                  height: 65,
                ),
              ),
            )
            // Center(
            //   child: Container(
            //     child: Row(
            //       children: [
            //         Row(
            //           children: [
            //             SizedBox(width: 20,),
            //             Image.asset("assets/images/paypal.png",width: 32),
            //             SizedBox(width: 15,),
            //             Text(("PayPal"),style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 20,
            //             ),)
            //           ],
            //         ),
            //         SizedBox(width:200 ,),
            //         Radio(
            //             value: list[1], groupValue: currentMethod, onChanged:(value){
            //               setState(() {
            //                 currentMethod =value.toString();
            //               });
            //         })
            //       ],
            //     ),
            //     width: 380,
            //     height: 100,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(17)
            //     ),
            //   ),
            // ),
          ],
        ),
    );
  }

  Center paymentMethodBuilder({
    required String image,
    required String name,
    required int index,
    required double sizedBox,
}
      ) {
    return Center(
            child: InkWell(
              onTap: (){
                setState(() {
                  x=list[index];
                });

              },
              child: Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Image.asset(image,width: 32),
                        SizedBox(width: 15,),
                        Text((name),style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),)
                      ],
                    ),
                    SizedBox(width:sizedBox ,),
                    Radio(
                        value: list[index], groupValue: x, onChanged:(value){
                          setState(() {
                            x =value.toString();
                          });
                    })
                  ],
                ),
                width: 380,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17)
                ),
              ),
            ),
          );
  }
}
