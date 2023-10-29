import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Userinfo extends ChangeNotifier{
  final auth=FirebaseAuth.instance.currentUser;
  final Db=FirebaseFirestore.instance;
  String _name='',_clg='',_phone='',_year='',_rollno='',_branch='';
  String get name => _name;
  String get clg => _clg;
  String get phone => _phone;
  String get year => _year;
  String get rollno => _rollno;
  String get branch => _branch;
  Future<void> getdata() async
  {
    await FirebaseFirestore.instance.collection('Users').doc(auth!.uid).get().then((value){
      print(value);
     final data=value.data()!;
     _name=data['Name'].toString();
     _clg=data['Collage'].toString();
     _phone=data['PhoneNo'].toString();
     _rollno=data['Rollno'].toString();
     _branch=data['Branch'].toString();
     _year=data['Year'].toString();
   });
    notifyListeners();

  }

  void clear(){
    _name='';
    _clg='';
    _phone='';
    _year='';
    _rollno='';
    _branch='';
    notifyListeners();
  }
}
