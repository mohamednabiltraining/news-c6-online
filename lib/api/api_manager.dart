import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_c6_online/api/model/news_response.dart';
import 'package:news_c6_online/api/model/sources_response.dart';

class ApiManager{
  static const String BASE_URL ='newsapi.org';
  static const String API_KEY ='5909ae28122a471d8b0c237d5989cb73';

  static Future<SourcesResponse> getNewsSources(String catId)async{
    var uri = Uri.https(BASE_URL, '/v2/top-headlines/sources',
    {'apiKey':API_KEY, 'category':catId});
    var response = await http.get(uri);
    var responseBody =response.body;
    var json = jsonDecode(responseBody);
    var sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
  static Future<NewsResponse> getNewsBySourceId(String sourceId)async{
    var uri = Uri.https(BASE_URL, 'v2/everything',
        {'apiKey':API_KEY, 'sources':sourceId});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var newsResponse =NewsResponse.fromJson(json);
    return newsResponse;

  }
}