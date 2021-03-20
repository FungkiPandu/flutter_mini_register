import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Function()? onPressed;

  const MyButton({Key? key, this.text = "", this.color, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.all(15),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
