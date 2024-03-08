import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import '../dataSourceContract/NewsSourceDataSource.dart';

@Injectable(as: NewsSourceDataSource)
class NewsSourceDataSourceImpl extends NewsSourceDataSource {
  ApiManager apiManager;

  @factoryMethod
  NewsSourceDataSourceImpl(this.apiManager);

  @override
  Future<List<Source>?> getSources(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response.sources;
  }
}
