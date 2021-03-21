import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mini_register/screen/register/page2_password/password_page.dart';

class Navigate {
  final BuildContext context;

  Navigate(this.context);

  Future<dynamic> toRegisterPage2Password(String email) {
    return Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => PasswordPage(email: email)),
    );
  }
}
