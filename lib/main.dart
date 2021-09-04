import 'dart:async';


import 'package:cowinslot/Authentication/auth.dart';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';





Future main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoWIN Slot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.teal),
      home: Splash(),
    );
  }
}

class  Splash extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState

    Timer(
        Duration(seconds: 4,
        ),() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Authenticate(),
      ));
    }
    );

    super.initState();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueGrey),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Image.asset(

                                'assets/cowin.png',
                               height: 100,
                              width:100,
                               ),


                        ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "CoWIN Slot",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),

                    ),
                    Text("Together We Will \n Defeat COVID19",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),


    );
  }
}
