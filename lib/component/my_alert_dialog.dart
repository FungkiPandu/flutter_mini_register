import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAlertDialog extends StatelessWidget {
  final String? title;
  final Widget? header;
  final String? content;
  final Widget? body;
  final List<MyAlertDialogButton> actions;

  /// [headerPadding] and [bodyPadding] only work inside material container (android)
  final EdgeInsets? headerPadding;
  final EdgeInsets bodyPadding;

  MyAlertDialog({
    Key? key,
    this.header,
    this.title,
    this.headerPadding,
    this.content,
    this.body,
    this.bodyPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.actions = const [],
  })  : assert((header == null && title != null) || header != null),
        assert((body == null && content != null) || body != null);

  @override
  Widget build(BuildContext context) {
    // below 2 lines was checked by assert, so it safe to has (!)
    Widget titleChild = header != null ? header! : Text(title!);
    Widget child = body != null ? body! : Text(content!);

    if (Platform.isIOS) {
      var newActions = actions;
      if (!actions.any((action) => action.isDefaultAction)) {
        newActions = actions.map((act) {
          if (act != actions.last) return act;
          return MyAlertDialogButton(
            onPressed: act.onPressed,
            text: act.text,
            isDefaultAction: true,
          );
        }).toList();
      }
      return CupertinoAlertDialog(
        title: titleChild,
        content: Padding(padding: EdgeInsets.only(top: 16), child: child),
        actions: newActions,
      );
    }
    return AlertDialog(
      titlePadding: headerPadding,
      title: titleChild,
      contentPadding: bodyPadding,
      content: child,
      actions: actions,
    );
  }
}

Future<dynamic> showMyDialog({
  required BuildContext context,
  required WidgetBuilder builder,
  bool useRootNavigator = true,

  /// [barrierDismissible] can't applied to cupertino dialog, always false
  bool barrierDismissible = true,
}) {
  if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context,
      builder: builder,
      useRootNavigator: useRootNavigator,
    );
  }
  return showDialog(
    context: context,
    builder: builder,
    useRootNavigator: useRootNavigator,
    barrierDismissible: barrierDismissible,
  );
}

class MyAlertDialogButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isDefaultAction;

  MyAlertDialogButton(
      {Key? key, this.text = "", this.onPressed, this.isDefaultAction = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoDialogAction(
        child: Text(text),
        onPressed: onPressed,
        isDefaultAction: isDefaultAction,
      );
    } else {
      return TextButton(
        onPressed: onPressed,
        child: Text(text.toUpperCase()),
        style: TextButton.styleFrom(
          textStyle: TextStyle(color: Theme.of(context).accentColor),
        ),
      );
    }
  }
}
