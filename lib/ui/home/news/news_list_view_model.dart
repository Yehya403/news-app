import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/news_response/news.dart';
import '../../../repositoryContract/NewsRepository.dart';

@injectable
class NewsListViewModel extends Cubit<NewsListState> {
  NewsRepository newsRepository;

  @factoryMethod
  NewsListViewModel(this.newsRepository) : super(LoadingState('Loading....'));

  Future<void> getNews(String sourceId) async {
    emit(LoadingState('Loading.....'));
    try {
      var newsList = await newsRepository.getNews(sourceId);
      emit(SuccessState(newsList));
      /*
      var response = await ApiManager().getNews(sourceId);
      if (response.status == 'error') {
        emit(ErrorState(response.message ?? ""));
      } else {
        emit(SuccessState(response.articles!));
      }
       */
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class NewsListState {}

class SuccessState extends NewsListState {
  List<News>? newsList;

  SuccessState(this.newsList);
}

class LoadingState extends NewsListState {
  String message;

  LoadingState(this.message);
}

class ErrorState extends NewsListState {
  String errorMessage;

  ErrorState(this.errorMessage);
}
