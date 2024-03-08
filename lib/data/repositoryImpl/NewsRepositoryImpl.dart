import 'package:injectable/injectable.dart';
import 'package:news_app/data/dataSourceContract/NewsDataSource.dart';
import 'package:news_app/data/model/news_response/news.dart';

import '../../repositoryContract/NewsRepository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository {
  NewsDataSource dataSource;

  @factoryMethod
  NewsRepositoryImpl(this.dataSource);

  @override
  Future<List<News>?> getNews(String? sourceId) {
    return dataSource.getNews(sourceId);
  }
}
