import 'package:flutter/material.dart';
import 'package:flutter_mini_register/component/my_alert_dialog.dart';
import 'package:flutter_mini_register/component/my_button.dart';
import 'package:flutter_mini_register/component/my_drop_down.dart';
import 'package:flutter_mini_register/component/my_text.dart';
import 'package:flutter_mini_register/component/template/register_stepper.dart';
import 'package:flutter_mini_register/helper/navigation/navigate.dart';
import 'package:flutter_mini_register/logic/register/personal_info.dart';

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
  var _logic = PersonalInfoLogic();

  List<String> goalOptions = [
    "Invest",
    "Saving",
    "Emergency",
  ];
  String? goal;
  List<String> incomeOptions = [
    "0 - 1.000.000",
    "1.000.001 - 5.000.000",
    "5.000.001 - 10.000.000",
    "10.000.001 - 20.000.000",
    "20.000.001 - 50.000.000",
    "> 50.000.000"
  ];
  String? income;

  List<String> expanseOptions = [
    "0 - 1.000.000",
    "1.000.001 - 5.000.000",
    "5.000.001 - 10.000.000",
    "10.000.001 - 20.000.000",
    "20.000.001 - 50.000.000",
    "> 50.000.000"
  ];
  String? expanse;

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
      child: RegisterStepper(currentStep: 3),
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
              "Personal Information",
              type: MyTextType.title,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            MyText(
              "Please fill in the information below and your goal for digital saving.",
              type: MyTextType.body,
              color: Colors.white,
            ),
            SizedBox(height: 24),
            goalDropDown,
            SizedBox(height: 24),
            incomeDropDown,
            SizedBox(height: 24),
            expanseDropDown,
          ],
        ),
      ),
    );
  }

  Widget get goalDropDown {
    return MyDropDown<String>(
      items: goalOptions
          .map((e) => DropdownMenuItem(
                child: MyText(e, type: MyTextType.title),
                value: e,
              ))
          .toList(),
      currentValue: goal,
      caption: "Choose goal for activation",
      onChanged: (item) {
        setState(() {
          goal = item;
        });
      },
    );
  }

  Widget get incomeDropDown {
    return MyDropDown<String>(
      items: incomeOptions
          .map(
            (e) => DropdownMenuItem(
              child: MyText(e, type: MyTextType.title),
              value: e,
            ),
          )
          .toList(),
      currentValue: income,
      caption: "Choose your monthly income",
      onChanged: (item) {
        setState(() {
          income = item;
        });
      },
    );
  }

  Widget get expanseDropDown {
    return MyDropDown<String>(
      items: expanseOptions
          .map(
            (e) => DropdownMenuItem(
              child: MyText(e, type: MyTextType.title),
              value: e,
            ),
          )
          .toList(),
      currentValue: expanse,
      caption: "Choose your monthly expanse",
      onChanged: (item) {
        setState(() {
          expanse = item;
        });
      },
    );
  }

  Widget _footer() {
    return MyButton(
      text: "Next",
      color: Theme.of(context).primaryColorDark,
      onPressed: () {
        if (!_logic.isValidGoal(goal)) {
          showErrorDialog("Please choose your goal for activation");
          return;
        }
        if (!_logic.isValidIncome(income)) {
          showErrorDialog("Please choose your monthly income");
          return;
        }
        if (!_logic.isValidExpanse(expanse)) {
          showErrorDialog("Please choose your monthly expanse");
          return;
        }
        // todo: navigate to next page
      },
    );
  }

  void showErrorDialog(String message) {
    showMyDialog(
      context: context,
      builder: (context) => MyAlertDialog(
        title: "Sorry",
        content: message,
        actions: [
          MyAlertDialogButton(
            text: "OK",
            isDefaultAction: true,
            onPressed: Navigate(context).pop,
          ),
        ],
      ),
    );
  }
}
