import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'year.dart';
class Courses extends StatelessWidget {
  List course=["assets/cse.svg","assets/ece.svg","assets/it.svg","assets/eee.svg","assets/mech.svg","assets/civil.svg"];
  List c_names=["CSE","ECE",
      "IT","EEE",
    "MECH","Civil"];
  List c_name_short=["cse","ece",'it','eee','mech','civil'];
  int val;
   Courses({
    required this.val,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff7e57c2),Colors.purpleAccent,Color(0xff7e57c2)]
        )
      ),
        child: Padding(
          padding: const EdgeInsets.only(top:45.0),
          child: GridView.builder(
            padding:const EdgeInsets.all(10),
            itemCount: course.length,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,childAspectRatio: 0.62,
                mainAxisSpacing: 10,
                crossAxisSpacing:12
              ),
              itemBuilder:(context, index) {
                return InkWell(
                  onTap: ()
                  {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>Groups(val1: val,G_name:c_name_short[index],)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius:BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            elevation:20,shadowColor:Colors.grey[200],
                            child: SvgPicture.asset(course[index],height:200,width:200,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c_names[index],
                          style: GoogleFonts.lato(
                            fontSize:20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                  ),
                );
              },
          ),
        ),
      )

    );
  }
}