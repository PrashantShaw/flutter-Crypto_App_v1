import 'package:flutter/material.dart';

final AppBarTheme appBarThemeLight = const AppBarTheme().copyWith(
  elevation: 0,
  surfaceTintColor: Colors.transparent,
  backgroundColor: Colors.white,
  // iconTheme: const IconThemeData(
  //   color: Colors.black87,
  // ),
);

final AppBarTheme appBarThemeDark = const AppBarTheme().copyWith(
  elevation: 0,
  surfaceTintColor: const Color.fromARGB(255, 20, 20, 20),
  backgroundColor: const Color.fromARGB(255, 20, 20, 20),

  // iconTheme: const IconThemeData(
  //   color: Colors.white70,
  // ),
);
