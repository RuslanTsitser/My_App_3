import 'package:calculator_provider/calculator_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorChangeNotifier(),
      child: MaterialApp(
        home: Calculator(),
      ),
    );
  }
}
