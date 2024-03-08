import 'package:news_app/data/model/sources_response/source.dart';

abstract class NewsSourceDataSource {
  Future<List<Source>?> getSources(String categoryId);
}
