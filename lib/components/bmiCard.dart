import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  const BMICard(
      {super.key,
      required this.cardChild,
      required this.cardColor,
      this.onPressCard});

  final Widget cardChild;
  final Color cardColor;
  final onPressCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressCard,
      child: Container(
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: cardColor,
        ),
        child: cardChild,
      ),
    );
  }
}
