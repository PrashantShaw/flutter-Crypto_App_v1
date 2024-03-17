import 'package:crypto_app_01/src/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = context.watch<CAppThemeProvider>().cAppThemeData;

    return Scaffold(
      backgroundColor: appTheme.colorScheme.background,
      body: const Center(
        child: Text("Portfolio Pgae"),
      ),
    );
  }
}
