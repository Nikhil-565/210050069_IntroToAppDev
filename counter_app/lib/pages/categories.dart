import 'package:budget_tracker/pages/user.dart';
import 'package:flutter/material.dart';

class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  List<String> c=
      [
        "Food", "Sports","Electronics","Entertainment","Cosmetics","wearables","Other"
      ];
  void tap(int index,user u)
  {
    Navigator.pushNamed(context, '/expenses',arguments: [index,u]);
  }

  @override
  Widget build(BuildContext context) {
    user u=ModalRoute.of(context)?.settings.arguments as user;
    return Scaffold(
      appBar: AppBar(title: Text("Choose catergory"),),
      body: ListView.builder(
          itemCount: c.length,
          itemBuilder: (context,index)
          {
              return Card(
                child: ListTile(
                  onTap: (){
                    tap(index,u);
                  },
                    title: Center(child: Text(c[index])),
                ),
              );
          }
    )
    );
  }
}
