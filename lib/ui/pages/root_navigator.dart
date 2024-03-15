import 'package:crypto_app_01/ui/components/root_appbar.dart';
import 'package:crypto_app_01/ui/components/root_drawer.dart';
import 'package:crypto_app_01/ui/pages/coin_market_page.dart';
import 'package:crypto_app_01/ui/pages/home_page.dart';
import 'package:crypto_app_01/ui/pages/portfolio_page.dart';
import 'package:flutter/material.dart';

final List pages = [
  () => const HomePage(),
  () => const CoinMarketPage(),
  () => const PortfolioPage(),
];

class RootNavigator extends StatefulWidget {
  const RootNavigator({super.key});

  @override
  State<RootNavigator> createState() => _RootNavigatorState();
}

class _RootNavigatorState extends State<RootNavigator> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget Function() currentPage = pages[_currentPageIndex];

    return Scaffold(
      appBar: rootAppBar(context),
      drawer: rootDrawer(context),
      body: currentPage(),
      bottomNavigationBar: rootBottomNavBar(context),
    );
  }

  BottomNavigationBar rootBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentPageIndex,
      onTap: (value) => setState(() {
        _currentPageIndex = value;
      }),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_3x3),
          activeIcon: Icon(Icons.grid_3x3_outlined),
          label: "Market",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart_outline),
          activeIcon: Icon(Icons.pie_chart),
          label: "Portfolio",
        ),
      ],
    );
  }
}
