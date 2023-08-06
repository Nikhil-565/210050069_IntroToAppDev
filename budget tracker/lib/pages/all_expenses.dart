import 'package:budget_tracker/pages/dailogue.dart';
import 'package:budget_tracker/pages/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class all_expenses extends StatefulWidget {
  const all_expenses({super.key});

  @override
  State<all_expenses> createState() => _all_expensesState();
}

class _all_expensesState extends State<all_expenses> {
  @override
  Widget build(BuildContext context) {
    user u=ModalRoute.of(context)?.settings.arguments as user;
    List<String> img=
    [
      "food.jpg","sports.jfif","elec.webp","enter.cms","cosme.jfif","wearables.jpg","others.png"
    ];
    List indexes=[0,1,2,3,4,5,6];
    num total=0;
    return Scaffold(
      appBar: AppBar(
        title: Text("All expenses"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int index in indexes)
            StreamBuilder<DocumentSnapshot>(
                stream:u.get_data(index),
                builder: (context, snapshot) {
                  List l1=[];
                  List l2=[];
                  final p=snapshot.data?.data();
                  if(p!=null)
                    {
                      Map m=p as Map;
                      l1=m['cost'];
                      l2=m['description'];
                      // print(l1);
                      num t=0;
                      for(int i=0;i<l1.length;i++)
                      {
                        t=t+l1[i];
                      }
                      total=total+t;
                      print(total);
                    }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: l1.length,
                    itemBuilder: (BuildContext context, int i){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.blue[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 150,width: 140,child: Image(image: AssetImage('images/${img[index]}'),fit: BoxFit.cover,)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                                      child: Text("Cost: RS "+l1[i].toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                    Text("Description: ",overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                    Text(l2[i],maxLines:2,overflow:TextOverflow.clip,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(

        onPressed: (){
          showDialog(context: context, builder: (context){
            return dialogue(s: total.toString());
          });
        },
        child: Text("Get total"),
      ),
    );
  }
}
