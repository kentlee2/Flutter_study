import 'package:flutter/material.dart';

class PersonPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return  new Container(
     child: new Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         FlatButton(onPressed: ()=>{},
           child: Text("fdsfds"),
           color: Colors.blue,
           highlightColor: Colors.blue[700],
           colorBrightness: Brightness.light,

         ),
         FlatButton(onPressed: ()=>{},
           child: Text("fdsfds"),
           color: Colors.blue,
           highlightColor: Colors.blue[700],
           colorBrightness: Brightness.light,

         ),
       ],
     ),
   );
  }

}