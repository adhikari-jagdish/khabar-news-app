import 'dart:convert';

import 'package:get/get.dart';
import 'package:khabar_news_app/models/article_model.dart';
import 'package:khabar_news_app/models/news_model.dart';
import 'package:khabar_news_app/repository/news_repository.dart';

class NewsController extends GetxController {
  var newsArticlesList = <ArticleModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool articleFound = false.obs;
  var newsRepo = NewsRepository();
  RxString currentSelectedTabValue = "All".obs;
  final List<String> tabOptions = [
    'All',
    'Sports',
    'Politics',
    'Business',
    'Health',
    'Travel',
    'Science'
  ];

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    getAllNewsFromApi(category: currentSelectedTabValue.value);
  }

  // function to retrieve a JSON response for all news from newsApi.org
  getAllNewsFromApi({required String category}) async {
    try {
      isLoading.value = true;
      final newsResponse = await newsRepo.fetchNews(category);
      if (newsResponse.statusCode == 200) {
        Map<String, dynamic> newsJsonData = jsonDecode(newsResponse.body);
        final newsModel = NewsModel.fromJson(newsJsonData);
        if (newsModel.articles != null) {
          if (newsModel.articles!.isNotEmpty) {
            newsArticlesList.value = newsModel.articles!;
          }
        }
        print('Articles Json data ${newsArticlesList.first.toJson()}');
      } else {
        articleFound.value = false;
      }
    } catch (e) {
      print('Error in News Controller $e');
    } finally {
      isLoading.value = false;
    }
  }
}
