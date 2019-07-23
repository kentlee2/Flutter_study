import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsApp/bean/MovieEntity.dart';
import 'package:newsApp/bean/movie_detail_bean.dart';
import 'package:newsApp/utils/Api.dart';

import 'DetailTitleWidget.dart';

class NewsDetail extends StatefulWidget {
  final MovieSubject bean;

  NewsDetail(this.bean);

  @override
  State<StatefulWidget> createState() => _DetailPageState(bean);
}

class _DetailPageState extends State<NewsDetail> {
  final MovieSubject bean;
  Color pickColor = Color(0xffffffff); //默认主题色
  MovieDetailBean detailBean;

  _DetailPageState(this.bean);

  @override
  void initState() {
    super.initState();
    requestData();
  }

  void requestData() async {
    MovieDetailBean detailBean = await API.getMovieDetail(bean.id);
    print(detailBean.title);
    setState(() {
      this.detailBean = detailBean;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (detailBean != null) {
      return Scaffold(
          backgroundColor: pickColor,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text("电影"),
                centerTitle: true,
                pinned: true,
                backgroundColor: Colors.blue,
              ),
              SliverToBoxAdapter(child: DetailTitleWidget(detailBean)),
              sliverTags(),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    detailBean.summary,
                    softWrap: true,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              sliverCasts(),
              sliverPhotos()
            ],
          ));
    } else {
      return Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }
  }

  SliverToBoxAdapter sliverPhotos() {
    var w = MediaQuery.of(context).size.width / 5 * 3;
    var h = w / 727 * 488;
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("预告片/剧照", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  '全部 ${detailBean.photos.length} >',
                  style: TextStyle(fontSize: 12.0),
                )
              ],
            ),
          ),
          Container(
            height: 150,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(right: 2.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Image.network(
                              detailBean.trailers[0].medium,
                              width: w,
                              height: h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: w,
                            height: h,
                            child: Icon(
                              Icons.play_circle_outline,
                              size: 40.0,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.only(
                                left: 4.0, right: 4.0, top: 2.0, bottom: 2.0),
                            child: Text(
                              '预告片',
                              style: TextStyle(
                                  fontSize: 11.0, color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 232, 145, 66),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {

                    },
                  );
                } else {
                  return Container(
                    child: Image.network(
                      detailBean.photos[index].image,
                      fit: BoxFit.fill,
                      width: w,
                      height: h,
                    ),
                  );
                }
              },
              itemCount: detailBean.photos.length +
                  (detailBean.trailers.isNotEmpty ? 1 : 0),
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }

  ///演职员
  SliverToBoxAdapter sliverCasts() {
    return SliverToBoxAdapter(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text("演职员", style: TextStyle(fontWeight: FontWeight.bold)),
          padding: EdgeInsets.only(left: 10),
        ),
        Container(
            height: 185,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.network(
                            detailBean.casts[index].avatars.medium,
                            width: 100.0,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(detailBean.casts[index].name)
                      ],
                    ));
              },
              shrinkWrap: true,
              itemCount: detailBean.casts.length,
              scrollDirection: Axis.horizontal,
            ))
      ],
    ));
  }

  ///所属频道
  SliverToBoxAdapter sliverTags() {
    return SliverToBoxAdapter(
      child: Container(
        height: 30,
        color: Colors.black12,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10, right: 10),
                child:
                    Text("所属频道", style: TextStyle(fontWeight: FontWeight.bold)),
              );
            }
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                detailBean.tags[index],
                style: TextStyle(color: Colors.red),
              ),
            );
          },
          itemCount: detailBean.tags.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
