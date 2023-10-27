import 'package:flutter/material.dart';

//Button for Login/Registration
class input_1 extends StatelessWidget {
  final String label;
  final double width;
  final Color borderColor;
  final Color labeltextColor;
  final BorderRadius borderRad;

  input_1({
    required this.label,
    this.width = 200,
    this.borderColor = Colors.orange,
    this.labeltextColor = const Color.fromARGB(255, 243, 187, 33),
    this.borderRad = const BorderRadius.all(Radius.circular(20)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // TextFormFieldの幅を狭くする
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: labeltextColor,
            decoration: TextDecoration.none,
          ),
          border: OutlineInputBorder(
            borderRadius: borderRad,
          ),
        ),
      ),
    );
  }
}
