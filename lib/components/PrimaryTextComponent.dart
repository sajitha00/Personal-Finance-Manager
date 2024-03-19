import 'package:flutter/material.dart';

class PrimaryTextComponent extends StatelessWidget {
  late String textStatement = "Hello";
  Color fontColor = Color(0xff000000);
  FontWeight fontWeight = FontWeight.w400;
  double fontSize = 16.0;
  String fontFamily = "Poppins";

  PrimaryTextComponent(
      {required textStatement, fontColor, fontSize, fontWeight, fontFamily}) {
    this.textStatement = textStatement;

    if (fontColor != null) {
      this.fontColor = fontColor;
    }

    if (fontWeight != null) {
      this.fontWeight = fontWeight;
    }

    if (fontSize != null) {
      this.fontSize = fontSize;
    }

    if (fontFamily != null) {
      this.fontFamily = fontFamily;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      textStatement,
      style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight),
    );
  }
}
