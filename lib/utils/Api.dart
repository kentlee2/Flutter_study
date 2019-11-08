import 'package:dio/dio.dart';
import 'package:newsApp/bean/movie_detail_bean.dart';

import 'HttpUtil.dart';

class API {
  static String baseUrl = "https://douban-api.now.sh/v2/movie/";
  static String baseUrl2 = "https://api.douban.com";
  static API instance;

  ///26266893 电影条目信息
  ///https://api.douban.com/v2/movie/subject/26266893?apikey=0b2bdeda43b5688921839c8ecb20399b
  static Future<MovieDetailBean> getMovieDetail(subjectId) async {
    Response response = await HttpUtil.getInstance().get(baseUrl2 +
        '/v2/movie/subject/$subjectId?apikey=0b2bdeda43b5688921839c8ecb20399b');
    var result = new Map<String, dynamic>.from(response.data);
    MovieDetailBean bean = MovieDetailBean.fromJson(result);
    return bean;
  }
}
