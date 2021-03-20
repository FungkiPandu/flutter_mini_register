import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final Color fillColor;

  const MyTextField(
      {Key? key,
      this.hintText,
      this.prefixIcon,
      this.fillColor = Colors.white60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: new InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        fillColor: fillColor,
      ),
    );
  }
}
