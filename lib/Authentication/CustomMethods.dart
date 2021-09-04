

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'Login.dart';



Future<User> createAccount(String username, String email, String password) async {



  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User user = (await _auth.createUserWithEmailAndPassword(
        email: email, password: password)).user;


    if (user != null) {
      print("Account created succesfull");
      return user;
    } else {
      print("Account creation failed");
      return user;
    }
  } catch(e) {
    print(e);
    return null;
  }
  }

  Future<User> logIn(String email, String password) async {

  FirebaseAuth _auth = FirebaseAuth.instance;


  try{

    User user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;

    if(user!=null){
      print("Login Successfull");
      return user;

    }
    else {
      print("Login Failed");
      return user;
    }
  } catch(e) {
    print(e);
    return null;
  }
  }


  Future logOut(BuildContext context) async {

  FirebaseAuth _auth = FirebaseAuth.instance;


  try{


    await _auth.signOut().then((value){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Login()));
    });
  } catch(e) {

    print("error");
  }
  }