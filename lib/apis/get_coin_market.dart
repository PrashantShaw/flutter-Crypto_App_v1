import 'package:crypto_app_01/models/coin_model.dart';
import 'package:http/http.dart' as http;

Future<List<CoinModel>> getCoinMarket() async {
  final Uri url = Uri.parse(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h&locale=en');
  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception('Failed to load Market Data!');
  }
  List<CoinModel> coinMarketData = coinModelFromJson(response.body);
  return coinMarketData;
}
