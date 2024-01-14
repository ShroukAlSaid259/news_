import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_1/models/news.dart';
import 'package:news_1/models/sources.dart';
import 'package:news_1/shared/components/constants.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri URL =
        Uri.https(baseUrl, "/v2/top-headlines/sources", {"apiKey": APIKey,"category":categoryId});
    Response sources = await http.get(URL);
    try {
      var json = jsonDecode(sources.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      print("Error Here $e");
      throw e;
    }
  }
  static Future<NewsResponse> getNews({String? sourceId,String? quary})async{
    //https://newsapi.org/v2/everything?sources=abc-news&apiKey=5074deec1c4f4fa39a8de0e6042c67ae
    Uri url= Uri.https(baseUrl,"/v2/everything",{
      "apiKey":APIKey,
      "sources":sourceId,
      "q":quary
    });
    Response newsData=await http.get(url);
    var json=jsonDecode(newsData.body);
    NewsResponse newsResponse=NewsResponse.fromJson(json);
    return newsResponse;
  }
}
