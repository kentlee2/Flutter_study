import 'package:dio/dio.dart';
import 'package:newsApp/bean/MovieEntity.dart';
import 'package:newsApp/bean/movie_detail_bean.dart';
import 'package:newsApp/utils/Values.dart';

import 'HttpUtil.dart';

class API {
  static String baseUrl1 = "https://douban-api.now.sh";
  static String baseUrl2 = "https://api.douban.com";
  static String baseUrl3 = "https://douban-api.uieee.com";
  static String baseUrl = baseUrl1;
  static String theatersMovie = baseUrl+"/v2/movie/in_theaters";
  static String comingSoonMovie = baseUrl+"/v2/movie/coming_soon";
  static API instance;

  ///26266893 电影条目信息
  ///https://api.douban.com/v2/movie/subject/26266893?apikey=0b2bdeda43b5688921839c8ecb20399b
  static Future<MovieDetailBean> getMovieDetail(subjectId) async {
    Response response = await HttpUtil.getInstance().get(baseUrl +
        '/v2/movie/subject/$subjectId?apikey=0b2bdeda43b5688921839c8ecb20399b');
    var result = new Map<String, dynamic>.from(response.data);
    MovieDetailBean bean = MovieDetailBean.fromJson(result);
    return bean;
  }
  static Future<MovieEntity> getMovieList(int showType,int start,int count) async{
    var data = {'start': start, 'count': count};
    var response;
    if (showType == Values.typeOnline) {
      response = await HttpUtil.getInstance().get(theatersMovie, data: data);
      print(response);
    } else {
      response = await HttpUtil.getInstance().get(comingSoonMovie, data: data);
      print(response);
    }
    var result = new Map<String, dynamic>.from(response.data);
    //FlutterJsonBeanFactory插件生成
    MovieEntity entity = new MovieEntity.fromJson(result);
    return entity;
  }
}
