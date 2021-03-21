import 'package:flutter/material.dart';
import 'package:flutter_mini_register/component/my_button.dart';
import 'package:flutter_mini_register/component/my_text_field.dart';
import 'package:flutter_mini_register/component/template/register_stepper.dart';
import 'package:flutter_mini_register/helper/navigation/navigate.dart';
import 'package:flutter_mini_register/logic/register/email.dart';

class EmailPage extends StatefulWidget {
  EmailPage({Key? key}) : super(key: key);

  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  var _logic = EmailLogic();
  var _emailController = TextEditingController();
  var _emailTextFieldKey = GlobalKey<FormState>();
  var _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: Column(children: [_header(), _body()]),
    );
  }

  Widget _header() => Hero(
        tag: "stepper",
        child: RegisterStepper(currentStep: 1),
      );

  Widget _body() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                SizedBox(height: 12),
                ..._welcomeHeaders(),
                SizedBox(height: 16),
                _welcomeText,
                SizedBox(height: 28),
                MyTextField(
                  formKey: _emailTextFieldKey,
                  prefixIcon: Icons.email_outlined,
                  controller: _emailController,
                  hintText: "Email",
                  inputType: TextInputType.emailAddress,
                  autoValidate: _autoValidate,
                  validator: _logic.emailValidator,
                ),
              ],
            ),
          ),
          _nextButton(),
        ],
      ),
    );
  }

  List<Widget> _welcomeHeaders() {
    return [
      Text(
        "Welcome to",
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      Text.rich(
        TextSpan(
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: 'Bank ',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: 'JAGO',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            TextSpan(
              text: '!',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    ];
  }

  Widget _welcomeText = Text(
    "Welcome to The Bank of The Future.\n"
    "Manage and track your accounts on the go.",
    style: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  );

  Widget _nextButton() {
    return MyButton(
      text: 'Next',
      onPressed: () {
        var isValid = _emailTextFieldKey.currentState?.validate() ?? false;
        if (!isValid) {
          setState(() {
            _autoValidate = true;
          });
          return;
        }

        var email = _emailController.value.text;
        Navigate(context).toRegisterPage2Password(email);
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
