import 'package:bmi_calculator_muhammed_mokbel/components/bottomAction.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class bmiResults extends StatelessWidget {
  bmiResults(
      {required this.bmiValue,
      required this.resultText,
      required this.resultDestils});

  double bmiValue;
  String resultText;
  String resultDestils;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Your Results',
              style: kResultsTitleStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: kActiveCardColor,
              margin: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(resultText, style: kResultsTextStyle),
                  Text(bmiValue.toStringAsFixed(1), style: kBMIValue),
                  Text(
                    resultDestils,
                    style: kResultsDescription,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomAction(
            onTap: () {
              Navigator.pop(context);
            },
            buttonText: 'Re-Calculate',
          )
        ],
      ),
    );
  }
}
