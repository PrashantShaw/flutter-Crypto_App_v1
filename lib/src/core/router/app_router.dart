import 'package:crypto_app_01/src/presentation/pages/bottom_nav_base.dart';
import 'package:crypto_app_01/src/presentation/pages/charts/chart_page.dart';
import 'package:crypto_app_01/src/presentation/pages/crypto/coin_market_page.dart';
import 'package:crypto_app_01/src/presentation/pages/home_page.dart';
import 'package:crypto_app_01/src/presentation/pages/intro/splash_screen.dart';
import 'package:crypto_app_01/src/presentation/pages/portfolio_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

enum RoutPath {
  launch(path: '/'),
  home(path: '/home'),
  market(path: '/market'),
  portfolio(path: '/portfolio'),
  chart(path: '/chart');

  final String path;
  const RoutPath({required this.path});
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RoutPath.launch.path,
  routes: [
    GoRoute(
      path: RoutPath.launch.path,
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          BottomNavBase(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutPath.home.path,
              pageBuilder: (context, state) => const CupertinoPage(
                child: HomePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutPath.market.path,
              pageBuilder: (context, state) => const CupertinoPage(
                child: CoinMarketPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutPath.portfolio.path,
              pageBuilder: (context, state) => const CupertinoPage(
                child: PortfolioPage(),
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: RoutPath.chart.path,
      name: RoutPath.chart.name,
      builder: (context, state) {
        final qParams = state.uri.queryParameters;
        return CoinChartPage(
          coinId: qParams['coinId'] as String,
          coinName: qParams['coinName'] as String,
          coinImage: qParams['coinImage'] as String,
        );
      },
    ),
  ],
);
