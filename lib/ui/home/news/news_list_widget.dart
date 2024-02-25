import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/ui/home/news/news_widget.dart';

import '../../../model/source.dart';

class NewsListWidget extends StatelessWidget {
  NewsListWidget({required this.source, super.key});
  Source source;
  List<News> newsList = [
    News(1, 'lorem text lorem text lorem text lorem text ',
        'assets/images/news_image.jpg', 'BBC', '24 Friday'),
    News(2, 'lorem text lorem text lorem text lorem text ',
        'assets/images/news_image.jpg', 'BBC', '24 Friday'),
    News(3, 'lorem text lorem text lorem text lorem text ',
        'assets/images/news_image.jpg', 'BBC', '24 Friday'),
    News(4, 'lorem text lorem text lorem text lorem text ',
        'assets/images/news_image.jpg', 'BBC', '24 Friday'),
    News(5, 'lorem text lorem text lorem text lorem text ',
        'assets/images/news_image.jpg', 'BBC', '24 Friday'),
    News(6, 'lorem text lorem text lorem text lorem text ',
        'assets/images/news_image.jpg', 'BBC', '24 Friday'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => NewsWidget(news: newsList[index]),
      itemCount: newsList.length,
    );
  }
}
