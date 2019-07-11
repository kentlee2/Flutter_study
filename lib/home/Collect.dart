import 'package:flutter/material.dart';
import 'package:newsApp/utils/DbProvider.dart';
import 'package:newsApp/utils/eventBus.dart';

class Collect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LocalListWidget();
  }
}

class LocalListWidget extends State<Collect> with AutomaticKeepAliveClientMixin {
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

  getItem(MovidBean bean, int index) {
    return Container(
      child: Text(bean.title),
    );
  }

  @override
  void initState() {
    super.initState();
    db.openSqlite();
    getData();
    print("init");
  }

  void getData() async {
    var beanList = await db.getData();
    setState(() {
      this.beanList = beanList;
    });
    eventBus.on<TransEvent>().listen((TransEvent data){
        MovidBean mBean = data.bean;
        if(data.isAdd){
          beanList.add(mBean);
        }else{
          var temp ;
          beanList.forEach((e){
            if(e.id==mBean.id){
              temp = e;
            }
          });
          beanList.remove(temp);
        }
        setState(() {});
    });
  }

  @override
  bool get wantKeepAlive => true;
}
