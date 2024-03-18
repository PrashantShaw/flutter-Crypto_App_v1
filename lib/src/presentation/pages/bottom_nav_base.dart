import 'package:crypto_app_01/src/core/router/bottom_nav_provider.dart';
import 'package:crypto_app_01/src/presentation/components/common/root_appbar.dart';
import 'package:crypto_app_01/src/presentation/components/common/root_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BottomNavBase extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavBase({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rootAppBar(context),
      drawer: rootDrawer(context),
      body: navigationShell,
      bottomNavigationBar: rootBottomNavBar(context),
    );
  }

  BottomNavigationBar rootBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.watch<BottomNavProvider>().currentIndex,
      onTap: (value) {
        context.read<BottomNavProvider>().setCurrentIndex(value);
        navigationShell.goBranch(value);
      },
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
