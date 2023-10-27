import 'package:flutter/material.dart';

//Button for Login/Registration
class button_1 extends StatelessWidget {
  final String text;
  final Function onPressed;

  button_1({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Text(text),
    );
  }
}
