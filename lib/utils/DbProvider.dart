import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static Database db;
  String tableName = "movieInfo";

  Future openSqlite() async {
    // 获取数据库文件的存储路径
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'movie.db');
    print("db:" + path);
    //根据数据库文件路径和数据库版本号创建数据库表
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
        print('db created version is $version');
      await db.execute(
          "create table movieInfo (id INTEGER PRIMARY KEY, title TEXT NOT NULL, rate INTEGER NOT NULL, imgurl )");
    }, onOpen: (Database db) async {
       print('new db opened');
    });
  }

  //插入数据
  Future<MovidBean> insert(MovidBean todo) async {
    todo.id = await db.insert(tableName, todo.toMap());
    return todo;
  }

  //获取数据
  Future<List<MovidBean>> getData() async {
    List<Map> maps =
        await db.query(tableName, columns: [ "id","title", "rate", "imgurl"]);
    if (maps == null || maps.length == 0) {
      return null;
    }
    List<MovidBean> books = [];
    for (int i = 0; i < maps.length; i++) {
      books.add(MovidBean.fromMap(maps[i]));
    }
    return books;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }

  Future close() async => db.close();
}

class MovidBean {
  int id;
  String title;
  int rate;
  String imgurl;

  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = {"id" :id,"title": title, "rate": rate, "imgurl": imgurl};
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  MovidBean.fromMap(Map map) {
    id = map["id"];
    title = map["title"];
    rate = map["rate"];
    imgurl = map["imgurl"];
  }
}
