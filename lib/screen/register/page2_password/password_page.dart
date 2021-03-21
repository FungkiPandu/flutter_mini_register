import 'package:flutter/material.dart';
import 'package:flutter_mini_register/component/my_button.dart';
import 'package:flutter_mini_register/component/my_text.dart';
import 'package:flutter_mini_register/component/my_text_field.dart';
import 'package:flutter_mini_register/component/template/register_stepper.dart';

class PasswordPage extends StatefulWidget {
  final String email;

  PasswordPage({Key? key, required this.email}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  String _complexityStatus = "";
  Color _complexityStatusColor = Colors.red;
  int _complexityPoint = 0;
  bool _isLowerCase = false;
  bool _isUpperCase = false;
  bool _isNumber = false;
  bool _isCharacters = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(children: [_header(), Expanded(child: _body()), _footer()]),
    );
  }

  Widget _header() {
    return Hero(
      tag: "stepper",
      child: RegisterStepper(currentStep: 2),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              "Create Password",
              type: MyTextType.title,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            MyText(
              "Password will be used to login to account",
              type: MyTextType.body,
              color: Colors.white,
            ),
            SizedBox(height: 24),
            MyTextField(
              hintText: "Create Password",
              fillColor: Colors.white,
              type: MyTextFieldType.contained,
              isPassword: true,
              onChanged: _onTextChange,
            ),
            SizedBox(height: 24),
            _complexityInfo(),
            SizedBox(height: 30),
            _complexityDetail(),
          ],
        ),
      ),
    );
  }

  Widget _footer() {
    return MyButton(
      text: "Next",
      color: Theme.of(context).primaryColorDark,
      onPressed: () {
        // todo validate input, if success move to next page
      },
    );
  }

  Widget _complexityInfo() {
    return Text.rich(
      TextSpan(
        style: MyText.typeStyle(MyTextType.body, color: Colors.white),
        children: [
          TextSpan(text: "Complexity:  "),
          TextSpan(
            text: _complexityStatus,
            style: MyText.typeStyle(
              MyTextType.body,
              color: _complexityStatusColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _complexityDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _complexityItem("a", "Lowercase", success: _isLowerCase),
        _complexityItem("A", "Uppercase", success: _isUpperCase),
        _complexityItem("123", "Number", success: _isNumber),
        _complexityItem("8+", "Characters", success: _isCharacters),
      ],
    );
  }

  Widget _complexityItem(String symbol, String label, {bool success = false}) {
    Widget sym = MyText(symbol, type: MyTextType.h2, color: Colors.white);
    if (success) sym = _checkIcon;
    return Column(
      children: [
        sym,
        SizedBox(height: 4),
        MyText(label, type: MyTextType.body, color: Colors.white),
      ],
    );
  }

  Widget get _checkIcon => Container(
        child: Icon(Icons.check, color: Colors.white, size: 20),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
      );

  void _calculateStatus() {
    var status = "Very Weak";
    Color color = Colors.red;
    var point = 0;
    if (_isLowerCase) point++; // weak
    if (_isUpperCase) point++; // good
    if (_isNumber) point++; // string
    if (_isCharacters) point++; // very strong

    switch (point) {
      case 1:
        status = "Weak";
        color = Colors.orange;
        break;
      case 2:
        status = "Good";
        color = Colors.yellow;
        break;
      case 3:
        status = "Strong";
        color = Colors.lightGreenAccent;
        break;
      case 4:
        status = "Very Strong";
        color = Colors.green;
        break;
    }

    setState(() {
      _complexityPoint = point;
      _complexityStatus = status;
      _complexityStatusColor = color;
    });
  }

  void _onTextChange(String text) {
    setState(() {
      _isLowerCase = text.contains(RegExp(r"[a-z]"));
      _isUpperCase = text.contains(RegExp(r"[A-Z]"));
      _isNumber = text.contains(RegExp(r"[0-9]"));
      _isCharacters = text.length >= 8;
    });
    _calculateStatus();
  }
}
