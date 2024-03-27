import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import '../../../data/model/sources_response/source.dart';
import 'news_list_view_model.dart';

class NewsList extends StatefulWidget {
  const NewsList({required this.source, super.key});

  final Source source;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  // Field Injection
  var viewModel = getIt.get<NewsListViewModel>();
  late String sourceId;

  @override
  void initState() {
    super.initState();
    sourceId = widget.source.id ?? "";
    viewModel.getNews(sourceId);
  }

  @override
  Widget build(BuildContext context) {
    if (sourceId != widget.source.id) {
      sourceId = widget.source.id ?? "";
      viewModel.getNews(sourceId);
    }

    return BlocBuilder<NewsListViewModel, NewsListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state.runtimeType) {
          case SuccessState:
            {
              var newsList = (state as SuccessState).newsList;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(news: newsList![index]);
                },
                itemCount: newsList?.length ?? 0,
              );
            }
          case LoadingState:
            {
              return Center(
                child: Column(
                  children: [
                    Text((state as LoadingState).message),
                    const CircularProgressIndicator(),
                  ],
                ),
              );
            }
          default:
            {
              return Container(); // Return whatever appropriate when state is not recognized
            }
        }
      },
    );
  }
}
