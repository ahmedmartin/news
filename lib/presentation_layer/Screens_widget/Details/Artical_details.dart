import 'package:flutter/material.dart';
import 'package:news_app/Data_layer/Models/NewsModel.dart';
import 'package:news_app/presentation_layer/Shared_widgets.dart/Date_layout.dart';
import 'package:news_app/presentation_layer/Shared_widgets.dart/Network_image_layout.dart';

class ArticalDetails extends StatelessWidget {
  final Articles article;

  const ArticalDetails({super.key, required this.article});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height - 200,
      child: ListView(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                NetworkImageLayout(imageUrl: article.urlToImage!),
                Align(
                  alignment: Alignment.bottomRight,
                  child: DateLayout(date: article.publishedAt ?? '',textColor: Colors.white,),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
              child: Text(
                article.title ?? '',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10,top: 5),
              child: Text(
                article.author == null ? '' : 'By ${article.author}',
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w300,color: Colors.grey[700]),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10,top: 15),
              child: Text(
                article.description ??'',
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.grey[700]),
              ),
            ),
        ],
      ),
    );
  }
}
