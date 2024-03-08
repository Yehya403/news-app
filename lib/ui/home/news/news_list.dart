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
  //Field Injection
  var viewModel = getIt.get<NewsListViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListViewModel, NewsListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case SuccessState():
            {
              var newsList = state.newsList;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(news: newsList![index]);
                },
                itemCount: newsList?.length ?? 0,
              );
            }
          case LoadingState():
            {
              return Center(
                  child: Column(
                children: [
                  Text(state.message),
                  const CircularProgressIndicator(),
                ],
              ));
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.getNews(widget.source.id ?? "");
                      },
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
