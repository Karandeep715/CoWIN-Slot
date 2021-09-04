import 'package:flutter/material.dart';

class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),

      ),
      body:SingleChildScrollView(
      child: Padding(

        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('CoWIN Slot',
              style: TextStyle(
                fontSize: 15.0,
                 fontWeight: FontWeight.bold,
              )
              ),
            ),
            Container(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('CoWIN Slot is an android application in which an user can search for the nearest vaccination center in a particular area.The first mass vaccination programme started in early December 2020 and the number of vaccination doses administered is updated on a daily basis here. At least 13 different vaccines (across 4 platforms) have been administered.Once vaccines are demonstrated to be safe and efficacious, they must be authorized by national regulators, manufactured to exacting standards, and distributed. WHO is working with partners around the world to help coordinate key steps in this process, including to facilitate equitable access to safe and effective COVID-19 vaccines for the billions of people who will need them.',
                    textAlign: TextAlign.justify),

              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('How to Use',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text('The CoWIN Slot android application is used to check the nearest COVID19 Vaccination center available in the particular area for the year 2021 and also the name of vaccine available in that center.The user after installing the application needs to enter the PINCODE of the particular area and the DATE for which he/she wants to check the vaccination centers then after clicking on check slots button the result is obtained on the next screen of the App with all the information about the nearest center, the name of vaccine and the timing slots.',
              textAlign: TextAlign.justify),

            ),
          ],


        ),
      ),
    ),
    );
  }
}

