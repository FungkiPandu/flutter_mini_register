import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mini_register/screen/register/page1_email/email_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          elevation: 0,
        ),
        primarySwatch: Colors.indigo,
      ),
      home: EmailPage(),
    );
  }
}