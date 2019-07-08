import 'package:flutter/material.dart';
import 'package:newsApp/utils/DbProvider.dart';
class page2 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return LocalListWidget();
  }

}
class LocalListWidget  extends State<page2>{
  DbProvider db  = new DbProvider() ;
  @override
  Widget build(BuildContext context) {
    return null;
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  void getData() async{
    db.openSqlite();
    List<MovidBean> beanList = await db.getData();
    await db.close();
    print(beanList);
  }

}
