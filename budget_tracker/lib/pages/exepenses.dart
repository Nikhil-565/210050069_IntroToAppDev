
import 'package:flutter/material.dart';

class expenses extends StatefulWidget {
  const expenses({super.key});

  @override
  State<expenses> createState() => _expensesState();
}

class _expensesState extends State<expenses> {
  List<String> c=
  [
    "Food", "Sports","Electronics","Entertainment","Cosmetics","Recharge","Other"
  ];
  List<String> img=
  [
    "food.jpg","sports.jfif","elec.webp","enter.cms","cosme.jfif","recharge.png","others.png"
  ];
  String cat="";
  var l1=[50];
  List l2=["An example"];
  int index=0;
  String des="";
  int cost=0;
  num total=0;
  num gettotal()
  {
    num t=0;
    for(int i=0;i<l1.length;i++)
      {
        t=t+l1[i];
      }
    return t;
  }
  List<int> sizes=[];
  // void get_exenses()
  // {
  //   int temp=0;
  //   for(int i=0;i<c.length;i++)
  //     {
  //       sizes.add(temp);
  //       temp=temp+l1[i].length;
  //     }
  //   sizes.add(temp);
  // }
  @override
  Widget build(BuildContext context) {
    index=ModalRoute.of(context)!.settings.arguments as int;
    // if(index==-1) get_exenses();
    total=  gettotal();
    cat=c[index];
        return Scaffold(
          backgroundColor: Colors.blue[50],
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$cat"),
                Text(" Rs $total")
              ],
            ),

          ),
          body:
          GridView.builder(
                        itemCount: l1.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 10.0 / 10.0,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 5
                        ),
                        itemBuilder: (BuildContext context, int i){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[300],
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue,
                                    offset: const Offset(
                                      3.0,
                                      3.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow, //BoxShadow
                                ],
                              ),
                              height: 1,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage('images/${img[index]}'),
                                      fit: BoxFit.cover,
                                      ),
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Rs "+(l1[i].toString()),style: TextStyle(fontSize: 20,color: Colors.white),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(l2[i],style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ;
                        },
                      ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: FloatingActionButton(onPressed: (){
                  Navigator.pushNamed(context, '/profile');
                },
                  backgroundColor: Colors.red,
                child: Icon(Icons.account_circle_sharp,color: Colors.white,),),
              ),
              Visibility(
                visible: index!=-1?true:false,
                child: FloatingActionButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder:(context)=> AlertDialog(
                          title: Text("Expense"),
                          content: Container(
                            height: 150,
                            child: Column(
                              children: [
                                TextField(
                                  onChanged: (co){
                                    cost=int.parse(co);
                                  } ,
                                  keyboardType: TextInputType.number,
                                  autofocus: true,
                                  decoration: InputDecoration(hintText: "Enter the vale of expense"),
                                ),
                                TextField(
                                  onChanged: (de){
                                    des=de;
                                  },
                                  autofocus: true,
                                  decoration: InputDecoration(hintText: "Enter the description"),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: ()async{
                              l1.add(cost);
                              l2.add(des);
                              setState(() {

                              });
                              Navigator.pop(context);
                            }, child: Text("SUBMIT"))
                          ],
                        )
                    );
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.red,
                ),
              )
            ],
          )
        );
  }
}
