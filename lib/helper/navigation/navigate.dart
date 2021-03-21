import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mini_register/screen/register/page2_password/password_page.dart';
import 'package:flutter_mini_register/screen/register/page3_personal_info/personal_info_page.dart';

class Navigate {
  final BuildContext context;

  Navigate(this.context);

  void pop<T extends Object?>([T? result]) {
    return Navigator.of(context).pop(result);
  }

  Future<dynamic> toRegisterPage2Password(String email) {
    return Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => PasswordPage(email: email)),
    );
  }

  Future<dynamic> toRegisterPage3PersonalInfo(String email, String password) {
    return Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => PersonalInfoPage(
          email: email,
          password: password,
        ),
      ),
    );
  }
}
