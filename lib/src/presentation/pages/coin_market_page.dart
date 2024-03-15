import 'package:crypto_app_01/resources/models_v2/coin_model_v2.dart';
import 'package:crypto_app_01/resources/providers/theme_provider.dart';
import 'package:crypto_app_01/src/presentation/components/coin_tile.dart';
import 'package:crypto_app_01/resources/providers/coins_provider.dart';
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
    context.read<Coins>().fetchMarketData();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = context.watch<CAppThemeProvider>().cAppThemeData;
    return Scaffold(
      backgroundColor: appTheme.colorScheme.background,
      body: RefreshIndicator(
        onRefresh: () => context.read<Coins>().fetchMarketData(),
        child: Consumer<Coins>(
          builder: renderCoinMarket,
        ),
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
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
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
