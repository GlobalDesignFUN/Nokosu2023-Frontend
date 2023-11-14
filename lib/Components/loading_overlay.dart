import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:nokosu2023/utils/constants.dart';

class LoadingOverlay extends StatefulWidget {
  const LoadingOverlay({
    Key? key,
  }) : super(key: key);

  @override
  LoadingOverlayState createState() => LoadingOverlayState();
}

class LoadingOverlayState extends State<LoadingOverlay> {
  final List<BoxShadow> containerShadowDecoration = [
    BoxShadow(
      blurRadius: 6,
      offset: const Offset(-6, -6),
      color: ThemeColours.shadowLight.withOpacity(0.3),
    ),
    BoxShadow(
      blurRadius: 6,
      offset: const Offset(6, 6),
      color: ThemeColours.shadowDark.withOpacity(0.3),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.08),
      ),
      height: height,
      width: width,
      child: Center(
        child: Container(
          height: width * 0.4,
          width: width * 0.4,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 0,
              color: Colors.transparent,
            ),
            boxShadow: containerShadowDecoration,
          ),
          child: Center(
            child: SizedBox(
              width: width * 0.2,
              height: width * 0.2,
              child: const CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(ThemeColours.bgBlueWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
