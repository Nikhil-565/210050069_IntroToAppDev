
import 'package:budget_tracker/pages/all_expenses.dart';
import 'package:budget_tracker/pages/categories.dart';
import 'package:budget_tracker/pages/exepenses.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
      routes:
      {
        '/home': (context) {return home();},
        '/profile': (context){return profile();},
        '/category': (context){return category();},
        '/expenses':(context){return expenses();},
        '/allExpense':(context){return all_expenses();}
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

