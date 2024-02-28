import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager/api_manager.dart';
import 'package:news_app/ui/home/news/news_widget.dart';

import '../../../model/sources_response/source.dart';

class NewsListWidget extends StatelessWidget {
  NewsListWidget({required this.source, super.key});

  Source source;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNews(source.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data?.message == 'error') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.hasError.toString()),
                ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
              ],
            );
          }

          var newsList = snapshot.data?.articles;
          return ListView.builder(
            itemBuilder: (context, index) => NewsWidget(news: newsList![index]),
            itemCount: newsList?.length ?? 0,
          );
        });
  }
}
