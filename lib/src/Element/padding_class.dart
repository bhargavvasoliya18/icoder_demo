import 'package:bhargav_practicle/src/Element/responsive_size_values.dart';
import 'package:flutter/material.dart';

///Padding Top
Widget paddingTop(double top) {
  return Padding(
    padding: EdgeInsets.only(top: setSp(top)),
  );
}

///Padding Left
Widget paddingLeft(double left) {
  return Padding(
    padding: EdgeInsets.only(left: setSp(left)),
  );
}

///Padding Right
Widget paddingRight(double right) {
  return Padding(
    padding: EdgeInsets.only(right: setSp(right)),
  );
}

///Padding Bottom
Widget paddingBottom(double bottom) {
  return Padding(
    padding: EdgeInsets.only(bottom: setSp(bottom)),
  );
}