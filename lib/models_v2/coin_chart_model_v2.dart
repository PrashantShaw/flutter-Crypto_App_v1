import 'package:json_annotation/json_annotation.dart';

part 'coin_chart_model_v2.g.dart';

@JsonSerializable()
class CoinChartModelV2 {
  List<List<double>> prices;
  List<List<double>> marketCaps;
  List<List<double>> totalVolumes;

  CoinChartModelV2({
    required this.prices,
    required this.marketCaps,
    required this.totalVolumes,
  });

  factory CoinChartModelV2.fromJson(Map<String, dynamic> json) =>
      _$CoinChartModelV2FromJson(json);

  Map<String, dynamic> toJson() => _$CoinChartModelV2ToJson(this);
}
