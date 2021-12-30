import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorChangeNotifier extends ChangeNotifier {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String inputField = '0';
  num? _result;
  num? get result => _result;

  void getResult() {
    _result = inputField.interpret();
  }
}
