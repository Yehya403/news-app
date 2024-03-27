import 'package:injectable/injectable.dart';
import 'package:news_app/data/api_manager.dart';
import 'package:news_app/data/model/news_response/news.dart';

import '../dataSourceContract/NewsDataSource.dart';

@Injectable(as: NewsDataSource)
class NewsDataSourceImpl extends NewsDataSource {
  ApiManager apiManager;

  @factoryMethod
  NewsDataSourceImpl(this.apiManager);

  @override
  Future<List<News>?> getNews(String? sourceId) async {
    var response = await apiManager.getNews(sourceId);
    return response.articles;
  }
}
