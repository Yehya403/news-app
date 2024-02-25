import 'package:flutter/material.dart';

import '../../../model/news.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget({required this.news, super.key});
  News news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                news.image,
                height: 300,
                width: double.infinity,
                fit: BoxFit.fill,
              )),
          Text(
            news.title,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            news.author,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 16),
          ),
          Text(news.date, textAlign: TextAlign.end),
        ],
      ),
    );
  }
}
