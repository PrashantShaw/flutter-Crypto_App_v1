import 'package:crypto_app_01/utils/helper.dart';
import 'package:flutter/material.dart';

final TextTheme textThemeLight = const TextTheme().copyWith(
  bodyLarge: textStyle(16, Colors.black, FontWeight.bold),
  bodyMedium: textStyle(14, Colors.black87, FontWeight.w500),
  bodySmall: textStyle(12, Colors.black45, FontWeight.w400),
);

final TextTheme textThemeDark = const TextTheme().copyWith(
  bodyLarge: textStyle(16, Colors.white70, FontWeight.bold),
  bodyMedium: textStyle(14, Colors.white, FontWeight.w500),
  bodySmall: textStyle(12, Colors.white30, FontWeight.w400),
);
