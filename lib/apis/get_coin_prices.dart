import 'package:crypto_app_01/models_v2/coin_chart_model_v2.dart';
import 'package:crypto_app_01/utils/util.dart';
import 'package:http/http.dart' as http;

Future<CoinChartModelV2> getCoinChartData([String coinName = "bitcoin"]) async {
  final Uri url = Uri.parse(
      'https://api.coingecko.com/api/v3/coins/$coinName/market_chart?vs_currency=usd&days=1');
  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception('Failed to load Market Data!');
  }
  CoinChartModelV2 coinMarketData = coinChartModelFromJsonV2(response.body);
  return coinMarketData;
}
