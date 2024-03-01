import 'package:flutter/material.dart';

final BottomNavigationBarThemeData bottomNavbarThemeLight =
    const BottomNavigationBarThemeData().copyWith(
  elevation: 2,
  enableFeedback: true,
  backgroundColor: Colors.white,
  // selected
  selectedItemColor: Colors.black,
  selectedIconTheme: IconThemeData(color: Colors.black87, size: 25),
  selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
  // unselected
  unselectedItemColor: Colors.grey,
  unselectedIconTheme: IconThemeData(color: Colors.grey),
  unselectedLabelStyle: TextStyle(color: Colors.grey),
);

final BottomNavigationBarThemeData bottomNavbarThemeDark =
    const BottomNavigationBarThemeData().copyWith(
  elevation: 3,
  enableFeedback: true,
  backgroundColor: const Color.fromARGB(255, 20, 20, 20),
  // selected
  selectedItemColor: Colors.white,
  selectedIconTheme: IconThemeData(color: Colors.white, size: 25),
  selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
  // unselected
  unselectedItemColor: Colors.grey,
  unselectedIconTheme: IconThemeData(color: Colors.grey),
  unselectedLabelStyle: TextStyle(color: Colors.grey),
);
