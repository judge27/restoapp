import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restoapp/restoapp/screens/profile_page.dart';
import 'home_screen.dart';
import 'category.dart';
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index =0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  final navigationList = [
    HomeScreen(),
    CategoryPage(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:CurvedNavigationBar(
        key: navigationKey,
        index:index,
        height: 50,
        backgroundColor: Color(0xFFE54A00),
        items:[
          Icon(Icons.home_filled, color:Color(0xFFE54A00), size: 33),
          Icon(CupertinoIcons.search,color:Color(0xFFE54A00),size: 33,),
          Icon(CupertinoIcons.profile_circled,color:Color(0xFFE54A00),size: 33),
        ],
        onTap: (index){
          setState(() {
            this.index = index;
          });
        },
      ),
      body:navigationList[index],
    );
  }
}