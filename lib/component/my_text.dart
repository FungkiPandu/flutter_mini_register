import 'package:flutter/material.dart';

enum MyTextType { h1, h2, title, body }

class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final MyTextType type;

  const MyText(
    this.text, {
    Key? key,
    this.color = Colors.black,
    this.type = MyTextType.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: typeStyle(type, color: color),
    );
  }

  static TextStyle typeStyle(
    MyTextType type, {
    Color color = Colors.black,
  }) {
    var fontSize = 14.0;
    var fontWeight = FontWeight.normal;

    switch (type) {
      case MyTextType.h1:
        fontSize = 42;
        fontWeight = FontWeight.bold;
        break;
      case MyTextType.h2:
        fontSize = 28;
        fontWeight = FontWeight.bold;
        break;
      case MyTextType.title:
        fontSize = 16;
        fontWeight = FontWeight.w600;
        break;
      case MyTextType.body:
        fontSize = 15;
        fontWeight = FontWeight.normal;
        break;
    }

    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
