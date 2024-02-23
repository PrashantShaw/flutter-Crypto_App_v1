// import 'package:crypto_app_01/pages/coin_market_page.dart';
import 'package:crypto_app_01/pages/splash_screen.dart';
import 'package:crypto_app_01/providers/coinchart_provider.dart';
import 'package:crypto_app_01/providers/coins_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Coins()),
        ChangeNotifierProvider(create: (_) => CoinChart()),
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),
      // home: CoinMarketPage(),
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