import 'package:flutter/material.dart';
import 'package:news_app/Core/Constants/Text.dart';

class ErrorTryAgain extends StatelessWidget {
  final String errorMessage;
  final GestureTapCallback onTap;

  const ErrorTryAgain({super.key, required this.errorMessage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),

          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(top: 15, bottom: 15,left: 15,right: 15),
                    color: Colors.black,
                    child: const Text(
                      tryAgain,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
