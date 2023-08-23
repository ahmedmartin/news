import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Data_layer/Models/NewsModel.dart';
import 'package:news_app/presentation_layer/Screens/Details.dart';
import 'package:news_app/presentation_layer/Shared_widgets.dart/Date_layout.dart';
import 'package:news_app/presentation_layer/Shared_widgets.dart/Network_image_layout.dart';

class ArticalListItem extends StatelessWidget {
  late Articles article;

  ArticalListItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(article: article),
            ));
      },
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(right: 15, left: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkImageLayout(imageUrl: article.urlToImage!),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
              child: Text(
                article.title ?? '',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10,top: 5),
              child: Text(
                article.author == null ? '' : 'By ${article.author}',
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w300,color: Colors.grey[700]!,),
              ),
            ),
            DateLayout(date: article.publishedAt ?? '',textColor: Colors.grey[700]!,)
          ],
        ),
      ),
    );
  }
}
