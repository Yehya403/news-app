import 'package:injectable/injectable.dart';
import 'package:news_app/data/dataSourceContract/NewsSourceDataSource.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/repositoryContract/NewsSourceRepository.dart';

@Injectable(as: NewsSourceRepository)
class NewsSourceRepositoryImpl extends NewsSourceRepository {
  NewsSourceDataSource newsOnlineData;

  @factoryMethod
  NewsSourceRepositoryImpl(this.newsOnlineData);

  @override
  Future<List<Source>?> getSources(String categoryId) {
    return newsOnlineData.getSources(categoryId);
  }
}
