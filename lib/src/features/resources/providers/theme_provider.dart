import 'package:crypto_app_01/src/core/theme/app_theme.dart';
import 'package:crypto_app_01/src/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ThemeType { dark, light }

class CAppThemeProvider extends ChangeNotifier {
  // states
  bool _isDark = false;
  ThemeData _cAppThemeData = CAppTheme.lightTheme();
  // SystemUiOverlayStyle _cSystemUiOverlayStyle = getSystemUiOverlayDark();

  // getters
  bool get isDark => _isDark;
  ThemeData get cAppThemeData => _cAppThemeData;
  // SystemUiOverlayStyle get cSystemUiOverlayStyle => _cSystemUiOverlayStyle;

  // methods
  void toggleCAppTheme() {
    _isDark = !_isDark;
    _cAppThemeData = _isDark ? CAppTheme.darkTheme() : CAppTheme.lightTheme();
    SystemUiOverlayStyle cSystemUiOverlayStyle =
        _isDark ? getSystemUiOverlayDark() : getSystemUiOverlayLight();
    SystemChrome.setSystemUIOverlayStyle(cSystemUiOverlayStyle);
    notifyListeners();
  }
}
