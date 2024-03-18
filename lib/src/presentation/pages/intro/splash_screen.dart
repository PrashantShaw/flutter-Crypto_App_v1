import 'dart:async';

import 'package:crypto_app_01/src/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    context.go(RoutPath.home.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/splash_screen_gif.gif',
          width: 150,
        ),
      ),
    );
  }
}
