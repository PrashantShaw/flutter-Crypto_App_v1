import 'package:crypto_app_01/ui/theme/custom_theme/app_bar_theme.dart';
import 'package:crypto_app_01/ui/theme/custom_theme/app_color_scheme.dart';
import 'package:crypto_app_01/ui/theme/custom_theme/app_drawer_theme.dart';
import 'package:crypto_app_01/ui/theme/custom_theme/bottom_navbar_theme.dart';
import 'package:flutter/material.dart';

class CAppTheme {
  // light theme -
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      colorScheme: colorSchemeLight,
      appBarTheme: appBarThemeLight,
      bottomNavigationBarTheme: bottomNavbarThemeLight,
      drawerTheme: drawerThemeLight,
    );
  }

  // dark theme -
  static ThemeData darkTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      colorScheme: colorSchemeDark,
      appBarTheme: appBarThemeDark,
      bottomNavigationBarTheme: bottomNavbarThemeDark,
      drawerTheme: drawerThemeDark,
    );
  }
}
