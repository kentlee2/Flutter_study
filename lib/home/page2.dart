import 'package:flutter/material.dart';
import 'package:newsApp/utils/DbProvider.dart';

class page2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LocalListWidget();
  }
}

class LocalListWidget extends State<page2> with AutomaticKeepAliveClientMixin {
  DbProvider db = new DbProvider();

  List<MovidBean> beanList = new List<MovidBean>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget divider = Divider(color: Colors.grey[300]);
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return getItem(beanList[index], index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return divider;
        },
        itemCount: beanList.length);
  }

  getItem(MovidBean bean, int index) {}

  @override
  void initState() {
    super.initState();
    db.openSqlite();
    getData();
    print("init");
  }

  void getData() async {
    beanList = await db.getData();
    await db.close();
  }

  @override
  bool get wantKeepAlive => true;
}
