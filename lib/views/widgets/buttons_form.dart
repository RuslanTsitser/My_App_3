import 'package:flutter/material.dart';

class ButtonsWidget extends StatelessWidget {
  final buttonController;

  const ButtonsWidget({
    Key? key,
    required this.buttonController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(controller: buttonController, value: '1'),
              MyButton(controller: buttonController, value: '2'),
              MyButton(controller: buttonController, value: '3'),
              MyButton(controller: buttonController, value: '+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(controller: buttonController, value: '4'),
              MyButton(controller: buttonController, value: '5'),
              MyButton(controller: buttonController, value: '6'),
              MyButton(controller: buttonController, value: '-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(controller: buttonController, value: '7'),
              MyButton(controller: buttonController, value: '8'),
              MyButton(controller: buttonController, value: '9'),
              MyButton(controller: buttonController, value: '*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(controller: buttonController, value: '0'),
              MyButton(controller: buttonController, value: '('),
              MyButton(controller: buttonController, value: ')'),
              MyButton(controller: buttonController, value: '-'),
            ],
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.controller,
    required this.value,
  }) : super(key: key);

  final TextEditingController controller;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width / 5,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return Theme.of(context).colorScheme.primary.withOpacity(0);
            },
          ),
        ),
        onPressed: () {
          var text = controller.text;
          var pos = controller.selection.start;
          if (pos == -1) {
            controller.text = controller.text + value;
          } else {
            controller.value = TextEditingValue(
              text: text.substring(0, pos) + value + text.substring(pos),
              selection: TextSelection.collapsed(offset: pos + value.length),
            );
          }
        },
        child: Text(value),
      ),
    );
  }
}
