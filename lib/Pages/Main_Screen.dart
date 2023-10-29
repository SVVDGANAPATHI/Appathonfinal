import 'package:appathon/Pages/BottomNavpages/aibot.dart';
import 'package:appathon/Pages/BottomNavpages/clgscreen.dart';
import 'package:appathon/Pages/profilepages/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomnav extends StatefulWidget {
  const bottomnav({super.key});

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {

  int index=0;
  @override
  Widget build(BuildContext context) {
  
   List body_screen=[Screen1(),ChatPage(),Profile()];
    return Scaffold(
    body: body_screen[index],

    bottomNavigationBar: Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GNav(
           color: Colors.white,
           backgroundColor: Colors.black,
           activeColor: Colors.white,
           tabBackgroundColor: Colors.grey.shade800,
           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           textStyle: GoogleFonts.poppins(fontSize:15,color: Colors.white),
           padding: EdgeInsets.all(10),
           gap: 8,
           onTabChange: (value) {
             setState(() {
               index=value;
             });
           },
            tabs:const  [
              GButton(
                icon: Icons.home,
                text: 'Home'
              ),
              GButton(
                icon: Icons.android_rounded,
                text: 'Bot',
              ),
              GButton(
                icon: Icons.account_circle_rounded,
                text: 'Profile',
              ),

            ]
        ),
      ),
    ), 
    );
  }
}