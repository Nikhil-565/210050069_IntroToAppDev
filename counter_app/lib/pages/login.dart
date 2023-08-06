
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_options.dart';
import 'dailogue.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  String em="";
  String pass="";
  bool vis=false;
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
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
                    print(em);
                    print(pass);
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: em, password: pass);
                    }
                    on FirebaseAuthException catch(e)
                    {
                      print(e);
                      print(e.code);
                      if(e.code=='user-not-found')
                      {
                        showDialog(context: context,
                            builder: (context)=>dialogue(s: 'User not found',)
                        );
                      }
                      else if(e.code=='wrong-password'){
                        showDialog(context: context,
                            builder: (context)=>dialogue(s: 'Wrong password try using different password',)
                        );
                      }else if(e.code=='invalid-email'){
                        showDialog(context: context,
                            builder: (context)=>dialogue(s: 'Invalid email id',)
                        );
                      }
                      else
                      {
                        print(2);
                        showDialog(context: context,
                            builder: (context)=>dialogue(s: 'Something went wrong please try again',)
                        );
                      }
                      b=false;
                    }
                    if(b){
                      if(FirebaseAuth.instance.currentUser!.emailVerified)
                      {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home',
                                (Route<dynamic> route) => false);
                      }
                      else
                      {
                        showDialog(context: context, builder: (context)=>
                            dialogue(s: "Verify your account through a mail sent before logging in"));
                      }
                    }
                  },
                  child: Text('login')
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  child: Text("Do not have an account yet? click here to register",style: TextStyle(
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
