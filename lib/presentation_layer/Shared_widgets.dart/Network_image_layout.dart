import 'package:flutter/material.dart';

class NetworkImageLayout extends StatelessWidget {
  final String imageUrl;

  const NetworkImageLayout({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: 200,
      width:MediaQuery.of(context).size.width,
      cacheHeight: 1700,
      cacheWidth: 2500,
      loadingBuilder: (context, child, loadingProgress) =>
          loadingProgress == null
              ? child
              : Image.asset('assets/listing/placeholder.png',height: 200,width:MediaQuery.of(context).size.width,fit: BoxFit.fill,),
      errorBuilder: (context, error, stackTrace) => const Center(
          child: Icon(
        Icons.error,
        color: Colors.red,
        size: 130,
      )),
      fit: BoxFit.fill,
    );
  }
}
