import 'dart:async';

import 'package:crypto_app_01/pages/coin_market_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timerFunction();
  }

  void timerFunction() {
    Timer(const Duration(seconds: 2), goToHomePage);
  }

  void goToHomePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => CoinMarketPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'lib/assets/images/splash_screen_gif.gif',
          width: 150,
        ),
      ),
    );
  }
}
