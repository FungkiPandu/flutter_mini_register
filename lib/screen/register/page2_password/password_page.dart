import 'package:flutter/material.dart';
import 'package:flutter_mini_register/component/template/register_stepper.dart';

class PasswordPage extends StatefulWidget {
  final String email;

  PasswordPage({Key? key, required this.email}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: Column(children: [_header(), _body()]),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Hero(
          tag: "stepper",
          child: RegisterStepper(
            currentStep: 2,
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return Container();
  }
}
