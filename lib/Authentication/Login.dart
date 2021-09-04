import 'package:cowinslot/Authentication/Register.dart';
import 'package:cowinslot/Dialog/ErrorDialog.dart';
import 'package:flutter/material.dart';

import '../HomePage.dart';
import 'CustomMethods.dart';
import 'package:flutter/services.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(


        body: isLoading ?

        Center(

          child: Container(

            height: size.height / 20,
            width: size.height / 20,
            child: CircularProgressIndicator(),
          ),
        )


            : SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(
               height: size.height / 10,
              ),
              Container(

                width: size.width / 1.3,
                child: Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28,
                    fontWeight: FontWeight.bold,

                  ),

                ),


              ),

              Container(
                width: size.width / 1.3,
                child: Text("Login to Continue!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey,
                    fontSize: 23.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),

              ),
              SizedBox(
                height: size.height / 10,
              ),
              Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "Email", Icons.account_box, _email),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),

                child: Container(
                  width: size.width,
                  alignment: Alignment.center,
                  child: field(size, "Password", Icons.lock, _password),
                ),
              ),

              SizedBox(
                height: size.height / 10,
              ),
              customButton(size),

              SizedBox(
                height: size.height / 40,
              ),

              GestureDetector(
                onTap: () =>
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => Register())),

                child: Text("Register", style: TextStyle(

                  color: Colors.teal,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
            ],
          ),
        ),
      );

  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });


          logIn(_email.text, _password.text).then((user) {
            if (user != null) {
              print("Login Successful");
              setState(() {
                isLoading = false;
              });
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Homepage()));
            } else {
              showDialog(
                  context: context,
                  builder: (c){
                    return ErrorAlertDialog(message: "Login Failed");
                  }
              );
              setState(() {
                isLoading = false;
              });
            }



          });
        } else {
          showDialog(
              context: context,
              builder: (c) {
                return ErrorAlertDialog(
                    message: "Please insert email and password");
              }
          );
        }
      },
      child: Container(

          height: size.height / 14,
          width: size.width / 1.2,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal,
          ),
          alignment: Alignment.center,
          child: Text("Login", style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          )
      ),
    );
  }

  Widget field(Size size, String hintText, IconData icon,
      TextEditingController cont) {
    return Container(

        height: size.height / 15,
        width: size.width / 1.1,
        child: TextField(
            controller: cont,
            decoration: InputDecoration(
                prefixIcon: Icon(icon),
                hintText: hintText,
                hintStyle: TextStyle(
                    color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                )
            )
        )
    );
  }


}