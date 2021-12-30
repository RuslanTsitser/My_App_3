import 'package:calculator_provider/calculator_change_notifier.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'widgets/buttons_form.dart';
import 'widgets/input_form.dart';
import 'widgets/result_button_widget.dart';

class Calculator extends StatelessWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = context.read<CalculatorChangeNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Калькулятор',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Form(
          key: c.formKey,
          child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputForm(),
                    SizedBox(height: 12),
                    ButtonsWidget(buttonController: c.controller),
                  ]))),
      floatingActionButton: ResultButton(),
    );
  }
}
