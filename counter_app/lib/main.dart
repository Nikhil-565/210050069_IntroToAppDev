import 'package:flutter/material.dart';

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
  int counter=0;
  bool dark=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: dark? Colors.grey[850]: Colors.grey[300],
        appBar: AppBar(title: Center(child: Text('Counter App',style: TextStyle(color: dark? Colors.white: Colors.black ),)),
        backgroundColor: dark? Colors.black: Colors.grey[400],),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: dark? Colors.white: Colors.grey[800],),onPressed: (){setState(() {
                      dark=!dark;
                    });},
                    child: dark? Text("Light mode",style: TextStyle(color:Colors.black)) : Text("Dark mode",style: TextStyle(color:Colors.grey[300]) ,)
                    ),
              )],
            ),
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: dark? Colors.grey[300] : Colors.black,
                  radius: 80,
                  child: Text(counter.toString(),
                  style: TextStyle(
                    fontSize: 50
                  ),),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: (){setState(() {
                  counter=counter+1;
                });},
                child: Icon(Icons.add),
              ),
            )
            ,
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: (){setState(() {
                  counter=counter-1;
                });},
                child: Icon(Icons.remove),
              ),
            )
          ],
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}


