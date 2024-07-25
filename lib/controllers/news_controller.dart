import 'package:get/get.dart';
import 'package:khabar_news_app/models/news_model.dart';
import 'package:khabar_news_app/repository/news_repository.dart';

class NewsController extends GetxController {
  var allNews = <NewsModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool newsNotFound = false.obs;
  var newsRepo = NewsRepository();

  @override
  void onInit() {
    super.onInit();

    getAllNewsFromApi();
  }

  // function to retrieve a JSON response for all news from newsApi.org
  getAllNewsFromApi() async {
    try {
      isLoading.value = true;
      final newsList = await newsRepo.fetchNews();
      if (newsList.isEmpty) {
        isLoading.value = false;
        newsNotFound.value = true;
      } else {
        print('List of fetched news ${newsList.length}');
      }
    } catch (e) {
      print('Error in News Controller $e');
    }
  }
}
