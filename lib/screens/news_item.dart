import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_1/models/news.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CachedNetworkImage(
          width: double.infinity,
          height: 180,
          imageUrl: articles.urlToImage ?? "",
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Text(
          articles.author ?? "",
          style: TextStyle(fontSize: 12, color: Colors.green.shade400),
        ),
        Text(
          articles.title ?? "",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(articles.publishedAt?.substring(0,10) ?? "",textAlign: TextAlign.right,),
      ],
    );
  }
}
