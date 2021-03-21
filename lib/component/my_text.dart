import 'package:flutter/material.dart';

enum MyTextType { h1, h2, title, body }

class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final MyTextType type;
  final FontWeight? fontWeight;

  const MyText(
    this.text, {
    Key? key,
    this.color = Colors.black,
    this.type = MyTextType.body,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: typeStyle(
        type,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  static TextStyle typeStyle(
    MyTextType type, {
    Color color = Colors.black,
    FontWeight? fontWeight,
  }) {
    var fontSize = 14.0;
    var _fontWeight = FontWeight.normal;

    switch (type) {
      case MyTextType.h1:
        fontSize = 42;
        _fontWeight = FontWeight.bold;
        break;
      case MyTextType.h2:
        fontSize = 28;
        _fontWeight = FontWeight.bold;
        break;
      case MyTextType.title:
        fontSize = 16;
        _fontWeight = FontWeight.w600;
        break;
      case MyTextType.body:
        fontSize = 14;
        _fontWeight = FontWeight.normal;
        break;
    }

    if (fontWeight != null) _fontWeight = fontWeight;

    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: _fontWeight,
    );
  }
}
