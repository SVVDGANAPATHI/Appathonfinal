import 'package:appathon/Pages/courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff7e57c2),Colors.purpleAccent,Color(0xff7e57c2)]
          )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom:20.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:60.0,left:20),
                  child: Text("Hi,Champion!",
                  style:GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize:26,fontWeight:FontWeight.w700),),
                ),
                SizedBox(height: 20,),
                 GestureDetector(
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder:(context) => Courses(val:1),));
                  },
                  child: container(name:"Aditya Engineering College",)),
                 SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context) => Courses(val:2),));
                  },
                  child: container(name:"Aditya College of Engineering\nand Technology",)),
                 SizedBox(height:20,),
                 GestureDetector(
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder:(context) => Courses(val:3),));
                  },
                  child: container(name:"Aditya College of Engineering",))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
///////////////////////////////////////////////////////////////
class container extends StatelessWidget {
  String name;
  container(
    { 
    required this.name,
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20,),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.circular(25)),
         height:250,width:350,
         child: Stack(children: [
           Positioned(
             child: SizedBox(height:200,width:340,
               child: SvgPicture.asset("assets/bag.svg",),
             ),
           ),
         Positioned(bottom:0,left:10,child:
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: RichText(
             text:TextSpan(
               text:name,
               style:GoogleFonts.aBeeZee(fontSize:23,color:Colors.black,fontWeight:FontWeight.bold)
             ) ),
         ))
         ],)
       ),
    );
  }
}