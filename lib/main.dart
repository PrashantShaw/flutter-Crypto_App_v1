// import 'package:crypto_app_01/pages/coin_market_page.dart';
import 'package:crypto_app_01/resources/providers/theme_provider.dart';
import 'package:crypto_app_01/ui/pages/splash_screen.dart';
import 'package:crypto_app_01/resources/providers/coinchart_provider.dart';
import 'package:crypto_app_01/resources/providers/coins_provider.dart';
import 'package:crypto_app_01/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    ThemeData themeData = context.watch<CAppThemeProvider>().cAppThemeData;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: themeData,
      darkTheme: CAppTheme.darkTheme(),
      home: const SplashScreen(),
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