import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news_response/news_response.dart';
import 'package:news_app/model/sources_response/sources_response.dart';

class ApiManager {
  static const baseUrl = 'newsapi.org';
  static const apiKey = 'da403a8b94b040c186fb01209333c86d';

  static Future<SourcesResponse> getSources(String? categoryId) async {
    var uri = Uri.https(baseUrl, '/v2/top-headlines/sources',
        {'apiKey': apiKey, 'category': categoryId});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var sourcesResponses = SourcesResponse.fromJson(json);
    return sourcesResponses;
  }

  static Future<NewsResponse> getNews(String? sourceId) async {
    var uri = Uri.https(
        baseUrl, '/v2/everything', {'apiKey': apiKey, 'sources': sourceId});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var newsResponses = NewsResponse.fromJson(json);
    return newsResponses;
  }
}
