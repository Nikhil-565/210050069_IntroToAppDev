import 'package:budget_tracker/pages/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dailogue.dart';
class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  String em="";
  String pass="";
  bool vis=false;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regsiter here"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(image:AssetImage('images/login.jpg'),fit: BoxFit.fill)
                ),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all()
                  ),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: '  Enter your email address',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all()
                  ),
                  child: TextField(
                    obscureText: !vis,
                    controller: password,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      hintText: '  Enter your Password',
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            vis=!vis;
                          });
                        },
                        icon: Icon(!vis?Icons.visibility:Icons.visibility_off),
                      )
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async{
                    em=email.text;
                    pass=password.text;
                    bool b=true;
                    try{
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: em
                          , password: pass);
                        }
                      on FirebaseAuthException catch(e)
                      {
                        if(e.code=='email-already-in-use')
                        {
                          showDialog(context: context, builder:(context)=>dialogue(s: "Already registerd with this email id"));
                        }else if(e.code=='invalid-email'){
                          showDialog(context: context,
                              builder: (context)=>dialogue(s: 'Invalid email id',)
                          );
                        }
                        else
                        {
                          print(e.code);
                          showDialog(context: context,
                              builder: (context)=>dialogue(s: 'Something went wrong please try again',)
                          );
                        }
                        b=false;
                      }

                    if(b)
                      {
                        FirebaseAuth.instance.currentUser?.sendEmailVerification();
                        showDialog(context: context, builder: (context)=>
                        dialogue(s: "Verify your account through a mail sent to the above id and login using your credentials"));
                      }
                  },
                  child: Text('Register')
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text("Already have an account? click here to Login",style: TextStyle(
                      color: Colors.red
                  ),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
