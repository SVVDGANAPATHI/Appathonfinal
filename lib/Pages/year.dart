import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'finalscreen.dart';

class Groups extends StatelessWidget {
  int val1;
  String G_name;
  List years=["First Year","Second Year","Third Year","Fourth Year"];
  Groups({required this.val1,required this.G_name,super.key});

  @override
  Widget build(BuildContext context) {

     void buttonpressed(int x)
  { 
    showDialog(
      context:context, 
      builder: (context) => AlertDialog(
        content:Container(
          height: 150,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
               InkWell(
                onTap: ()
                { int sem_no=1;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context)=>
                      screen2(
                        col_id:val1 , 
                        col_name:G_name , 
                        col_year: x, 
                        col_sem: sem_no)
                    ));
                },
                 child: Text("1st Semister",
                 style:GoogleFonts.lato(
                  fontWeight:FontWeight.bold,
                  fontSize:20,
                 fontStyle:FontStyle.italic
                 ),),
               ),
               SizedBox(height:40,),
               InkWell(
                onTap: ()
                {
                  int sem_no=2;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context)=>
                      screen2(
                        col_id:val1 , 
                        col_name:G_name , 
                        col_year: x, 
                        col_sem: sem_no)
                    ));
                },
                 child: x!=4?Text("2nd Semister",
                 style:GoogleFonts.lato(
                  fontWeight:FontWeight.bold,
                  fontSize:20,
                 fontStyle:FontStyle.italic)
                 ):Text(""),
               )
          ]
          ),
        ),
      ),
      );
  }
    return Scaffold(
      backgroundColor: Color(0xff7e57c2),
      body: 
      Padding(
        padding: const EdgeInsets.only(top:170.0,left:10,right:10),
        child: ListView.builder(
          itemCount: years.length,
          itemBuilder:(context, index) {
            return InkWell(
              onTap:()=>buttonpressed(index+1),
              child: Padding(
                padding: const EdgeInsets.only(top:10.0,left:10,right:10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: ListTile(
                    title:Padding(
                      padding: const EdgeInsets.only(top:30.0,left:20),
                      child: Text(years[index],
                      style: TextStyle(fontSize:25,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }, ),
      )
      
    );
  }
}
