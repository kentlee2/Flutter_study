import 'package:flutter/material.dart';
import 'package:newsApp/home/Login.dart';

class PersonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            onPressed: () => {},
            child: Text(
              "fdsfds",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.light,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
          ),
          FlatButton(
            onPressed: () => {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) {
                return new Login();
              }))
            },
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
