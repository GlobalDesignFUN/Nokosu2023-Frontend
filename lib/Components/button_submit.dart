import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:nokosu2023/utils/constants.dart';

//Button for Login/Registration submit
class ButtonSubmit extends StatefulWidget {
  final String text;
  final Function onPressed;
  final double boxWidth;
  final double boxHeight;

  const ButtonSubmit({
    Key? key,
    required this.text,
    required this.onPressed,
    this.boxWidth = NumericConsts.defBoxWidth,
    this.boxHeight = NumericConsts.defBoxHeight,
  }) : super(key: key);

  @override
  ButtomSubmitState createState() => ButtomSubmitState();
}

class ButtomSubmitState extends State<ButtonSubmit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        child: Text(widget.text),
        onPressed: () {
          widget.onPressed();
        },
      ),
    );
  }
}
