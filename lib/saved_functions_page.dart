import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'calculator_change_notifier.dart';

class SavedFunctions extends StatelessWidget {
  const SavedFunctions({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved functions'),
      ),
      body: Form(
        child: Center(
          child: Text(
            '${context.read<CalculatorChangeNotifier>().inputField}=${context.read<CalculatorChangeNotifier>().result}',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
