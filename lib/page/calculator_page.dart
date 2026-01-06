import 'package:belajar_bloc_1/bloc/calculator_bloc.dart';
import 'package:belajar_bloc_1/event/calculator_event.dart';
import 'package:belajar_bloc_1/state/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final TextEditingController aC = TextEditingController();
  final TextEditingController bC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aritmatik Kalkulator")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: aC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Input angka 1",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: bC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Input angka 2",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CalculatorBloc>().add(
                      CalculateEvent(
                        double.parse(aC.text),
                        double.parse(bC.text),
                        "+",
                      ),
                    );
                  },
                  child: Text("+"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CalculatorBloc>().add(
                      CalculateEvent(
                        double.parse(aC.text),
                        double.parse(bC.text),
                        "-",
                      ),
                    );
                  },
                  child: Text("-"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CalculatorBloc>().add(
                      CalculateEvent(
                        double.parse(aC.text),
                        double.parse(bC.text),
                        "*",
                      ),
                    );
                  },
                  child: Text("*"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CalculatorBloc>().add(
                      CalculateEvent(
                        double.parse(aC.text),
                        double.parse(bC.text),
                        "/",
                      ),
                    );
                  },
                  child: Text("/"),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text("Hasil = ", style: TextStyle(fontSize: 20)),
          BlocBuilder<CalculatorBloc, CalculatorState>(
            builder: (context, state) {
              if (state is CalculatorResultState) {
                return Text(
                  'Hasil: ${state.result}',
                  style: const TextStyle(fontSize: 24),
                );
              }
              return const Text('Hasil: 0', style: TextStyle(fontSize: 24));
            },
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              context.read<CalculatorBloc>().add(
                CalculateEvent(
                  double.parse(aC.text),
                  double.parse(bC.text),
                  "reset",
                ),
              );
            },
            child: Text("Reset"),
          ),
        ],
      ),
    );
  }
}
