import 'package:budget_tracker/pages/Loading.dart';
import 'package:budget_tracker/pages/all_expenses.dart';
import 'package:budget_tracker/pages/categories.dart';
import 'package:budget_tracker/pages/exepenses.dart';
import 'package:budget_tracker/pages/login.dart';
import 'package:budget_tracker/pages/register.dart';
import 'package:budget_tracker/pages/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'pages/home.dart';
import 'pages/profile.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  User? user;
  bool load=true;
  int a=-1;
  Future  getcurrentuser() async{
    // print('1');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    this.user=await FirebaseAuth.instance.currentUser;
    if(user==null)
    {
      a=1;
    }
    else
    {
      a=0;
    }
    setState(() {
      load=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    getcurrentuser();
    return MaterialApp(
      home: load?loading():wrapper(a: a,),
      routes:
      {
        '/home': (context) {return home();},
        '/profile': (context){return profile();},
        '/category': (context){return category();},
        '/expenses':(context){return expenses();},
        '/login':(context) =>login(),
        '/register': (context) =>register(),
        '/allExpense':(context)=>all_expenses()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

