import 'package:appathon/Pages/profilepages/edit_profile.dart';
import 'package:appathon/auth/login.dart';
import 'package:appathon/provider/userinfoprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {

  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final auth=FirebaseAuth.instance;

  void logout(){
    auth.signOut().then((value){
      final provider=Provider.of<Userinfo>(context,listen: false);
      provider.clear();

      Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
    }).onError((error, stackTrace) {

    });
  }


  @override
  Widget build(BuildContext context) {
    double hi=MediaQuery.of(context).size.height;
    double wi=MediaQuery.of(context).size.width;



    return Consumer<Userinfo>(
      builder: (context, value, child) => Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(clipBehavior: Clip.none,
              children: [
               Container(
                 height: hi/4,width: wi,
                 decoration:const BoxDecoration(
                   color: Color(0xfffa6961),
                   shape: BoxShape.rectangle,
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(70),
                     bottomRight: Radius.
                       circular(70)
                   )
                 ),
          
               ),
                Positioned(top:120 ,left:110,
                  child: SizedBox(height: 140,width: 140,
                    child: Card(
                      color: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80)
                      ),
                    ),),
                )
              ],
            ),
            const SizedBox(height: 60,),
            Text("${value.name}",style:
            TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xfffa6961)
            ),),
          
            Text("${auth.currentUser!.email}"),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 20),
              child: Column(
                children: [
                  Container(height: 60,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape:const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))
                            ),
                            color: Colors.grey.shade300,
                            child: Icon(Icons.phone_android),
                          ),),
                        Text("Phone"),
                        Text("${value.phone}")
                      ],
          
                    ),
                  ),
                  Container(
                    height: 60,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))
                            ),
                            color: Colors.grey.shade300,
                            child: Icon(Icons.tag),
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(left:0),
                          child: Text("RollNo"),
                        ),
                        Text("${value.rollno}")
                      ],
                            
                    ),
                  ),
                  Container(height: 60,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))
                            ),
                            color: Colors.grey.shade300,
                            child: Icon(Icons.school_outlined),
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(right:35.0),
                          child: Text("College"),
                        ),
                        Text("${value.clg}")
                      ],
          
                    ),
                  ),
                  Container(height: 60,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))
                            ),
                            color: Colors.grey.shade300,
                            child: Icon(Icons.adb_rounded),
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(right:40),
                          child: Text("Branch"),
                        ),
                        Text("${value.branch}")
                      ],
          
                    ),
                  ),
                  Container(height: 60,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))
                            ),
                            color: Colors.grey.shade300,
                            child: Icon(Icons.menu_book_outlined),
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(right: 35),
                          child: Text("YearOfStudy"),
                        ),
                        Text("${value.year}")
                      ],
          
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Color(0xfffa6961)) ,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileEditForm(
                      name: value.name, phone: value.phone,
                      branch: value.branch,collage: value.clg,
                      rollno: value.rollno,year: value.year,
                    ),) );
                  }, child: Text("Edit")),
            ),
            ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Color(0xfffa6961)) ,
                onPressed: (){

                 FirebaseAuth.instance.signOut();
                }, child: Text("Sign Out"))

          
          ],
        ),
      ),
    
      )
    
    );
  }
}