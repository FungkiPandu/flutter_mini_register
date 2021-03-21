import 'package:flutter/material.dart';

class ScheduleVidCallPage extends StatefulWidget {
  final String email;
  final String password;
  final String goal;
  final String income;
  final String expanse;

  ScheduleVidCallPage({
    Key? key,
    required this.email,
    required this.password,
    required this.goal,
    required this.income,
    required this.expanse,
  }) : super(key: key);

  @override
  _ScheduleVidCallPageState createState() => _ScheduleVidCallPageState();
}

class _ScheduleVidCallPageState extends State<ScheduleVidCallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
