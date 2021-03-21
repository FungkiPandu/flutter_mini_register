import 'package:flutter/material.dart';
import 'package:flutter_mini_register/component/my_button.dart';
import 'package:flutter_mini_register/component/my_text.dart';
import 'package:flutter_mini_register/component/template/register_stepper.dart';
import 'package:flutter_mini_register/helper/datetime.dart';

class RegisterConfirmationPage extends StatefulWidget {
  final String email;
  final String password;
  final String goal;
  final String income;
  final String expanse;
  final DateTime scheduleVidCall;

  RegisterConfirmationPage({
    Key? key,
    required this.email,
    required this.password,
    required this.goal,
    required this.income,
    required this.expanse,
    required this.scheduleVidCall,
  }) : super(key: key);

  @override
  _RegisterConfirmationPageState createState() =>
      _RegisterConfirmationPageState();
}

class _RegisterConfirmationPageState extends State<RegisterConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmation Account"),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(children: [_header(), Expanded(child: _body()), _footer()]),
    );
  }

  Widget _header() {
    return Hero(
      tag: "stepper",
      child: RegisterStepper(currentStep: 5),
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
              "Confirmation",
              type: MyTextType.title,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            MyText(
              "Please check your data below",
              type: MyTextType.body,
              color: Colors.white,
            ),
            SizedBox(height: 24),
            MyText(
              "Email",
              type: MyTextType.title,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            MyText(
              widget.email,
              type: MyTextType.body,
              color: Colors.white,
            ),
            SizedBox(height: 24),
            MyText(
              "Password",
              type: MyTextType.title,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            MyText(
              List<String>.generate(widget.password.length, (index) => "*")
                  .join(),
              type: MyTextType.body,
              color: Colors.white,
            ),
            SizedBox(height: 24),
            MyText(
              "Goal for activation",
              type: MyTextType.title,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            MyText(
              widget.goal,
              type: MyTextType.body,
              color: Colors.white,
            ),
            SizedBox(height: 24),
            MyText(
              "Monthly Income",
              type: MyTextType.title,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            MyText(
              widget.income,
              type: MyTextType.body,
              color: Colors.white,
            ),
            SizedBox(height: 24),
            MyText(
              "Monthly Expanse",
              type: MyTextType.title,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            MyText(
              widget.expanse,
              type: MyTextType.body,
              color: Colors.white,
            ),
            SizedBox(height: 24),
            MyText(
              "Schedule Video Call",
              type: MyTextType.title,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            MyText(
              DateTimeHelper(widget.scheduleVidCall).formattedDate,
              type: MyTextType.body,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            MyText(
              "At " + DateTimeHelper(widget.scheduleVidCall).formattedTime,
              type: MyTextType.body,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _footer() {
    return MyButton(
      text: "Activate",
      color: Theme.of(context).primaryColorDark,
      onPressed: () {},
    );
  }
}
