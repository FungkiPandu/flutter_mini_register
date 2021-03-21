import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_register/component/my_text.dart';
import 'package:flutter_mini_register/helper/datetime.dart';

class MyDatePicker extends StatelessWidget {
  final String? caption;
  final DateTime? currentDateTime;
  final void Function(DateTime) onDateTimeChanged;

  const MyDatePicker({
    Key? key,
    this.caption,
    this.currentDateTime,
    required this.onDateTimeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var captionHeader = <Widget>[];
    if (caption != null) {
      captionHeader.addAll([
        MyText(
          caption!,
          type: MyTextType.body,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 8),
      ]);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...captionHeader,
        _pickerByPlatform(context),
      ],
    );
  }

  Widget _pickerByPlatform(BuildContext context) {
    if (Platform.isIOS) return _iOSDatePicker(context);
    return _materialDatePicker(context);
  }

  Widget _iOSDatePicker(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(left: 16, right: 8),
      child: CupertinoDialogAction(
        child: Text(currentDateTime != null
            ? DateTimeHelper(currentDateTime!).formattedDate
            : "- Chose Date -"),
        textStyle: MyText.typeStyle(MyTextType.title),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => Container(
              height: 220,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: onDateTimeChanged,
                initialDateTime: currentDateTime,
                minimumDate: DateTime.now().add(Duration(days: 1)),
              ),
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }

  Widget _materialDatePicker(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: MyText(
                currentDateTime != null
                    ? DateTimeHelper(currentDateTime!).formattedDate
                    : "- Chose Date -",
                type: MyTextType.title,
              ),
            ),
            Icon(Icons.arrow_drop_down, size: 24),
          ],
        ),
      ),
      onTap: () {
        var now = DateTime.now().add(Duration(days: 1));
        showDatePicker(
          context: context,
          initialDate: currentDateTime ?? now,
          firstDate: now,
          lastDate: DateTime(now.year + 1, now.month, now.day),
        ).then(
          (DateTime? value) =>
              (value != null) ? onDateTimeChanged(value) : null,
        );
      },
    );
  }
}
