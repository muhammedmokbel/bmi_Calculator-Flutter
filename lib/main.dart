import 'package:bmi_calculator_muhammed_mokbel/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/bmiInput.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Lock orientation to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const BmiCalculator());
    // runApp(MyApp());
  });
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kScaffoldColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI CALCULATOR'),
          ),
        ),
        body: BmiInput(),
      ),
    );
  }
}
