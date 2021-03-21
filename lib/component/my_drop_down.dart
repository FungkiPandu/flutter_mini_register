import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_register/component/my_text.dart';

class MyDropDown<T> extends StatelessWidget {
  final String? caption;
  final List<DropdownMenuItem<T>> items;
  final T? currentValue;
  final void Function(T?)? onChanged;

  const MyDropDown({
    Key? key,
    required this.items,
    this.onChanged,
    this.currentValue,
    this.caption,
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
    if (Platform.isIOS) return _iOSDropDownPicker(context);
    return _materialDropDownPicker(context);
  }

  Widget _iOSDropDownPicker(context) {
    var contents = <Widget>[
      Expanded(
        child: CupertinoPicker.builder(
          childCount: items.length,
          itemExtent: 38,
          onSelectedItemChanged: (index) {
            if (onChanged != null) {
              onChanged!(items[index].value);
            }
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: items[index],
            );
          },
        ),
      ),
    ];
    if (caption != null) {
      contents.insert(
        0,
        Padding(
          padding: EdgeInsets.all(8.0),
          child: MyText(
            caption!,
            type: MyTextType.body,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return _iOSDialogPicker(
      context,
      MyText("- Choose Option -", color: Colors.white),
      dialogContent: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: contents,
        ),
      ),
    );
  }

  Widget _iOSDialogPicker(BuildContext context, Widget text,
      {Widget? dialogContent}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(left: 16, right: 8),
      child: CupertinoDialogAction(
        child: items
            .firstWhere(
              (element) => element.value == currentValue,
              orElse: () => DropdownMenuItem<T>(
                  child: MyText(
                '- Choose Option -',
                type: MyTextType.title,
              )),
            )
            .child,
        textStyle: MyText.typeStyle(MyTextType.title),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => Container(
              height: 220,
              child: dialogContent,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }

  Widget _materialDropDownPicker(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(left: 16, right: 8),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          child: DropdownButton<T>(
            focusColor: Colors.white,
            style: MyText.typeStyle(MyTextType.title),
            isExpanded: true,
            isDense: false,
            value: currentValue,
            hint: Text(caption ?? '- Choose One -'),
            items: items,
            onChanged: onChanged,
            iconSize: 32,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
