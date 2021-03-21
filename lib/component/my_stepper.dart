import 'package:flutter/material.dart';

class MyStepper extends StatelessWidget {
  final int stepCount;
  final int currentStep;
  final double paddingSize;
  final double fontSize;

  const MyStepper({
    Key? key,
    required this.stepCount,
    this.currentStep = 1,
    this.paddingSize = 8,
    this.fontSize = 12,
  })  : assert(currentStep > 0 && currentStep <= stepCount + 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    double stepSize = fontSize + paddingSize * 2;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(stepCount * 2 - 1, (index) {
          if (index % 2 == 1) {
            return Expanded(
              child: Container(
                height: 2,
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: paddingSize / 2),
              ),
            );
          }
          int thisStep = (((index + 1) / 2) + 1).toInt();
          Color stepColor = Colors.deepOrange;
          if (thisStep == currentStep)
            stepColor = Colors.orangeAccent;
          else if (thisStep < currentStep) stepColor = Colors.green;

          return Container(
            width: stepSize,
            height: stepSize,
            padding: EdgeInsets.fromLTRB(
              paddingSize,
              paddingSize - 1,
              paddingSize,
              paddingSize + 1,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(stepSize / 2),
              color: stepColor,
            ),
            child: Text(
              thisStep.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}
