// import 'package:crypto_app_01/pages/coin_market_page.dart';
import 'package:crypto_app_01/src/core/router/app_router.dart';
import 'package:crypto_app_01/src/core/router/bottom_nav_provider.dart';
import 'package:crypto_app_01/src/features/charts/providers/coinchart_provider.dart';
import 'package:crypto_app_01/src/features/crypto/providers/coins_provider.dart';
import 'package:crypto_app_01/src/core/theme/theme_provider.dart';
import 'package:crypto_app_01/src/core/theme/app_theme.dart';
import 'package:crypto_app_01/src/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => Coins()),
        ChangeNotifierProvider(create: (_) => CoinChart()),
        ChangeNotifierProvider(create: (_) => CAppThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = context.watch<CAppThemeProvider>().cAppThemeData;
    // SystemUiOverlayStyle cSystemUiOverlayStyle =
    //     context.watch<CAppThemeProvider>().cSystemUiOverlayStyle;
    final SystemUiOverlayStyle cSystemUiOverlayStyleLight =
        getSystemUiOverlayLight();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(cSystemUiOverlayStyleLight);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: themeData,
      darkTheme: CAppTheme.darkTheme(),
    );
  }
}

/**
 * https://www.coingecko.com/api/documentation
 * 
 * https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=true&price_change_percentage=24h&locale=en
 * https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=1
 * 
 */