import 'dart:async';
import 'package:appathon/Pages/Main_Screen.dart';
import 'package:appathon/Pages/BottomNavpages/clgscreen.dart';
import 'package:appathon/Pages/profilepages/edit_profile.dart';
import 'package:appathon/auth/AuthState.dart';
import 'package:appathon/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
            Duration(seconds:2),()=>Navigator.push(context,MaterialPageRoute(builder:(context) => authState()))
          );
    return Scaffold(
      backgroundColor:Color(0xff7e57c2),
      body:Stack(
        children: [
          Positioned(
            top: 210,left:20,
            child: Text("Smart Study",
            style: GoogleFonts.poppins(
              fontSize:40,fontWeight:FontWeight.bold
              ),
            ),
          ),
          Positioned(
            top: 250,
            child: SvgPicture.asset("assets/bag.svg")),
        ],
      ),
      
    );
  }
}