import 'package:appathon/Pages/profilepages/profile.dart';
import 'package:appathon/firestore_services/storing.dart';
import 'package:appathon/provider/userinfoprovider.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';



class ProfileEditForm extends StatefulWidget {
  final String name;
  final String phone;
  final String collage;
  final String branch;
  final String year;
  final String rollno;

  const ProfileEditForm({
    super.key, required this.name, required this.phone, required this.collage, required this.branch, required this.year, required this.rollno
   });
  @override
  _ProfileEditFormState createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController collage = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController branch = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController rollno = TextEditingController();
  Future <void> _showdailog() async{
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              ListTile(
                onTap: () {
                  TakeImage();
                },
                leading: Icon(Icons.camera_alt_outlined),
                title: Text("Camera"),
              ),
              ListTile(
                onTap: () {
                getImage();
                },
                leading: Icon(Icons.picture_in_picture_sharp),
                title: Text("Gallery"),
              )
            ],
          );
        });
  }

  File? _image;
  Future getImage() async {
    final _image1 = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(_image1!.path);
    });
  }

  Future TakeImage() async {
    final _image2 = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(_image2!.path);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text=widget.name;
    phone.text=widget.phone;
    collage.text=widget.collage;
    branch.text=widget.branch;
    year.text=widget.year;
    rollno.text=widget.rollno;
  }
  @override
  Widget build(BuildContext context) {
    double _height=MediaQuery.of(context).size.height;
    //double _width=MediaQuery.of(context).size.width;
    return Consumer<Userinfo>(
      builder: (context, value, child) => Scaffold(
        body:
       SingleChildScrollView(
        child: Column(
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Container(
                height: _height/3.5,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xfffa6961),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50))),
              ),
              Positioned(
                bottom: -50,
                left: 120,
                child: Container(
                  height: 150,
                  width: 150,
                  child: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: _image != null
                          ? ClipRRect(borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                                _image!,
                                fit: BoxFit.fill,
                              ),
                          )
                          : Center(child: Text(""))),
                ),
              ),
              Positioned(
                bottom: -20,
                left: 240,
                child: IconButton(
                    onPressed: () {
                      _showdailog();
                    },
                    icon: Icon(
                      Icons.add_a_photo_sharp,
                      size: 32,
                      color: Colors.black,
                    )),
              )
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                        labelText: 'Phone',
                        suffixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller:rollno,
                    decoration: InputDecoration(
                        labelText: 'Roll no',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: branch,
                    decoration: InputDecoration(
                        labelText: 'Branch',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: collage,
                    decoration: InputDecoration(
                        labelText: 'Collage',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: year,
                    decoration: InputDecoration(
                        labelText: 'Year',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xfffa6961)),
              onPressed: () {
              update_toDB(context,name.text, phone.text, rollno.text, branch.text, collage.text,year.text);
                final provider = Provider.of<Userinfo>(context);
                provider.getdata();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
      )
    );
  }
}