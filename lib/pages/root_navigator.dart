import 'package:crypto_app_01/components/root_appbar.dart';
import 'package:crypto_app_01/components/root_drawer.dart';
import 'package:crypto_app_01/pages/coin_market_page.dart';
import 'package:crypto_app_01/pages/home_page.dart';
import 'package:crypto_app_01/pages/portfolio_page.dart';
import 'package:flutter/material.dart';

List pages = [
  {
    'widget': const HomePage(),
    'name': 'Home',
    'icon': const Icon(
      Icons.home_outlined,
      color: Colors.grey,
    ),
    'selectedIcon': const Icon(Icons.home),
  },
  {
    'widget': const CoinMarketPage(),
    'name': 'Market',
    'icon': const Icon(
      Icons.grid_3x3_outlined,
      color: Colors.grey,
    ),
    'selectedIcon': const Icon(Icons.grid_3x3),
  },
  {
    'widget': const PortfolioPage(),
    'name': 'Portfolio',
    'icon': const Icon(
      Icons.pie_chart_outline,
      color: Colors.grey,
    ),
    'selectedIcon': const Icon(Icons.pie_chart),
  },
];

class RootNavigator extends StatefulWidget {
  const RootNavigator({super.key});

  @override
  State<RootNavigator> createState() => _RootNavigatorState();
}

class _RootNavigatorState extends State<RootNavigator> {
  int currentPageIndex = 0;

  List<Widget> getDestinations() {
    List<Widget> destnationList = [];

    for (var i = 0; i < pages.length; i++) {
      final page = pages[i];

      destnationList.add(
        NavigationDestination(
          icon: page['icon'],
          selectedIcon: page['selectedIcon'],
          label: page['name'],
        ),
      );
    }

    return destnationList;
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage = pages[currentPageIndex]['widget'];

    return Scaffold(
      appBar: rootAppBar(context),
      drawer: rootDrawer(context),
      body: currentPage,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (value) => setState(() {
          currentPageIndex = value;
        }),
        backgroundColor: Colors.white,
        elevation: 0,
        indicatorColor: Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.grey.shade300),
        // indicatorShape: ShapeBorder.lerp(a, b, t),
        destinations: getDestinations(),
      ),
    );
  }
}
