import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khabar_news_app/controllers/news_controller.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/images/khabar-news.png',
            height: 40,
            width: 40,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: Image.asset('assets/images/notification.png'),
              onPressed: () {
                // Action when notification icon is tapped
              },
            ),
          ),
        ],
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0, // Remove shadow from the AppBar
      ),
      body: Column(
        children: [
          Row(
            children: [
              paddingAll(10),
              Text('Latest', style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Text(
                'See all',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("Hello"),
        ],
      ),
    );
  }
}
