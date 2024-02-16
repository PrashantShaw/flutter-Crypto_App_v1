import 'package:crypto_app_01/apis/get_coin_market.dart';
import 'package:crypto_app_01/models/coin_model.dart';
import 'package:flutter/material.dart';

enum DataState {
  loading,
  loaded,
  error,
}

class Coins extends ChangeNotifier {
  // states
  late List<CoinModel> _coinsList;
  DataState _state = DataState.loading;
  String _error = "";

  // getters
  List<CoinModel> get coinsList => _coinsList;
  DataState get loadingState => _state;
  String get errorMsg => _error;

  // methods
  Future<void> fetchMarketData() async {
    try {
      // set state to 'loading'
      // _state = DataState.loading;
      // notifyListeners();

      // fetch data then set state as 'loaded'
      final data = await getCoinMarket();
      _coinsList = data;
      _state = DataState.loaded;
      notifyListeners();
    }
    // handle error
    catch (e) {
      _state = DataState.error;
      _error = "Error fetching Coins Market data";
      notifyListeners();
    }
  }
}
