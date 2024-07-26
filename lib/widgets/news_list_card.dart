import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khabar_news_app/constants/route_constants.dart';
import 'package:khabar_news_app/models/article_model.dart';

class NewsListCard extends StatelessWidget {
  NewsListCard({
    super.key,
    required this.articleModel,
  });

  ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Get.toNamed(RouteConstants.newsDetail, arguments: articleModel);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              child: articleModel.urlToImage != null
                  ? Image.network(
                      articleModel.urlToImage!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "assets/images/khabar-news.png",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articleModel.author ?? "Country",
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      articleModel.title ?? "News Title",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    articleModel.description != null
                        ? Text(
                            articleModel.description!,
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        : const SizedBox.shrink(),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: articleModel.urlToImage != null
                              ? NetworkImage(articleModel.urlToImage!)
                              : const AssetImage(
                                  'assets/images/khabar-news.png'),
                          radius: 10.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          articleModel.source?.name ?? "News Source",
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Icon(
                          Icons.lock_clock,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          articleModel.publishedAt ?? "14:00:00",
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
