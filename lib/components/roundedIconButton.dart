import 'package:flutter/material.dart';

class Roundediconbutton extends StatelessWidget {
  const Roundediconbutton(
      {super.key, required this.buttonIcon, required this.onPressed});

  final Icon buttonIcon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 12.0,
      constraints: BoxConstraints.tightFor(
        width: 48,
        height: 48,
      ),
      child: buttonIcon,
      fillColor: Color(0xff5d5f6e),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
