import 'package:cowinslot/Authentication/CustomMethods.dart';
import 'package:cowinslot/about.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cowinslot/slots.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController pincodecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  String dropdownValue = '01';
  List slots = [];

  fetchingslots() async{

    await http.get(Uri.parse('https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
        pincodecontroller.text +
        '&date=' +
        datecontroller.text +
        '%2F' +
        dropdownValue +
        '%2F2022'))
        .then((value){

      Map result = jsonDecode(value.body);

      setState((){

        slots = result['sessions'];

      });
      Navigator.push(context,MaterialPageRoute(builder: (context)=> Slot( slots: slots,)));


    });



  }



  @override
  Widget build(BuildContext context) {

    return WillPopScope(

      onWillPop: _onBackPressed,
      child: Scaffold(
      appBar: AppBar(title: Text('CoWIN Slot',
      style: TextStyle(
             fontSize: 23.0,
             fontWeight: FontWeight.bold,
      ),
      ),

      centerTitle: true,

      ),
        drawer: Drawer(


          child: ListView(

            children:[


                 DrawerHeader(

                   decoration: BoxDecoration(

                     color: Colors.teal,
                     image: DecorationImage(

                       image: AssetImage(
                         'assets/cowinimage6.png'

                       ),
                       fit: BoxFit.fill,
                     ),
                   ),


                ),



              InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (_) => Homepage()));
                },
                child: ListTile(

                  title: Text('Home Page'),
                  leading: Icon(Icons.home, color: Colors.teal),
                ),

              ),
              InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (_) => About()));
                },
                child: ListTile(

                  title: Text('About'),
                  leading: Icon(Icons.help, color: Colors.teal),
                ),


              ),
              InkWell(

                onTap: () => logOut(context),
                child: ListTile(
                  title: Text('Log Out'),
                  leading: Icon(Icons.logout, color: Colors.teal),
                ),
              ),
              Divider(),
            ],
          ),

        ),

        body:

         SingleChildScrollView(

        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: Column(

            children: [
              //Container(
              //  margin: EdgeInsets.all(20),
              //  height: 250,
               // child: Image.asset('assets/CoWINimage.png'),
             // ),

              CarouselSlider(

                  items: [

                   Container(
                    margin:EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                     borderRadius:BorderRadius.circular(8.0),
                     image: DecorationImage(
                      image: AssetImage("assets/Cowinimage2.jpeg"),
                       fit: BoxFit.cover,



                   ),
                 ),
                ),
                Container(
                margin:EdgeInsets.all(8.0),
                 decoration: BoxDecoration(
                   borderRadius:BorderRadius.circular(10.0),
                  image: DecorationImage(
                   image: AssetImage("assets/cowinimage4.jpeg"),
                  fit: BoxFit.cover,
                ),
               ),
                ),

               Container(
                 margin:EdgeInsets.all(6.0),
                 decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(8.0),
                   image: DecorationImage(
                    image: AssetImage("assets/cowinimage7.jpg"),
                   fit: BoxFit.cover,
                  ),
               ),
                ),
                    Container(
                      margin:EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/cowinimage5.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
                options: CarouselOptions(
                 height: 180.0,
                 enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                 viewportFraction: 0.8,
              ),


      ),

              Padding(padding: EdgeInsets.all(25.0)),

              Container(
                child: Text(
                 "Pincode : ",

                 style: TextStyle(
                           fontSize: 17.0,
                           fontWeight: FontWeight.bold,
                   ),


               ),
                alignment: Alignment.centerLeft,
              ),
              TextField(

                  controller: pincodecontroller,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(

                      hintText: 'Enter PIN code'),

              ),

              Container(

                child: Text(

                  "Date :",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),

                ),
                alignment: Alignment.centerLeft,
              ),


              Row(children: [

                Expanded(
                  child: Container(
                    height: 60,
                    child: TextField(

                        controller: datecontroller,
                        decoration: InputDecoration(hintText: 'Enter date')
                    ),
                  ),

                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 52,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,

                      underline: Container(
                        color: Colors.grey.shade400,
                        height: 2,

                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['01', '02', '03', '04','05','06','07','08','09','10','11','12']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ]
              ),
              SizedBox(height: 20),
              Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)),
                      onPressed: (){

                        fetchingslots();

                      },
                      child: Text('Check Slots'),
                  )
              )
            ],
          ),
        ),
      ),

    ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(

      context: context,
      builder: (context)=>AlertDialog(

        title: Text("Do you want to exit?"),
        actions:[

          TextButton(
            child: Text("Yes"),
            onPressed:()=> Navigator.pop(context,true),
          ),
          TextButton(
            child: Text("No"),
            onPressed:()=> Navigator.pop(context,false),
          ),
        ],
      ),
    );
  }
  }

