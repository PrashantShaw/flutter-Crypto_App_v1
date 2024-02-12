import 'package:crypto_app_01/apis/get_coin_market.dart';
import 'package:crypto_app_01/components/coin_tile.dart';
import 'package:crypto_app_01/models/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CoinMarketPage extends StatefulWidget {
  const CoinMarketPage({super.key});

  @override
  State<CoinMarketPage> createState() => _CoinMarketPageState();
}

class _CoinMarketPageState extends State<CoinMarketPage> {
  late Future<List<CoinModel>> coinMarketData;

  @override
  void initState() {
    super.initState();
    coinMarketData = getCoinMarket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: coinMarketData,
        builder: renderCoinMarket,
      ),
    );
  }

  Widget renderCoinMarket(
      context, AsyncSnapshot<List<CoinModel>> coinMarketData) {
    if (coinMarketData.hasData) {
      return coinTilesWrapper(coinMarketData.data);
    } else if (coinMarketData.hasError) {
      return errorFetchingDataWidget(coinMarketData);
    }

    return const Center(
      child: SpinKitHourGlass(
        color: Colors.amber,
        size: 50.0,
      ),
    );
  }

  Padding coinTilesWrapper(List<CoinModel>? marketData) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView.builder(
        itemCount: marketData!.length,
        itemBuilder: (context, index) {
          CoinModel coinData = marketData[index];
          return CoinTile(coinData: coinData);
        },
      ),
    );
    // return CoinTile(coinMarketData.data);
  }

  Center errorFetchingDataWidget(coinMarketData) {
    // print("Error::: ${coinMarketData.error}");
    return const Center(
        child: Text(
      'Some Error Occured, please try again!',
      style: TextStyle(fontSize: 32),
      textAlign: TextAlign.center,
    ));
  }
}
