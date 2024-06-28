import 'package:flutter/material.dart';

class TextStyleTheme {
  static TextStyle customTextStyle(
      Color color, double size, FontWeight fontWeight,
      {TextDecoration? decoration,String? fontFamily,bool useResponsive = false,bool useScaler = true, double? spacing,}) {
    return TextStyle(
        fontFamily: fontFamily??"Avenir",
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration ?? TextDecoration.none,
        letterSpacing: spacing);
  }
}