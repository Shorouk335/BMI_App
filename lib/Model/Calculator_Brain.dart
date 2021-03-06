import 'dart:math';

class CalculatorBrain {
  final int? height;
  final int? weight;
  var _bmi;
  CalculatorBrain({required this.height, required this.weight});

  double ? calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi;
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterPretation() {
    if (_bmi >= 25) {
      return 'Overweight InterPretation';
    } else if (_bmi > 18.5) {
      return 'Normal InterPretation';
    } else {
      return 'Underweight InterPretation';
    }
  }
}
