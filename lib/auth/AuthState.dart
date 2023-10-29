import 'package:appathon/Pages/Main_Screen.dart';
import 'package:appathon/Pages/BottomNavpages/clgscreen.dart';
import 'package:appathon/auth/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class authState extends StatefulWidget {
  const authState({super.key});

  @override
  State<authState> createState() => _authStateState();
}

class _authStateState extends State<authState> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges()
        , builder: (context,snapshot){
      if(snapshot.hasData){
        return bottomnav();
      }else{
        return Login();
      }
        });
  }
}
