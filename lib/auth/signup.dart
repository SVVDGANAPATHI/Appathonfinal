import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController cpassword=TextEditingController();

  final Db=FirebaseFirestore.instance;
  final auth=FirebaseAuth.instance;


  void _submit() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      final auth=FirebaseAuth.instance;
      try{
       auth.createUserWithEmailAndPassword(
        email: email.text.trim(), password: password.text.trim()).then(
          (value) {
            Db.collection("Users").doc(auth.currentUser!.uid).set({});
          });
      } on FirebaseAuthException catch(ex)
      {
         showDialog(context:context, builder:(context) {
           return const AlertDialog(
            content: Center(child: Text("Sign up Failed")),
           );
         },);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Signup Page',style: TextStyle(
          fontSize: 25,
          color:Colors.black),),
      ),
      body:Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            //add a lottie file of sigup
            //Lottie.asset(""),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
                labelText: 'Email'),
              validator: (input) {
                if (input!.isEmpty) {
                  return 'Please enter a Email';
                }
                return null;
              },
              controller: email,
            ),
            const SizedBox(height: 10,),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
                labelText: 'Password'),
              validator: (input) {
                if (input!.isEmpty) {
                  return 'Please enter an Password';
                }
                return null;
              },
              controller: password,
            ),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
                labelText: 'Confirm Password'),
              obscureText: true,
              validator: (input) {
                if (input!.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              controller: cpassword,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              //instead use a lottie file
              onPressed: _submit,
              child:const  Text('Sign Up'),
            ),
          ],
        ),
      ),
        ),
    );
  }
}

