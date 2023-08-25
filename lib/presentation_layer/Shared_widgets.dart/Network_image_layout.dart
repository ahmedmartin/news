import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageLayout extends StatelessWidget {
  final String imageUrl;

  const NetworkImageLayout({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: 200,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fitWidth,
      placeholder: (context, url) =>  Image.asset('assets/listing/placeholder.png',height: 200,width:MediaQuery.of(context).size.width,fit: BoxFit.fill,),
      errorWidget: (context, url, error) => Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[300],
          child: const Center(
              child: Icon(
            Icons.error,//Icons.error,
            color: Colors.red,
            size: 130,
          )),
        ),
    );
  }
}
