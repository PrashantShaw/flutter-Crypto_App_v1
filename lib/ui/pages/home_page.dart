import 'package:crypto_app_01/resources/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = context.watch<CAppThemeProvider>().cAppThemeData;
    // var x = appTheme.appBarTheme;
    // print('############ ${x.surfaceTintColor} ${x.backgroundColor}');
    return Scaffold(
      backgroundColor: appTheme.colorScheme.background,
      body: const Center(
        child: Text("Home Pgae"),
      ),
    );
  }
}
