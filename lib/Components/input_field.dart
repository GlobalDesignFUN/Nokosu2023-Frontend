import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:nokosu2023/Components/SubComponents/error_field.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputField extends StatefulWidget {
  final String label;
  final bool isEnabled;
  final bool isErr;
  final String err;
  final double boxWidth;
  final double boxHeight;
  final TextEditingController controller;
  final bool ispasswordField;
  final String prefixicon;
  final double border;

  const InputField({
    Key? key,
    required this.label,
    required this.controller,
    required this.prefixicon,
    this.boxWidth = NumericConsts.defBoxWidth,
    this.boxHeight = NumericConsts.defBoxHeight,
    this.err = '',
    this.ispasswordField = false,
    this.border = 100,
    this.isErr = true,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.ispasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            width: widget.boxWidth,
            height: widget.boxHeight,
            child: Neumo(
              child: TextFormField(
                controller: widget.controller,
                obscureText: obscureText,
                style: const TextStyle(color: ThemeColours.txtBlack),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.label,
                  hintStyle: const TextStyle(color: ThemeColours.txtGrey),
                  prefixIcon: IconButton(

                    icon :  SvgPicture.asset(
                    widget.prefixicon,
                    width: 20,
                    height:20,
                    
                  ),
                  onPressed: null,
                  ),
                  
                  suffixIcon: widget.ispasswordField
                      ? IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: ThemeColours.iconBlack,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        )
                      : null,
                ),
              ),
            ),
          ),
          if (widget.isErr) ErrorField(err: widget.err),
          if (!widget.isErr)
            const SizedBox(
              height: 20,
            )
        ],
      ),
    );
  }
}
