import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share_outlined),
              onPressed: () {
                // Action when share button is tapped
              },
            ),
            PopupMenuButton<int>(
              // onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Option 1')),
                PopupMenuItem<int>(value: 1, child: Text('Option 2')),
              ],
            ),
          ],
        ),
        body: Center(
          child: Text('Detail Screen'),
        ));
  }
}
