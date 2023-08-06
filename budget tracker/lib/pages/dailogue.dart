import 'package:flutter/material.dart';

class dialogue extends StatelessWidget {
  String s = "";
  dialogue({super.key,required this.s});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(s),
      actions: [
        ElevatedButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text("OK"))
      ],
    );
  }
}