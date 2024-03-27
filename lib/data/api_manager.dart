import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'model/news_response/news_response.dart';
import 'model/sources_response/sources_response.dart';

@singleton
@injectable
class ApiManager {
  static const baseUrl = 'newsapi.org';
  static const apiKey = '26e4372b3a714a0fba2aa7020ba55c46';

  Future<SourcesResponse> getSources(String? categoryId) async {
    var uri = Uri.https(baseUrl, '/v2/top-headlines/sources',
        {'apiKey': apiKey, 'category': categoryId});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var sourcesResponses = SourcesResponse.fromJson(json);
    return sourcesResponses;
  }

  Future<NewsResponse> getNews(String? sourceId) async {
    var uri = Uri.https(
        baseUrl, '/v2/everything', {'apiKey': apiKey, 'sources': sourceId});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var newsResponses = NewsResponse.fromJson(json);
    return newsResponses;
  }
}
