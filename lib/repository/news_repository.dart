import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:khabar_news_app/constants/news_api_constants.dart';
import 'package:khabar_news_app/models/news_model.dart';

class NewsRepository {
  Future<List<NewsModel>> fetchNews() async {
    String url =
        '${NewsApiConstants.baseUrl}top-headlines?q=business&languages=en&apiKey=${NewsApiConstants.newsApiKey}';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List<NewsModel> articleModelList = [];
    if (response.statusCode == 200) {
      for (var data in jsonData[NewsApiConstants.articles]) {
        if (data[NewsApiConstants.urlToImage] != null) {
          NewsModel articleModel = NewsModel.fromJson(data);
          articleModelList.add(articleModel);
        }
      }
      return articleModelList;
    } else {
      // returns an empty list.
      return articleModelList;
    }
  }
}
