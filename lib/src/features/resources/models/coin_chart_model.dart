// To parse this JSON data, do
//
//     final coinChartModel = coinChartModelFromJson(jsonString);

import 'dart:convert';

CoinChartModel coinChartModelFromJson(String str) =>
    CoinChartModel.fromJson(json.decode(str));

String coinChartModelToJson(CoinChartModel data) => json.encode(data.toJson());

class CoinChartModel {
  List<List<double>> prices;
  List<List<double>> marketCaps;
  List<List<double>> totalVolumes;

  CoinChartModel({
    required this.prices,
    required this.marketCaps,
    required this.totalVolumes,
  });

  factory CoinChartModel.fromJson(Map<String, dynamic> json) => CoinChartModel(
        prices: List<List<double>>.from(json["prices"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        marketCaps: List<List<double>>.from(json["market_caps"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        totalVolumes: List<List<double>>.from(json["total_volumes"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
      );

  Map<String, dynamic> toJson() => {
        "prices": List<dynamic>.from(
            prices.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "market_caps": List<dynamic>.from(
            marketCaps.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "total_volumes": List<dynamic>.from(
            totalVolumes.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
