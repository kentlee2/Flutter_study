import 'package:flutter/material.dart';
import 'package:newsApp/bean/movie_detail_bean.dart';

class DetailTitleWidget extends StatelessWidget {
  final MovieDetailBean detailBean;

  DetailTitleWidget(this.detailBean);

  @override
  Widget build(BuildContext context) {
    var screenW = MediaQuery.of(context).size.width;
    var imgW = screenW / 4;
    var imgH = imgW * 421 / 297;
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            child: Image.network(
              detailBean.images.medium,
              fit: BoxFit.cover,
              width: imgW,
              height: imgH,
            ),
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),

          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                detailBean.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text("(" + detailBean.year + ")"),
              Text(detailBean.countries.join("、") +
                  "/" +
                  detailBean.genres.join("/") +
                  "  上映时间：" +
                  detailBean.pubdates.join("/")),
              Text("片长：" + detailBean.durations.join("、")),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: <Widget>[
                  Text("豆瓣评分："),
                  Text(
                    detailBean.rating.average.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                  Text("(" +
                      (detailBean.rating.details.a1 +
                              detailBean.rating.details.a2 +
                              detailBean.rating.details.a3 +
                              detailBean.rating.details.a4 +
                              detailBean.rating.details.a5)
                          .toInt()
                          .toString() +
                      "人评价)"),

                ],
              ),

            ],
          )
          )
        ],
      ),
    );
  }
}
