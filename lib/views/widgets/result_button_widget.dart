import 'package:flutter/material.dart';

import '../../calculator_change_notifier.dart';
import '../saved_functions_page.dart';
import 'package:provider/provider.dart';

class ResultButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = context.read<CalculatorChangeNotifier>();
    return FloatingActionButton(
      backgroundColor: Colors.grey[800],
      onPressed: () {
        if (c.formKey.currentState!.validate() == true) {
          c.formKey.currentState!.save();
          c.getResult();
          showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: Text(
                    c.result!.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                );
              });

          c.controller.clear();
        }
      },
      child: Icon(Icons.arrow_right),
    );
  }
}
