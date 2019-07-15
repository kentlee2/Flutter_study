import 'package:flutter/material.dart';
import 'package:newsApp/utils/DbProvider.dart';
import 'package:newsApp/utils/eventBus.dart';

class Collect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LocalListWidget();
  }
}

class LocalListWidget extends State<Collect>
    with AutomaticKeepAliveClientMixin {
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
    var avatarStr = bean.actor.split("、");
    var avatars = List.generate(avatarStr.length, (i) {
      return Container(
          margin: EdgeInsets.only(left: i.toDouble() == 0.0 ? 0.0 : 16.0),
          child: CircleAvatar(
              backgroundColor: Colors.white10,
              backgroundImage: NetworkImage(avatarStr[i])));
    });
    return Container(
      child: Container(
        margin: EdgeInsets.only(left: 8.0),
        height: 150.0,
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                bean.imgurl,
                width: 100,
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 8.0),
              height: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //电影名称
                children: <Widget>[
                  Text(
                    bean.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    maxLines: 1,
                  ),

                  Row(
                    children: <Widget>[
                      Text(
                        '豆瓣评分： ${bean.rate}',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
                  ),
                  //豆瓣评分

                  //类型
                  Text("类型：${bean.movieType}"),
                  //导演
                  Text('导演：${bean.director}'),
                  //演员
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      children: <Widget>[
                        Text('主演：'),
                        Row(
                          children: avatars,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
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
    eventBus.on<TransEvent>().listen((TransEvent data) {
      MovidBean mBean = data.bean;
      if (data.isAdd) {
        beanList.add(mBean);
      } else {
        var temp;
        beanList.forEach((e) {
          if (e.id == mBean.id) {
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
