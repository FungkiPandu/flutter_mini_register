import 'package:flutter/material.dart';
import 'package:flutter_mini_register/component/MyAlertDialog.dart';
import 'package:flutter_mini_register/component/my_button.dart';
import 'package:flutter_mini_register/component/my_text.dart';
import 'package:flutter_mini_register/component/my_text_field.dart';
import 'package:flutter_mini_register/component/template/register_stepper.dart';
import 'package:flutter_mini_register/helper/navigation/navigate.dart';
import 'package:flutter_mini_register/logic/register/password.dart';

class PasswordPage extends StatefulWidget {
  final String email;

  PasswordPage({Key? key, required this.email}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  var _logic = PasswordLogic();
  var _controller = TextEditingController();
  String _complexityStatus = "";
  Color _complexityStatusColor = Colors.red;
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
              controller: _controller,
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
        if (!_logic.isValidPassword(_controller.text)) {
          showMyDialog(
              context: context,
              builder: (context) => MyAlertDialog(
                    title: "Sorry",
                    content: "Please create Strong password.",
                    actions: [
                      MyAlertDialogButton(
                        text: "OK",
                        isDefaultAction: true,
                        onPressed: Navigate(context).pop,
                      )
                    ],
                  ));
          return;
        }
        Navigate(context)
            .toRegisterPage3PersonalInfo(widget.email, _controller.text);
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
        SizedBox(height: 6),
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
    var status = "";
    Color color = Colors.red;
    var point = _logic.calculatePasswordPoint(_controller.text);

    switch (point) {
      case 1:
        status = "Very Weak";
        color = Colors.red;
        break;
      case 2:
        status = "Weak";
        color = Colors.orangeAccent;
        break;
      case 3:
        status = "Good";
        color = Colors.yellow;
        break;
      case 4:
        status = "Strong";
        color = Colors.green;
        break;
    }

    setState(() {
      _complexityStatus = status;
      _complexityStatusColor = color;
    });
  }

  void _onTextChange(String text) {
    setState(() {
      _isLowerCase = _logic.isContainLowerCase(text);
      _isUpperCase = _logic.isContainUpperCase(text);
      _isNumber = _logic.isContainNumber(text);
      _isCharacters = _logic.isLast8(text);
    });
    _calculateStatus();
  }
}
