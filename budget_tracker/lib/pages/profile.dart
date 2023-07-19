
import 'package:flutter/material.dart';
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String name='Edit your name';
  int total=89372;
  String most_used_category="Food";
  String no="Edit your phone no";
  String email="email - field";
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          // backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: Colors.blue[700],
            title: Text("MY PROFILE"),
            centerTitle: true,
            actions: [
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
                            Expanded(child: Image(image:AssetImage('images/flag.jpg'),height: 200,fit: BoxFit.fill,)),
                          ],
                        ),
                        SizedBox(height: 50,child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){
                            },icon: Icon(Icons.camera_alt),),
                          ],
                        ),)
                      ],
                    ),

                    CircleAvatar(
                    backgroundImage: AssetImage('images/ro.jpg'),
                    radius: 80,
                  ),
                  IconButton(onPressed: (){
                  }, icon: Icon(Icons.camera_alt),color: Colors.white,)]
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue)),
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
                                Navigator.pop(context);
                              }, child: Text("submit"))
                            ],
                          );
                        });
                      }, icon: Icon(Icons.edit))
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
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Most Purchased: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue),),
                                      Text('$most_used_category',style: TextStyle(fontSize: 18,color: Colors.blue),)
                                    ],
                                  )
                                  ),
                                ),
                            ),
                          ],
                        ),
                      ),
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
                                          Text("Total Expenses : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue),),
                                          Text('RS $total',style: TextStyle(fontSize: 18,color: Colors.blue),)
                                        ]
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                        Text("Email-Id : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue),),
                                        Text('$email',style: TextStyle(fontSize: 18,color: Colors.blue),)
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                        Text("Phone no : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('$no',style: TextStyle(fontSize: 18,color: Colors.blue),),
                                            IconButton(onPressed: (){
                                              TextEditingController nam=TextEditingController(text: no);
                                              showDialog(context: context, builder: (context){
                                                return AlertDialog(
                                                  title: Text('enter your Phone no'),
                                                  actions: [
                                                    TextField(

                                                      controller: nam,
                                                    ),
                                                    TextButton(onPressed: ()async{
                                                      no=nam.text;
                                                      Navigator.pop(context);
                                                    }, child: Text("submit"))
                                                  ],
                                                );
                                              });
                                            }, icon: Icon(Icons.edit))
                                          ],
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  ),
              ],
            ),
          ),
        );
  }
}


