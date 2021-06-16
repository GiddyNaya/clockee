import 'package:clockee/constants/theme_data.dart';
import 'package:clockee/utils/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SimpleButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;
  var height = 40.0;

  SimpleButton(this.textContent,
      {required this.onPressed, this.isStroked = false, this.height = 45.0});

  @override
  SimpleButtonState createState() => SimpleButtonState();
}

class SimpleButtonState extends State<SimpleButton> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: EdgeInsets.all(18),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        depth: 2,
        intensity: 0.7,
      ),
      child: Text(
        widget.textContent,
        style: boldTextStyle(
            size: 16, textColor: CustomColors.sdPrimaryColor, letterSpacing: 2),
      ),
      onPressed: widget.onPressed,
    );
  }
}
