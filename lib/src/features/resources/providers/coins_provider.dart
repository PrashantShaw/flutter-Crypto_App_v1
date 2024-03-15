import 'dart:async';

import 'package:crypto_app_01/resources/apis/get_coin_market.dart';
import 'package:crypto_app_01/resources/models_v2/coin_model_v2.dart';
import 'package:flutter/material.dart';

enum DataState {
  loading,
  loaded,
  error,
}

class Coins extends ChangeNotifier {
  // states
  late List<CoinModelV2> _coinsList;
  DataState _state = DataState.loading;
  String _error = "";
  bool _isFetchingEnabled = true;

  // getters
  List<CoinModelV2> get coinsList => _coinsList;
  DataState get loadingState => _state;
  String get errorMsg => _error;

  // methods
  Future<void> fetchMarketData() async {
    // ignore: avoid_print
    print('IS FETCHING ENEABLED :: $_isFetchingEnabled');
    try {
      // set state to 'loading'
      // _state = DataState.loading;
      // notifyListeners();

      if (!_isFetchingEnabled) {
        return;
      }

      // fetch data then set state as 'loaded'
      final data = await getCoinMarket();
      _coinsList = data;
      _state = DataState.loaded;
      disableFetching();
      enableFetchingAfterDelay(10);
      notifyListeners();
    }
    // handle error
    catch (e) {
      _state = DataState.error;
      _error = "Error:: $e";
      notifyListeners();
    }
  }

  void disableFetching() {
    _isFetchingEnabled = false;
  }

  void enableFetchingAfterDelay(int secs) {
    Timer(
      Duration(seconds: secs),
      () => _isFetchingEnabled = true,
    );
  }
}
