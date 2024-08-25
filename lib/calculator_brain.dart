import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  int height;
  int weight;
  double? _bmiValue;

  double calculateBMI() {
    _bmiValue = weight / pow((height / 100), 2);

    return _bmiValue!;
  }

  String getResult() {
    if (_bmiValue! >= 25 && _bmiValue! < 30)
      return 'Overweight';
    else if (_bmiValue! >= 30)
      return 'Obese';
    else if (_bmiValue! >= 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmiValue! >= 25 && _bmiValue! < 30) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmiValue! >= 30) {
      return 'You are in danger please visit the doctor!';
    } else if (_bmiValue! >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
