import 'package:flutter/material.dart';
class Toast{
  static show(BuildContext context,String msg){
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(msg)));
  }
}