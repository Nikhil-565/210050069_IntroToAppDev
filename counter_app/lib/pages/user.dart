import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class user{
  String uid='';
  String email='';
  String name='';
  String no='';
  int total=0;
  final CollectionReference profile= FirebaseFirestore.instance.collection('ud');
  final CollectionReference fo= FirebaseFirestore.instance.collection('food');
  final CollectionReference sport= FirebaseFirestore.instance.collection('sports');
  final CollectionReference elec= FirebaseFirestore.instance.collection('electronics');
  final CollectionReference enter= FirebaseFirestore.instance.collection('entertainment');
  final CollectionReference comso= FirebaseFirestore.instance.collection('comsmotics');
  final CollectionReference wearable= FirebaseFirestore.instance.collection('wearables');
  final CollectionReference other= FirebaseFirestore.instance.collection('others');

  user()
  {}

  Future<String> set_cover(String path)async {
    Reference root=FirebaseStorage.instance.ref();
    Reference folder=root.child('cover');
    Reference image=folder.child('uid');
    image.putFile(File(path));
    return image.getDownloadURL();
  }


  Future<String> set_images(String path)async {
    Reference root=FirebaseStorage.instance.ref();
    Reference folder=root.child('images');
    Reference image=folder.child('uid');
    image.putFile(File(path));
    return image.getDownloadURL();
  }

  Future set_data() async{
    final u= await FirebaseAuth.instance.currentUser;
    this.uid=u!.uid;
    this.email=u.email!;
  }

  Stream<DocumentSnapshot> get_prfoile() {
    return profile.doc(uid).snapshots();
  }

  Future update_profile(String name,String phone,String about,String cover,String dp) async{
    print(cover);
  await profile.doc(uid).set({
    'name': name,
    'phone':phone,
    'email':email,
    'about':about,
    'cover': cover,
    'dp': dp
  });
}
  Stream<DocumentSnapshot> get_data(int index){
    if(index==0)
    return fo.doc(uid).snapshots();
    else if(index==1)
      return sport.doc(uid).snapshots();
    else if(index==2)
      return elec.doc(uid).snapshots();
    else if(index==3)
      return enter.doc(uid).snapshots();
    else if(index==4)
      return comso.doc(uid).snapshots();
    else if(index==5)
      return wearable.doc(uid).snapshots();
    else
      return other.doc(uid).snapshots();
  }


  Future update_data(int index,List value,List des )async
  {
    if(index==0)
      await fo.doc(uid).set({
        'cost': value,
        'description': des,
      });
    if(index==1)
      await sport.doc(uid).set({
        'cost': value,
        'description': des,
      });
    if(index==2)
      await elec.doc(uid).set({
        'cost': value,
        'description': des,
      });
    if(index==3)
      await enter.doc(uid).set({
        'cost': value,
        'description': des,
      });
    if(index==4)
      await comso.doc(uid).set({
        'cost': value,
        'description': des,
      });
    if(index==5)
      await wearable.doc(uid).set({
        'cost': value,
        'description': des,
      });
    if(index==6)
      await other.doc(uid).set({
        'cost': value,
        'description': des,
      });

  }

}