import 'package:crypto_app_01/models/coin_chart_model.dart';
import 'package:http/http.dart' as http;

Future<CoinChartModel> getCoinChartData([String coinName = "bitcoin"]) async {
  final Uri url = Uri.parse(
      'https://api.coingecko.com/api/v3/coins/$coinName/market_chart?vs_currency=usd&days=1');
  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception('Failed to load Market Data!');
  }
  CoinChartModel coinMarketData = coinChartModelFromJson(response.body);
  return coinMarketData;
}
