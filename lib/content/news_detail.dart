import 'package:flutter/material.dart';
import 'package:newsApp/bean/MovieEntity.dart';

class NewsDetail extends StatelessWidget {
  final MovieSubject bean;

  NewsDetail(this.bean);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(bean.title),
      ),
      body: Text(bean.title),
    );
  }
}

