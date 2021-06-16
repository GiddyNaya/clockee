import 'package:clockee/constants/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RoundedButton extends StatelessWidget {
  final Function()? onTap;
  final Color? textColor;
  final Color bgColor;
  final String text;
  final double fontSize;

  const RoundedButton(this.text,
      {Key? key,
      this.textColor,
      this.bgColor = Colors.white,
      this.fontSize = 16,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = fontSize + (fontSize * 1.2);

    return NeumorphicButton(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.flat,
        depth: 4,
        intensity: 0.7,
      ),
      child: Container(
          width: size,
          height: size,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              this.text,
              maxLines: 1,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                  color: textColor ?? CustomColors.sdPrimaryColor),
            ),
          )),
      onPressed: onTap,
    );
  }
}
