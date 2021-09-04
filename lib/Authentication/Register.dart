import 'package:cowinslot/Dialog/ErrorDialog.dart';
import 'package:flutter/material.dart';

import 'CustomMethods.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(


      body: isLoading ? Center(

        child: Container(

          height: size.height/20,
          width: size.height/20,
          child: CircularProgressIndicator(),
        ),
      )


      : SingleChildScrollView(

        child: Column(


          children: [

            SizedBox(
              height: size.height / 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: size.width / 1.2,
              ),
            SizedBox(
              height: size.height / 20,
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
              child: Text("Register to Continue!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),

            ),
            SizedBox(
              height: size.height / 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "Username", Icons.account_box, _username),
              ),
            ),

            Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, "email", Icons.account_box, _email),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),

              child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "password", Icons.lock, _password),
              ),
            ),

            SizedBox(
              height: size.height / 20,
            ),
            customButton(size),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: ()=> Navigator.pop(context),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
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

      onTap: (){


        if(_username.text.isNotEmpty &&
            _email.text.isNotEmpty &&
            _password.text.isNotEmpty){
              setState(() {

                isLoading = true;
              });

              createAccount(_username.text, _email.text, _password.text)
                  .then((user){

                    if(user!=null){
                      setState(() {
                        isLoading= false;
                      });

                      showDialog(
                          context: context,
                          builder: (c){
                            return ErrorAlertDialog(message: "Registration Successful");
                          }
                      );


                    } else{
                      showDialog(
                          context: context,
                          builder: (c){
                            return ErrorAlertDialog(message: "Registration failed");
                          }
                      );

                    }

              });

        }else{
          showDialog(
              context: context,
              builder: (c){
            return ErrorAlertDialog(message: "Please enter all the required fields");
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
          child: Text("Register", style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          )
      ),
    );
  }

  Widget field(Size size, String hintText, IconData icon, TextEditingController cont) {
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
