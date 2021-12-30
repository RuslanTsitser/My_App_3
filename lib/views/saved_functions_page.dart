import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../calculator_change_notifier.dart';

class SavedFunctions extends StatelessWidget {
  const SavedFunctions({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.read<CalculatorChangeNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved functions'),
      ),
      body: Form(
        child: Center(
          child: Text(
            '${c.inputField}=${c.result}',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
