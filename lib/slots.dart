import 'package:flutter/material.dart';

class Slot extends StatefulWidget {

  final List slots;



  const Slot({Key key, this.slots}) : super(key: key);
  @override
  _SlotState createState() => _SlotState();


}

class _SlotState extends State<Slot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Available Slots',

        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),

      ),
      centerTitle: true,
      ),
      body: Container(

        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(itemCount: widget.slots.length,


               itemBuilder: (context, index) {
                 return Container(
                   padding: EdgeInsets.all(10),
                   margin: EdgeInsets.all(10),
                   color: Colors.grey.shade800,
                   height: 230,

                   child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [

                         Text('Center ID - ' +
                             widget.slots[index]['center_id'].toString(),
                           style: TextStyle(

                               fontSize: 16),
                         ),
                         Text('Center Name - ' +
                             widget.slots[index]['name'].toString(),
                           style: TextStyle(

                               fontSize: 16),
                         ),

                         Text('Center Address - ' +
                             widget.slots[index]['address'].toString(),
                           style: TextStyle(

                               fontSize: 16),
                         ),
                         Divider(),

                         Text('Vaccine Name - ' +
                             widget.slots[index]['vaccine'].toString(),
                           style: TextStyle(

                               fontSize: 16),
                         ),

                         Divider(),

                         Text(
                           'Slots - ' + widget.slots[index]['slots'].toString(),
                           style: TextStyle(

                               fontSize: 16),
                         ),
                       ]),
                 );
               },

      ),
      ),
    );
  }




}
