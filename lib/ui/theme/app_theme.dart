import 'package:flutter/material.dart';

class CAppTheme {
  // light theme -
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.amber,
    );
  }

  // dark theme -
  static ThemeData darkTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.purple,
    );
  }
}
