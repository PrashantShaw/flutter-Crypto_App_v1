// import 'package:crypto_app_01/models/coin_model.dart';
import 'package:crypto_app_01/resources/models_v2/coin_model_v2.dart';
import 'package:crypto_app_01/utils/helper.dart';
import 'package:http/http.dart' as http;

Future<List<CoinModelV2>> getCoinMarket() async {
  final Uri url = Uri.parse(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=false&price_change_percentage=24h&locale=en');
  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception(
        'Failed to load Market Data! Status COde: ${response.statusCode}');
  }
  List<CoinModelV2> coinMarketData = coinModelFromJsonV2(response.body);

  return coinMarketData;
}
