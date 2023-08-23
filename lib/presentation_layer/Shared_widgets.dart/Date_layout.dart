import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateLayout extends StatelessWidget {
  final String date;
  final Color textColor;

  const DateLayout({super.key, required this.date,required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10, right: 10),
      child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            DateFormater(date),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: textColor),
          )),
    );
  }

  String DateFormater(String date) {
    var temp = date.substring(0, 10).split('-');
    return DateFormat.yMMMMd()
        .format(DateTime(
            int.parse(temp[0]), int.parse(temp[1]), int.parse(temp[2])))
        .toString();
  }
}
