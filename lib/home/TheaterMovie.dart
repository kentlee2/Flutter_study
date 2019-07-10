import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:newsApp/bean/MovieEntity.dart';
import 'package:newsApp/bean/OnlineMovie.dart';
import 'package:newsApp/utils/DbProvider.dart';
class TheaterMovie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListWidget();
  }
}

class MovieListWidget extends State<TheaterMovie> with AutomaticKeepAliveClientMixin{
  ScrollController _scrollController = new ScrollController();
  DbProvider db  = new DbProvider() ;
  String loadUrl = "https://douban-api.now.sh/v2/movie/in_theaters"; //http://douban.uieee.com
  bool isPerformingRequest = false;
  List<MovidBean> movieList = new List<MovidBean>();
  List<MovieSubject> subjects = [];
  String title = '';
  int start = 1;
  int count = 5;

  @override
  void initState() {
    super.initState();
    db.openSqlite();
    loadData();
    //滑动到底了自动加载更多
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        start = start + 10;
        _loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void loadData() async {
    Response response = await Dio()
        .get(loadUrl, queryParameters: {"start": start, "count": count});
    var result = new Map<String, dynamic>.from(response.data);
//    var jsonResponse = json.decode(response.data);
    //基本的json解析方法
    OnlineMovie movie = new OnlineMovie.fromJson(result);
    //FlutterJsonBeanFactory插件生成
    MovieEntity entity = new MovieEntity.fromJson(result);
    movieList = await db.getData();
    print("请求:" + loadUrl);
    print("start:" + "$start");
    print("count:" + "$count");
    print(result);
    setState(() {
      title = entity.title;
      subjects = entity.subjects;
    });
  }

  _loadMoreData() async {

    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      Response response = await Dio()
          .get(loadUrl, queryParameters: {"start": start, "count": count});
      if (response.statusCode == 200) {
        var result = new Map<String, dynamic>.from(response.data);
        MovieEntity entity = new MovieEntity.fromJson(result);
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent -
            _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge - offsetFromBottom),
              duration: new Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }

        print(result);
        setState(() {
          subjects.addAll(entity.subjects);
          isPerformingRequest = false;
        });
      }
    }
  }

  //显示加载图
  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CupertinoActivityIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (subjects.length != 0) {
      //下划线widget预定义以供复用。
      Widget divider = Divider(color: Colors.grey[300]);
      ListView list = new ListView.separated(
        itemCount: subjects.length,
        controller: _scrollController,
        //列表项构造器
        itemBuilder: (BuildContext context, int index) {
          print("滑动到了:$index");
          if (index == subjects.length - 1) {
            return _buildProgressIndicator();
          }
          return getItem(subjects[index], index);
        },
        //分割器构造器
        separatorBuilder: (BuildContext context, int index) {
          return divider;
        },
      );
      return list;
    } else {
      return new CupertinoActivityIndicator();
    }
  }

  getItem(MovieSubject subject, var index) {
    bool alreadySaved=false;
    movieList.forEach((e){
      if(e.id==subject.id){
        alreadySaved = true;
      }

    });
   print(alreadySaved);


    var avatars = List.generate(subject.casts.length, (i) {
      if (subject.casts[i].avatars != null) {
        return Container(
            margin: EdgeInsets.only(left: i.toDouble() == 0.0 ? 0.0 : 16.0),
            child: CircleAvatar(
                backgroundColor: Colors.white10,
                backgroundImage:
                    NetworkImage(subject.casts[i].avatars.small)));
      } else {
        return Container(
            margin: EdgeInsets.only(left: i.toDouble() == 0.0 ? 0.0 : 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white10,
            ));
      }
    });
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              subject.images.large,
              width: 100.0,
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
                  subject.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  maxLines: 1,
                ),

                Row(
                  children: <Widget>[
                    Text(
                      '豆瓣评分： ${subject.rating.average}',
                      style: TextStyle(fontSize: 16, color: Colors.red),

                    ),
                    Container(
                      child: new GestureDetector(
                        child:Icon(
                          alreadySaved ? Icons.favorite : Icons.favorite_border,
                          color: alreadySaved ? Colors.red : null,
                        ),
                        onTap: (){
                          setState(() {
                            MovidBean movidBean = MovidBean(subject.id, subject.title, subject.rating.average, subject.images.medium);
                            if (alreadySaved) {
                              movieList.removeAt(index);
                              db.delete(subject.id);
                            } else {
                              movieList.add(movidBean);
                              db.insert(movidBean);
                            }
                            db.close();
                          });
                        },
                      ),
                      margin: EdgeInsets.only(left: 58.0),
                    )

                  ],
                ),
                //豆瓣评分

                //类型
                Text("类型：${subject.genres.join("、")}"),
                //导演
                Text('导演：${subject.directors[0].name}'),
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
    );

    return new Card(
      child: new InkWell(
        child: row,
        onTap: () {
          print(subject.title);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
