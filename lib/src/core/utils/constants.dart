import 'package:crypto_app_01/src/presentation/pages/crypto/coin_market_page.dart';
import 'package:crypto_app_01/src/presentation/pages/home_page.dart';
import 'package:crypto_app_01/src/presentation/pages/portfolio_page.dart';

final List pages = [
  () => const HomePage(),
  () => const CoinMarketPage(),
  () => const PortfolioPage(),
];
