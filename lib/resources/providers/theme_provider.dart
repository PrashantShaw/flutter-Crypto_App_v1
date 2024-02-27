import 'package:crypto_app_01/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum ThemeType { dark, light }

class CAppThemeProvider extends ChangeNotifier {
  bool _isDark = ThemeMode.system == ThemeMode.dark;
  ThemeData _cAppThemeData = ThemeMode.system == ThemeMode.dark
      ? CAppTheme.darkTheme()
      : CAppTheme.lightTheme();

  ThemeData get cAppThemeData => _cAppThemeData;
  bool get isDark => _isDark;

  void toggleCAppTheme() {
    _isDark = !_isDark;
    _cAppThemeData = _isDark ? CAppTheme.darkTheme() : CAppTheme.lightTheme();
    notifyListeners();
  }
}
