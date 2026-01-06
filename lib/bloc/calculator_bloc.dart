import 'package:belajar_bloc_1/event/calculator_event.dart';
import 'package:belajar_bloc_1/state/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorIntialState()) {
    on<CalculateEvent>((event, emit) {
      double result = 0;

      switch (event.operator) {
        case "+":
          result = event.a + event.b;
          break;
        case "-":
          result = event.a - event.b;
          break;
        case "*":
          result = event.a * event.b;
          break;
        case "/":
          result = event.a / event.b;
          break;
        default:
          result = 0;
          break;
      }
      emit(CalculatorResultState(result));
    });
  }
}
