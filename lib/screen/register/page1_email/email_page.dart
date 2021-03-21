import 'package:flutter/material.dart';
import 'package:flutter_mini_register/component/my_button.dart';
import 'package:flutter_mini_register/component/my_text.dart';
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
      MyText(
        "Welcome to",
        type: MyTextType.h2,
      ),
      Text.rich(
        TextSpan(
          style: MyText.typeStyle(MyTextType.h1),
          children: [
            TextSpan(text: 'Bank '),
            TextSpan(
              text: 'JAGO',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            TextSpan(text: '!'),
          ],
        ),
      ),
    ];
  }

  Widget _welcomeText = MyText(
    "Welcome to The Bank of The Future.\n"
    "Manage and track your accounts on the go.",
    type: MyTextType.title,
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
