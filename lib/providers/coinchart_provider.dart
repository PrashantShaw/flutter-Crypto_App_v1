import 'package:crypto_app_01/apis/get_coin_prices.dart';
import 'package:flutter/material.dart';

enum DataState {
  loading,
  loaded,
  error,
}

class CoinChart extends ChangeNotifier {
  // states
  late List<List<double>> _coinChartData;
  DataState _state = DataState.loading;
  String _error = "";

  // getters
  List<List<double>> get coinChartData => _coinChartData;
  DataState get loadingState => _state;
  String get errorMsg => _error;

  // methods
  Future<void> fetchCoinChartData(String coinName) async {
    try {
      _state = DataState.loading;
      // fetch data
      final data = await getCoinChartData(coinName);
      _coinChartData = data.prices;
      _state = DataState.loaded;
      notifyListeners();
    }
    // handle error
    catch (e) {
      _state = DataState.error;
      _error = "Error fetching coin chart data!";
      notifyListeners();
    }
  }
}
