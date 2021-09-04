import 'package:cowinslot/Authentication/Login.dart';
import 'package:cowinslot/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if(_auth.currentUser!= null){

      return Homepage();
    } else{

      return Login();
    }
  }
}
