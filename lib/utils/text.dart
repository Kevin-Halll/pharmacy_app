

import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({this.color, this.size=18, required this. text, this.overflow=TextOverflow.ellipsis, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
        // fontFamily: 'Roboto'
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  MediumText({this.color, this.size=15, required this. text, this.overflow=TextOverflow.ellipsis, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
        // fontFamily: 'Roboto'
      ),
    );
  }
}

