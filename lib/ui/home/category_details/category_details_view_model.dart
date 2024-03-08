import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/sources_response/source.dart';
import '../../../repositoryContract/NewsSourceRepository.dart';

@injectable
class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  NewsSourceRepository repository;

  @factoryMethod
  CategoryDetailsViewModel(this.repository)
      : super(LoadingState('Loading....'));

  Future<void> getSources(String categoryId) async {
    emit(LoadingState('Loading.....'));
    try {
      var sourcesList = await repository.getSources(categoryId);
      emit(SuccessState(sourcesList!));
      /*
      var response = await ApiManager().getSources(categoryId);
      if (response.status == 'error') {
        emit(ErrorState(response.message ?? ""));
      } else {
        emit(SuccessState(response.sources!));
      }
      */
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class CategoryDetailsState {}

class SuccessState extends CategoryDetailsState {
  List<Source> sourcesList;

  SuccessState(this.sourcesList);
}

class LoadingState extends CategoryDetailsState {
  String message;

  LoadingState(this.message);
}

class ErrorState extends CategoryDetailsState {
  String errorMessage;

  ErrorState(this.errorMessage);
}
