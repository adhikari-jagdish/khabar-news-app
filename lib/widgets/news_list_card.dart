import 'package:flutter/material.dart';

class NewsListCard extends StatelessWidget {
  NewsListCard({
    super.key,
    this.newsImageUrl,
    this.countryName,
    required this.newsTitle,
    this.newsSourceTitle,
    this.newsSourceImageUrl,
    this.newsPublishTime,
  });

  String? newsImageUrl;
  String? countryName;
  String newsTitle;
  String? newsSourceTitle;
  String? newsSourceImageUrl;
  String? newsPublishTime;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(newsTitle),
      subtitle: Text(newsSourceTitle ?? "Source"),
      leading: Image.network(newsImageUrl ?? ""),
    );
  }
}
