import 'package:khabar_news_app/models/source_model.dart';

class ArticleModel {
  ArticleModel({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  String? author, description, urlToImage, content;
  String title, url, publishedAt;
  SourceModel source;

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'] ?? "",
      description: json['description'] ?? "",
      source: SourceModel.fromJson(json['source'] as Map<String, dynamic>),
      title: json['author'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'description': description,
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}
