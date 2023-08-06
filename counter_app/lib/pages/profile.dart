
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import 'package:image_picker/image_picker.dart';
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String url='https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png';
  String name='Edit your name';
  String cover_url='';
  String img_url='';
  String about="About me";
  String most_used_category="Food";
  String no="Edit your phone no";
  String email="email - field";
  File? imagefile;
  File inital=File('C:\Users\DELL\AndroidStudioProjects\budget_tracker\images\elec.webp');
  File? imagefile2;
  @override
  Widget build(BuildContext context) {
    user u=ModalRoute.of(context)?.settings.arguments as user;
    return StreamBuilder<DocumentSnapshot>(
      stream: u.get_prfoile(),
      builder: (context, snapshot) {
        final profile=snapshot.data?.data();
        if(profile!=null)
          {
            final map =profile as Map;
            name=profile['name'];
            no =profile['phone'];
            email=profile['email'];
            about=profile['about'];
            img_url=profile['dp'];
            cover_url=profile['cover'];
          }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          // backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: Colors.blue[700],
            title: Text("MY PROFILE"),
            centerTitle: true,
            actions: [
                PopupMenuButton<String>(
                          onSelected: (String result) {
                            // Handle the selected option here
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: Text('Are you sure you want to delete'),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel')),
                                      TextButton(onPressed: ()async{
                                        User? user = FirebaseAuth.instance.currentUser;
                                          await user?.delete();
                                          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                                      }, child: Text('Yes'))
                                    ],
                                  )
                                ],
                              );
                            });
                      },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                      value: 'option_1',
                      child: Text('Delete Account'),
                      ),
                  ],
                  )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Image(image: cover_url!=''?NetworkImage(cover_url):NetworkImage(url),height: 200,fit: BoxFit.cover,)),
                          ],
                        ),
                        SizedBox(height: 50,child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: ()async{
                              ImagePicker imagePicker = ImagePicker();
                              final file = await imagePicker.pickImage(source: ImageSource.gallery);
                              if(file?.path!=null)
                              {
                                imagefile2=File(file!.path);
                                cover_url=await u.set_cover(imagefile2!.path);
                              }
                              await u.update_profile(name, no,about,cover_url,img_url);
                            },icon: Icon(Icons.camera_alt),color: Colors.blue,),
                          ],
                        ),)
                      ],
                    ),

                    CircleAvatar(
                    backgroundImage: img_url!=''?NetworkImage(img_url):NetworkImage(url),
                    radius: 80,
                  ),
                  IconButton(onPressed: ()async{
                    ImagePicker imagePicker = ImagePicker();
                      final file = await imagePicker.pickImage(source: ImageSource.gallery);
                      if(file?.path!=null)
                      {
                        imagefile2=File(file!.path);
                        img_url=await u.set_images(imagefile2!.path);
                      }
                      await u.update_profile(name, no,about,cover_url,img_url);
                  }, icon: Icon(Icons.camera_alt),color: Colors.white,)]
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue[800])),
                      IconButton(onPressed: (){
                        TextEditingController nam=TextEditingController(text: name);
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text('enter your name'),
                            actions: [
                              TextField(
                                controller: nam,
                              ),
                              TextButton(onPressed: ()async{
                                name=nam.text;
                                await u.update_profile(name, no,about,cover_url,img_url);
                                Navigator.pop(context);
                              }, child: Text("submit"))
                            ],
                          );
                        });
                      }, icon: Icon(Icons.edit),color: Colors.blue,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                color: Colors.grey[200],
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Email-Id : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue[800]),),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('${u.email}',style: TextStyle(fontSize: 18,color: Colors.blue[800]),),
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                color: Colors.grey[200],
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Phone no : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue[800]),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('$no',style: TextStyle(fontSize: 18,color: Colors.blue[800]),),
                                            IconButton(onPressed: (){
                                              TextEditingController nam=TextEditingController(text: no);
                                              showDialog(context: context, builder: (context){
                                                return AlertDialog(
                                                  title: Text('enter your Phone no'),
                                                  actions: [
                                                    TextField(
                                                      keyboardType: TextInputType.number,
                                                      controller: nam,
                                                    ),
                                                    TextButton(onPressed: ()async{
                                                      no=nam.text;
                                                      await u.update_profile(name, no,about,cover_url,img_url);
                                                      Navigator.pop(context);
                                                    }, child: Text("submit"))
                                                  ],
                                                );
                                              });
                                            }, icon: Icon(Icons.edit,),color: Colors.blue,)
                                          ],
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                color: Colors.grey[200],
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("About me : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue[800]),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('$about',style: TextStyle(fontSize: 18,color: Colors.blue[800]),),
                                            IconButton(onPressed: (){
                                              TextEditingController nam=TextEditingController(text: about);
                                              showDialog(context: context, builder: (context){
                                                return AlertDialog(
                                                  title: Text('Write about you'),
                                                  actions: [
                                                    TextField(
                                                      controller: nam,
                                                    ),
                                                    TextButton(onPressed: ()async{
                                                      about=nam.text;
                                                      await u.update_profile(name, no,about,cover_url,img_url);
                                                      Navigator.pop(context);
                                                    }, child: Text("submit"))
                                                  ],
                                                );
                                              });
                                            }, icon: Icon(Icons.edit),color: Colors.blue,)
                                          ],
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),

                  ),
              ],
            ),
          ),
        );
      }
    );
  }
}


