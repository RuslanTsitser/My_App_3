import 'package:calculator_provider/calculator_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:function_tree/function_tree.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = context.read<CalculatorChangeNotifier>();
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        onSaved: (value) => c.inputField = value ?? '0',
        onFieldSubmitted: (value) => c.inputField = value,
        keyboardType: TextInputType.none,
        controller: c.controller,
        decoration: InputDecoration(
          hintText: 'Введите формулу',
          suffixIcon: IconButton(
            onPressed: () => c.controller.clear(),
            icon: Icon(Icons.clear),
          ),
        ),
        validator: (value) {
          try {
            value?.interpret();
          } catch (e) {
            return 'Проверьте правильность записи';
          }
        },
      ),
    );
  }
}
