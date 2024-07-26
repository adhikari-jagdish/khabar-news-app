import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khabar_news_app/constants/color_constants.dart';
import 'package:khabar_news_app/models/article_model.dart';

class NewsDetailScreen extends StatelessWidget {
  late ArticleModel articleModel;

  NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    articleModel = Get.arguments ?? ArticleModel();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(articleModel.urlToImage ?? ""),
              ),
              title: Text(articleModel.source?.name ?? 'BBC News'),
              subtitle: Text(articleModel.publishedAt ?? '14m ago'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue0982BA,
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
                child: Text('Following'),
              ),
            ),
            Image.network(
              articleModel.urlToImage ?? 'assets/images/khabar-news.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                articleModel.title ?? "News Title",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                articleModel.description ??
                    "This is a sample description as the original description is unable to load",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
