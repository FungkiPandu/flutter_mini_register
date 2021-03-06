import 'package:flutter/material.dart';
import 'package:flutter_mini_register/component/my_alert_dialog.dart';
import 'package:flutter_mini_register/component/my_button.dart';
import 'package:flutter_mini_register/component/my_date_picker.dart';
import 'package:flutter_mini_register/component/my_text.dart';
import 'package:flutter_mini_register/component/my_time_picker.dart';
import 'package:flutter_mini_register/component/template/register_stepper.dart';
import 'package:flutter_mini_register/helper/datetime.dart';
import 'package:flutter_mini_register/helper/navigation/navigate.dart';
import 'package:flutter_mini_register/logic/register/schedule_vidcall.dart';

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

class _ScheduleVidCallPageState extends State<ScheduleVidCallPage>
    with SingleTickerProviderStateMixin {
  var _logic = ScheduleVidCallLogic();

  late Animation<double> _animation;
  late AnimationController _controller;

  DateTime? _selectedDate;
  DateTime? _selectedTime;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 40, end: 63).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

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
      child: RegisterStepper(currentStep: 4),
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
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(height: 80),
                Center(
                  child: Container(
                    height: _animation.value,
                    width: _animation.value,
                    child: Icon(Icons.event),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(_animation.value / 2),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            MyText(
              "Schedule Video Call",
              type: MyTextType.title,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            MyText(
              "Choose the date and time that you preferred, we will send a "
              "link via email to make a video call on the scheduled date "
              "and time",
              type: MyTextType.body,
              color: Colors.white,
            ),
            SizedBox(height: 24),
            MyDatePicker(
              caption: "Date",
              currentDateTime: _selectedDate,
              onDateTimeChanged: (dateTime) {
                setState(() {
                  _selectedDate = dateTime;
                });
              },
            ),
            SizedBox(height: 24),
            MyTimePicker(
              caption: "Time",
              currentDateTime: _selectedTime,
              onDateTimeChanged: (dateTime) {
                setState(() {
                  _selectedTime = dateTime;
                });
              },
            ),
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
        // validate date and time
        if (!_logic.isDateValid(_selectedDate)) {
          _showErrorDialog("Please choose date first");
          return;
        }
        if (!_logic.isTimeValid(_selectedTime)) {
          _showErrorDialog("Please choose time first");
          return;
        }
        if (!_logic.isDateAndTimeValid(_selectedDate, _selectedTime)) {
          _showErrorDialog("Please choose date and time more than now");
          return;
        }
        Navigate(context).toRegisterConfirmationPage(
          widget.email,
          widget.password,
          widget.goal,
          widget.income,
          widget.expanse,
          DateTimeHelper.bindDateTime(_selectedDate!, _selectedTime!),
        );
      },
    );
  }

  void _showErrorDialog(String message) {
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
