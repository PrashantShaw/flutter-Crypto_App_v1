import 'package:crypto_app_01/resources/models_v2/coin_model_v2.dart';
import 'package:crypto_app_01/resources/providers/theme_provider.dart';
import 'package:crypto_app_01/src/presentation/pages/chart_page.dart';
import 'package:crypto_app_01/resources/providers/coinchart_provider.dart';
import 'package:crypto_app_01/src/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinTile extends StatelessWidget {
  final CoinModelV2 coinData;
  const CoinTile({super.key, required this.coinData});

  void onCoinTileTap(context) {
    // fetch coin chart data
    Provider.of<CoinChart>(context, listen: false)
        .fetchCoinChartData(coinData.id);
    // navigate to coin chart page
    navigateTo(
      context,
      CoinChartPage(
        coinId: coinData.id,
        coinName: coinData.name,
        coinImage: coinData.image,
      ),
    );
  }

  String formatNumber(num num) {
    String value = num.toString();

    if (num < 1000.0) return value;

    value = value.replaceAll(RegExp(r'\D'), '');
    value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = context.watch<CAppThemeProvider>().cAppThemeData;
    return GestureDetector(
      onTap: () => onCoinTileTap(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.network(
                    coinData.image,
                    width: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coinData.name,
                          style: appTheme.textTheme.bodyMedium,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 6),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  coinData.marketCapRank.toString(),
                                  style: textStyle(
                                      12, Colors.white, FontWeight.w500),
                                ),
                              ),
                            ),
                            Text(
                              '${coinData.priceChangePercentage24H.toString()}%',
                              style: TextStyle(
                                color: coinData.priceChangePercentage24H > 0
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$ ${formatNumber(coinData.currentPrice)}",
                    style: appTheme.textTheme.bodyLarge,
                  ),
                  Text(
                    "MCap: \$ ${formatNumber(((coinData.marketCap) / 1000000).round())}M",
                    style: appTheme.textTheme.bodySmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
