
import 'package:appathon/Pages/splash%20screen.dart';
import 'package:appathon/provider/userinfoprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'auth/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,

  ]);
  await Firebase.initializeApp();
  runApp( const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider(create:(context) => Userinfo(),)
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Mainscreen()
    ),
    );
  }
}