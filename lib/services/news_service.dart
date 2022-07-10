import 'package:api_channel/constants/constants.dart';
import 'package:api_channel/models/news_model.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NewsService {
  static Future<NewsModel> getNews()async{
    Response res = await Dio().get(Constants.kIpAdres);
    Box newsbox = await Hive.openBox('newsxx');
    if(res.statusCode == 200) {
      newsbox.add(NewsModel.fromJson(res.data));
      return NewsModel.fromJson(res.data);
    } else {
      throw(Exception("Data yo'q"));
    }
  }
}