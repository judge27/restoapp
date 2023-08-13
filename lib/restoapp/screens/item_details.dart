import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
class DetailsPage extends StatefulWidget {
  var name,image,price,details;
  DetailsPage({Key? myKey,this.name,this.image,this.price,this.details}):super(key: myKey);
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int counter =0 ;
  @override
  void initState() {
     counter =0 ;
    super.initState();
  }
  @override
  var rating = 0.0;
  refersh(){
    setState(() {

    });
  }

  bool flag=false;
  void toggleHeart(refersh()){
    flag=!flag;
    refersh();}
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: _buildAppBar(),
      body: Stack(
          children:[ SingleChildScrollView(
            child: Column(
                children: [
                  Container(
                    height: 420,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.only(bottomLeft:Radius.elliptical(250, 105)
                            ,bottomRight:Radius.elliptical(250, 105))

                    ),
                    child: Image.asset(widget.image),
                  ),
                  _buildCentreData(widget.name),
                  _buildBottomContainer(widget.price),
                ]
            ),
          ),
            _buildAddtion()
          ]
      ),

    );
  }

  Container _buildBottomContainer(String price) {
    return Container(
      width: double.infinity,
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        border: Border.all(color: Colors.white.withOpacity(0.55)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4,left: 12.0),
                  child: Text("price",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Text(widget.price.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),),
                    ),
                   
                  ],
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 5.0,top: 14,
                  bottom: 2),
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
                    height:62,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Color(0xFFE54A00),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child:Center(
                      child: Text("Add to cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500
                        ),),
                    )

                ),
              ),
            )

          ],

        ),
      ),
    );
  }

  Padding _buildCentreData(String name) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0
              ,right: 10,top: 20),
          child: Column(
              children: [
                Row(
                  children: [
                    Text(name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: (){
                          toggleHeart(refersh);
                        },
                        child: Icon(flag?
                        CupertinoIcons.heart_fill:
                        CupertinoIcons.heart,size: 35,color: Color(0xFFE54A00),)
                    )
                  ],
                ),
                SizedBox(height: 8,),
                _buildRating(),
                SizedBox(height: 14,),
                Container(
                  height: 95,
                  child: ListView.separated(
                      itemCount: 1,
                      itemBuilder: (context,index)=>_buildDescription(widget.details),
                      separatorBuilder:(context, index) {
                        return SizedBox(height: 10.0);
                      }
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Icon(CupertinoIcons.alarm,color: Colors.grey.shade700,
                      size: 24,),
                    SizedBox(width: 7,),
                    Text("30",style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 25
                    ),
                    ),
                    SizedBox(width: 4,),
                    Text("-",style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 38
                    ),
                    ),
                    SizedBox(width: 4,),
                    Text("40",style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 25
                    ),
                    ),
                    SizedBox(width: 4,),
                    Text("min",style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 22
                    ),
                    ),

                  ],
                ),
                SizedBox(height:16,),]
          ),
        ),
      ),
    );
  }

  Positioned _buildAddtion() {
    return Positioned(
      top: 385,
      left: 158,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey.shade300)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             InkWell(
                onTap: (){
                  setState(() {

                    if(counter >0){
                      counter--;

                    }
                  });
                },
                child: CircleAvatar(
                  radius:15 ,
                  backgroundColor: Colors.white,
                  child: Icon(CupertinoIcons.minus,color: Colors.black,size: 30,),
                ),
              ),

            SizedBox(width: 12,),
            Text(counter.toString(),style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 26,
              color: Colors.black,
            ),),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: InkWell(
                onTap: (){
                  setState(() {
                    counter++;
                  });
                },
                child: CircleAvatar(
                  radius:15 ,
                  backgroundColor: Color(0xFFE54A00),
                  child: Icon(CupertinoIcons.plus,color: Colors.white,size: 28,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  String description=
    "classic double cheese burger with beef patty,pickles, chesse,tomato,onion,ketchup and,mustard";
  Padding _buildDescription(String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 385,
        child: Text(
          description,
          style: TextStyle(
              overflow: TextOverflow.clip,
              fontSize: 18,
              color: Colors.grey.shade700
          ),
        ),
      ),



    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white
      ),
      leading: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child:InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios_new,size: 25,color: Colors.black,))
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Text("Details",style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 22
        ),
        ),
      ),
      centerTitle: true,
    );
  }

  Row _buildRating() {
    return Row(
      children: [
        SmoothStarRating(
          rating: rating,
          size: 31,
          starCount: 5,
          color: Colors.amber,borderColor: Colors.grey,
          onRatingChanged: (value) {
            setState(() {
              rating = value;
            });
          },
        ),
      ],
    );
  }

}
