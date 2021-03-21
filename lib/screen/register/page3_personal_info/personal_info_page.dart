import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  final String email;
  final String password;

  PersonalInfoPage({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
