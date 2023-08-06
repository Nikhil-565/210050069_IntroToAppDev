
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class wrapper extends StatelessWidget {
  int a=-1;
  wrapper({super.key,required this.a});
  @override
  Widget build(BuildContext context) {
    if(a==0)
    return home();
    else
      return login();
  }
}
