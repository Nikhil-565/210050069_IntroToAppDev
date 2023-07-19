
import 'package:flutter/material.dart';

class all_expenses extends StatelessWidget {
  const all_expenses({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> img=
    [
      "food.jpg","sports.jfif","elec.webp","enter.cms","cosme.jfif","recharge.png","others.png"
    ];
    List l1=[50];
    List l2=["an example"];
    List indexes=[0,1,2,3,4,5,6];
    return Scaffold(
      appBar: AppBar(
        title: Text("All expenses"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int index in indexes)
                  ListView.builder(
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
                  )
          ],
        ),
      ),
    );
  }
}
