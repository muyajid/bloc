abstract class CalculatorEvent {}

class CalculateEvent extends CalculatorEvent {
  final double a;
  final double b;
  final String operator;

  CalculateEvent(this.a, this.b, this.operator);
}
