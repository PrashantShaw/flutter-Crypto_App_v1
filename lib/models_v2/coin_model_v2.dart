import 'package:json_annotation/json_annotation.dart';

part 'coin_model_v2.g.dart';

@JsonSerializable()
class CoinModelV2 {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  int marketCap;
  int marketCapRank;
  double priceChangePercentage24H;
  double priceChangePercentage24HInCurrency;

  CoinModelV2({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.priceChangePercentage24H,
    required this.priceChangePercentage24HInCurrency,
  });

  factory CoinModelV2.fromJson(Map<String, dynamic> json) =>
      _$CoinModelV2FromJson(json);

  Map<String, dynamic> toJson() => _$CoinModelV2ToJson(this);
}
