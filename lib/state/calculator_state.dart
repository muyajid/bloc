abstract class CalculatorState {}

class CalculatorIntialState extends CalculatorState {}

class CalculatorResultState extends CalculatorState {
  final double result;
  CalculatorResultState(this.result);
}
