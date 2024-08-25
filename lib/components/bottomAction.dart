import 'package:bmi_calculator_muhammed_mokbel/constants.dart';
import 'package:flutter/material.dart';

class BottomAction extends StatelessWidget {
  BottomAction({required this.onTap, required this.buttonText});

  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              color: kBottomActionColor,
              child: Center(
                child: Text(
                  buttonText.toUpperCase(),
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
            ),
          ),
        ),
      ],
    );
  }
}
