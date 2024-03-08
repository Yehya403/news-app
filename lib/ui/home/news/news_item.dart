import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../data/model/news_response/news.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({required this.news, super.key});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              height: 300,
              width: double.infinity,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Text(
            news.title ?? "",
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            news.author ?? "",
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 16),
          ),
          Text(news.publishedAt ?? "", textAlign: TextAlign.end),
        ],
      ),
    );
  }
}
