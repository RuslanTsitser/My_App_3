import 'package:calculator_provider/calculator_change_notifier.dart';
import 'package:calculator_provider/saved_functions_page.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:provider/provider.dart';

import 'buttons_form.dart';

class Calculator extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              InputForm(),
              SizedBox(height: 12),
              ButtonsWidget(
                  buttonController:
                      context.read<CalculatorChangeNotifier>().controller),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState!.validate() == true) {
            formKey.currentState!.save();
            context.read<CalculatorChangeNotifier>().getResult();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SavedFunctions(),
              ),
            );
          }
        },
        child: Icon(Icons.arrow_right),
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value) =>
          context.read<CalculatorChangeNotifier>().inputField = value ?? '0',
      onFieldSubmitted: (value) =>
          context.read<CalculatorChangeNotifier>().inputField = value,
      keyboardType: TextInputType.number,
      controller: context.read<CalculatorChangeNotifier>().controller,
      decoration: InputDecoration(
        hintText: 'What to measure?',
        suffixIcon: IconButton(
          onPressed: () =>
              context.read<CalculatorChangeNotifier>().controller.clear(),
          icon: Icon(Icons.clear),
        ),
      ),
      validator: (value) {
        try {
          value?.interpret();
        } catch (e) {
          return 'Error';
        }
      },
    );
  }
}
