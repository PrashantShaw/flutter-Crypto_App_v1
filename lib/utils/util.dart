import 'package:flutter/material.dart';

TextStyle textStyle(
  double fSize,
  Color fColor,
  FontWeight fWeight,
) {
  return TextStyle(
    fontSize: fSize,
    color: fColor,
    fontWeight: fWeight,
  );
}

DateTime dateTimeFormatter(int timestrap) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestrap.toInt());
  return dateTime;
}
