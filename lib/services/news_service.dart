import 'package:api_channel/constants/constants.dart';
import 'package:api_channel/models/news_model.dart';
import 'package:dio/dio.dart';

class NewsService {
  static Future<NewsModel> getNews()async{
    Response res = await Dio().get(Constants.kIpAdres);
    if(res.statusCode == 200)
    {
      return NewsModel.fromJson(res.data);
    }
    else
    {
      throw(Exception("Data yo'q"));
    }
  }
}