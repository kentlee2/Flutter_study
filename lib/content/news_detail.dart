import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsApp/bean/MovieEntity.dart';
import 'package:newsApp/bean/movie_detail_bean.dart';
import 'package:newsApp/utils/Api.dart';
import 'package:newsApp/widget/animal_photo.dart';
import 'package:newsApp/widget/rating_bar.dart';

import 'DetailTitleWidget.dart';

class NewsDetail extends StatefulWidget {
  final String title;
  final int id;

  NewsDetail(this.title, this.id);

  @override
  State<StatefulWidget> createState() => _DetailPageState(title, id);
}

class _DetailPageState extends State<NewsDetail> {
  Color pickColor = Color(0xffffffff); //默认主题色
  MovieDetailBean detailBean;
  final String title;
  final int id;

  _DetailPageState(this.title, this.id);

  @override
  void initState() {
    super.initState();
    requestData();
  }

  void requestData() async {
    MovieDetailBean detailBean = await API.getMovieDetail(id);
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
              sliverPhotos(),
              sliverComments()
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

  ///评论
  SliverToBoxAdapter sliverComments() {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("短评", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  '全部短评 ${detailBean.commentsCount} >',
                  style: TextStyle(fontSize: 12.0),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var commentBean = detailBean.popularComments[index];
                return Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8,bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                              NetworkImage(commentBean.author.avatar),
                            ),
                            Column(
                              children: <Widget>[
                                Text(commentBean.author.name,
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                                RatingBar(
                                  commentBean.rating.value /
                                      commentBean.rating.max *
                                      10,
                                  size: 11,
                                )
                              ],
                            ),
                            Row(
                              //赞的数量
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/ic_vote_normal_large.png',
                                  width: 20.0,
                                  height: 20.0,
                                ),
                                Text(
                                  '${getUsefulCount(commentBean.usefulCount)}',
                                  style: TextStyle(color: Color(0x88fffffff)),
                                )
                              ],
                            )
                          ],
                        ),
                        Text(commentBean.content),
                      ],
                    ),

                  ),
                );
              },
              itemCount: detailBean.popularComments.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
          )
        ],
      ),
    );
  }

  ///将34123转成3.4k
  getUsefulCount(int usefulCount) {
    double a = usefulCount / 1000;
    if (a < 1.0) {
      return usefulCount;
    } else {
      return '${a.toStringAsFixed(1)}k'; //保留一位小数
    }
  }

  ///剧照
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
                if (index == 0 && detailBean.trailers.isNotEmpty) {
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
                    onTap: () {},
                  );
                } else {
                  return showBigImg(
                      Padding(
                        padding: EdgeInsets.only(right: 2.0),
                        child: Image.network(
                          detailBean.photos[index - 1].cover,
                          fit: BoxFit.cover,
                          width: w,
                          height: h,
                        ),
                      ),
                      detailBean.photos[index - 1].cover);
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

  ///传入的图片组件，点击后，会显示大图页面
  Widget showBigImg(Widget widget, String imgUrl) {
    return Hero(
      tag: imgUrl,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: widget,
          onTap: () {
            AnimalPhoto.show(context, imgUrl);
          },
        ),
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
                return GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          showBigImg(
                              Padding(
                                padding: EdgeInsets.only(right: 2.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    detailBean.casts[index].avatars.medium,
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 150,
                                  ),
                                ),
                              ),
                              detailBean.casts[index].avatars.large),
                          Text(detailBean.casts[index].name)
                        ],
                      )),
                );
              },
              shrinkWrap: true,
              itemCount: detailBean.casts.length,
              scrollDirection: Axis.horizontal,
            )),
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
