import 'package:clockee/constants/theme_data.dart';
import 'package:flutter/material.dart';

TextStyle boldTextStyle(
    {int size = 18,
    Color? textColor,
    FontWeight textWeight = FontWeight.bold,
    double? letterSpacing,
    double? wordSpacing}) {
  return TextStyle(
      fontSize: size.toDouble(),
      color: textColor ?? CustomColors.sdTextPrimaryColor,
      fontWeight: textWeight,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing);
}

BoxDecoration boxDecorations(
    {double radius = 8,
    Color color = Colors.transparent,
    Color bgColor = Colors.white,
    bool showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow
          ? [
              BoxShadow(
                  color: CustomColors.sdShadowColor,
                  blurRadius: 10,
                  spreadRadius: 2)
            ]
          : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

Widget text(String? text,
    {double fontSize = 18.0,
    Color? textColor,
    String fontFamily = "Regular",
    bool isCentered = false,
    int maxLine = 1,
    double latterSpacing = 0.5}) {
  if (text == null) text = "";
  return Text(text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: textColor ?? CustomColors.sdTextSecondaryColor,
          height: 1.5,
          letterSpacing: latterSpacing));
}
