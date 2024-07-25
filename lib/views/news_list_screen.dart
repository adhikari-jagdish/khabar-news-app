import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khabar_news_app/controllers/news_controller.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.put(NewsController());
    return Scaffold(
      body: Center(child: Text('News List Screen Here')),
    );
  }
}
