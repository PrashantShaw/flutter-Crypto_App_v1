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
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.sort)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: Icon(Icons.wallet_travel),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  isScrollControlled: true,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.8),
                  showDragHandle: true,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 8,
                          ),
                          // Icon(
                          //   Icons.maximize_rounded,
                          //   size: 60,
                          //   color: Color(0xFFeaeaea),
                          // ),
                          SizedBox(
                            height: 100,
                          ),
                          const Text('Modal BottomSheet'),
                          ElevatedButton(
                            child: const Text('Close BottomSheet'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
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
