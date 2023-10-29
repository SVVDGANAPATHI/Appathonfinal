import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/userinfoprovider.dart';

Future save_toDB(name,phone,rollno,branch,collage,year) async
{ 
  final Db=FirebaseFirestore.instance;
  final auth=FirebaseAuth.instance.currentUser;

  await Db.collection("Users").doc(auth!.uid).set({
  "Name":name[0].toString().toUpperCase()+name.toString().substring(1,name.toString().length),
  "PhoneNo":phone.toString(),
  "Rollno":rollno.toString().toUpperCase(),
  "Branch":branch.toString().toUpperCase(),
  "Collage":collage.toString().toUpperCase(),
  "Year":year
    });
}

Future update_toDB(BuildContext context,name,phone,rollno,branch,collage,year) async
{
  final Db=FirebaseFirestore.instance;
  final auth=FirebaseAuth.instance.currentUser;

  await Db.collection("Users").doc(auth!.uid).update({
    "Name":name,
    "PhoneNo":phone,
    "Rollno":rollno,
    'Branch':branch,
    'Collage':collage,
    'Year':year
  }).then((value){
    Navigator.pop(context);});
}