import 'package:flutter/material.dart';

import '../constants.dart';

class BMICardItem extends StatelessWidget {
  const BMICardItem({super.key, this.icon, this.textIcon});

  final icon;
  final textIcon;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: orientation == Orientation.landscape ? 28.0 : 80.0,
        ),
        Text(
          textIcon,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
