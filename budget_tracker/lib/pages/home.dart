
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.monetization_on_rounded,color: Colors.white,),
              Text("BUDGET TRACKER"),
            ],
          ),
          actions: [
            IconButton(onPressed: ()async{
              await FirebaseAuth.instance.signOut();
              print(FirebaseAuth.instance.currentUser);
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            }, icon:Icon(Icons.logout),
            )
          ],
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(onPressed: (){
                      Navigator.pushNamed(context, '/profile');
                    },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal:16.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.account_circle_sharp,size: 40,color: Colors.white,),
                            Text(
                              "Profile",
                              style: TextStyle(fontSize: 30,color: Colors.white),),
                          ],
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),),
                  ),
                ),
                Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(onPressed: (){
                      Navigator.pushNamed(context, '/category');
                    },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal:16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.category,color: Colors.white,size: 40,),
                            Text(
                              "Catogeries",
                              style: TextStyle(fontSize: 30,color: Colors.white),),
                          ],
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),),
                  ),
                ),
                Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(onPressed: (){
                      Navigator.pushNamed(context, '/allExpense');
                    },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal:16.0),
                        child: Row(
                          children: [
                            Icon(Icons.account_balance,color: Colors.white,size: 40,),
                            Text(
                              "All Expenses",
                              style: TextStyle(fontSize: 30,color: Colors.white),),
                          ],
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}

