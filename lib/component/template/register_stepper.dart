import 'package:flutter/material.dart';

import '../my_stepper.dart';

class RegisterStepper extends StatelessWidget {
  final int currentStep;

  const RegisterStepper({Key? key, this.currentStep = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: MyStepper(
          stepCount: 4,
          currentStep: currentStep,
          fontSize: 14,
          paddingSize: 12,
        ),
      ),
    );
  }
}
