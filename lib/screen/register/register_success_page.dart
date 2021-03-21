import 'package:flutter/material.dart';
import 'package:flutter_mini_register/component/my_text.dart';

class RegisterSuccessPage extends StatefulWidget {
  RegisterSuccessPage({Key? key}) : super(key: key);

  @override
  _RegisterSuccessPageState createState() => _RegisterSuccessPageState();
}

class _RegisterSuccessPageState extends State<RegisterSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Account Activated!"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 46),
            MyText(
              "Congratulations!",
              type: MyTextType.h1,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 28),
            MyText(
              "Your account has been activated",
              type: MyTextType.h2,
              color: Theme.of(context).primaryColorDark,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            MyText(
              "Enjoy your days with your new account!",
              type: MyTextType.title,
            ),
            SizedBox(height: 64),
            MyText(
              "Made by Fungki Pandu Fantara",
              type: MyTextType.body,
            ),
            MyText(
              "As test project",
              type: MyTextType.body,
            ),
          ],
        ),
      ),
    );
  }
}
