import 'package:bmi_calculator_muhammed_mokbel/calculator_brain.dart';
import 'package:bmi_calculator_muhammed_mokbel/components/bmiCard.dart';
import 'package:bmi_calculator_muhammed_mokbel/components/bmiCardItem.dart';
import 'package:bmi_calculator_muhammed_mokbel/components/bottomAction.dart';
import 'package:bmi_calculator_muhammed_mokbel/components/roundedIconButton.dart';
import 'package:bmi_calculator_muhammed_mokbel/screens/bmiResults.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class BmiInput extends StatefulWidget {
  const BmiInput({super.key});

  @override
  State<BmiInput> createState() => _BmiInputState();
}

class _BmiInputState extends State<BmiInput> {
  Gender selectedGender = Gender.other;

  int height = 180;
  int weight = 60;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: BMICard(
                  onPressCard: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardChild: BMICardItem(
                    icon: FontAwesomeIcons.mars,
                    textIcon: 'Male',
                  ),
                  cardColor: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInActiveCardColour,
                ),
              ),
              Expanded(
                child: BMICard(
                  onPressCard: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardChild: BMICardItem(
                    icon: FontAwesomeIcons.venus,
                    textIcon: 'Female',
                  ),
                  cardColor: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInActiveCardColour,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: BMICard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: orientation == Orientation.landscape
                                ? kNumberTextStyleResponsive
                                : kNumberTextStyle,
                          ),
                          Text('cm')
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kActiveTrackColor,
                          inactiveTrackColor: kInactiveTrackColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          thumbColor: kThumbColor,
                          overlayColor: kOverlayColor,
                          trackHeight: 2.0,
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 300.0,
                            onChanged: (newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  ),
                  cardColor: kActiveCardColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: BMICard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: orientation == Orientation.landscape
                            ? kNumberTextStyleResponsive
                            : kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Roundediconbutton(
                            buttonIcon: Icon(FontAwesomeIcons.minus),
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Roundediconbutton(
                            buttonIcon: Icon(FontAwesomeIcons.plus),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  cardColor: kActiveCardColor,
                ),
              ),
              Expanded(
                  child: BMICard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: orientation == Orientation.landscape
                          ? kNumberTextStyleResponsive
                          : kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Roundediconbutton(
                          buttonIcon: Icon(FontAwesomeIcons.minus),
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Roundediconbutton(
                          buttonIcon: Icon(FontAwesomeIcons.plus),
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
                cardColor: kActiveCardColor,
              )),
            ],
          ),
        ),
        BottomAction(
          onTap: () {
            CalculatorBrain brain =
                CalculatorBrain(height: height, weight: weight);
            double bmiValue = brain.calculateBMI();
            String resultText = brain.getResult();
            String resultDescription = brain.getInterpretation();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => bmiResults(
                  bmiValue: bmiValue,
                  resultText: resultText,
                  resultDestils: resultDescription,
                ),
              ),
            );
          },
          buttonText: 'CALCULATE',
        )
      ],
    );
  }
}
