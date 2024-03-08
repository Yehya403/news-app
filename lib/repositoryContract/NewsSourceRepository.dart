import '../data/model/sources_response/source.dart';

abstract class NewsSourceRepository {
  Future<List<Source>?> getSources(String categoryId);
}
