import 'package:crypto_app_01/components/coin_tile.dart';
import 'package:crypto_app_01/models_v2/coin_model_v2.dart';
import 'package:crypto_app_01/providers/coins_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class CoinMarketPage extends StatefulWidget {
  const CoinMarketPage({super.key});

  @override
  State<CoinMarketPage> createState() => _CoinMarketPageState();
}

class _CoinMarketPageState extends State<CoinMarketPage> {
  @override
  void initState() {
    super.initState();
    // context.read<Coins>().fetchMarketData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<Coins>(
        builder: renderCoinMarket,
      ),
    );
  }

  Widget renderCoinMarket(
    BuildContext context,
    Coins coinsMarketData,
    Widget? child,
  ) {
    Widget toRender = switch (coinsMarketData.loadingState) {
      DataState.loading => spinKitLoader(),
      DataState.loaded => coinTilesWrapper(coinsMarketData.coinsList),
      DataState.error => errorFetchingDataWidget(coinsMarketData.errorMsg),
    };
    return toRender;
  }

  Center spinKitLoader() {
    return const Center(
      child: SpinKitHourGlass(
        color: Colors.amber,
        size: 50.0,
      ),
    );
  }

  Padding coinTilesWrapper(List<CoinModelV2>? marketData) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: ListView.builder(
        itemCount: marketData!.length,
        itemBuilder: (context, index) {
          CoinModelV2 coinData = marketData[index];
          return CoinTile(coinData: coinData);
        },
      ),
    );
    // return CoinTile(coinMarketData.data);
  }

  Center errorFetchingDataWidget(errorMsg) {
    // print("Error::: ${coinMarketData.error}");
    return Center(
        child: Text(
      '$errorMsg',
      style: const TextStyle(fontSize: 32),
      textAlign: TextAlign.center,
    ));
  }
}
