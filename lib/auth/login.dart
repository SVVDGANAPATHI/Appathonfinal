import 'package:appathon/Pages/Main_Screen.dart';
import 'package:appathon/Pages/BottomNavpages/clgscreen.dart';
import 'package:appathon/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Pages/splash screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void login(String email,String password) async
  {
    // String email=_email.text.trim();
    // String password=_password.text.trim();
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
          .then((value){
            print(value.user!.uid);
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>const bottomnav()));
      }).onError((error, stackTrace) {
        // add login failed animation
      });
    }on FirebaseAuthException catch(ex)
    {
      showDialog(context:context, builder:(context){
        return AlertDialog(
          content: Text(ex.toString()),
        );
      },);
    }
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController _email=TextEditingController();
    TextEditingController _password=TextEditingController();


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:80.0,left:20,right:20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("LOGIN",style: GoogleFonts.poppins(
                fontSize:50,
                color: Colors.black
              ),),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/loginpageanime.json",height:200,width:200),
                ],
              ),
              TextField(
                      controller: _email,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xff7e57c2)),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        prefixIcon:  Icon(Icons.email),
                        prefixIconColor: Color(0xff7e57c2),
                        hintText: "Email Address"
                      )
                    ),
              const SizedBox(height: 20,),
              TextField(
                      controller: _password,
                      decoration:const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xff7e57c2)),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        border: OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          width:2,
                          color: Colors.black38)
                      ),
                        prefixIcon:Icon(Icons.password),
                        prefixIconColor: Color(0xff7e57c2),
                        hintText: "password"
                      )
                    ),
              const SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      login(_email.text.toString(),_password.text.toString());
                    },
                    child: Container(
                      height:40,width: 150,
                    decoration: const BoxDecoration(
                      color: const Color(0xff7e57c2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: const Center(
                      child: Text("LOGIN",
                      style: TextStyle(fontSize: 20,color: Colors.white),),
                    ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:150),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Dont have Account Signup?"),
                    TextButton(onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder:(context) => SignupPage(),));
                    },
                    child:const Text("Signup"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}