import 'package:flutter/material.dart';
import 'package:news_app/Core/Constants/Errors.dart';
import 'package:news_app/Core/Constants/Text.dart';
import 'package:news_app/Data_layer/Models/NewsModel.dart';
import 'package:news_app/presentation_layer/Screens_widget/Details/Artical_details.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Details extends StatelessWidget {
  final Articles article;

  const Details({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(appBarTitle),
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          Image.asset(
            'assets/listing/search.png',
            width: 20,
            height: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArticalDetails(article: article),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: (() async {
                  Uri uri = Uri.parse(article.url??'');
                  // i wanted to use (can lunch) but i don't have mac to test this case in ios version
                  
                  // if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  // } else {
                  //   ScaffoldMessenger.of(context)
                  //       .showSnackBar(SnackBar(content: Text(siteError)));
                  // }
                }),
                child: Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                    webSite,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
