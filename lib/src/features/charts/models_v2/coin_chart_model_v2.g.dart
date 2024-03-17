// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_chart_model_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinChartModelV2 _$CoinChartModelV2FromJson(Map<String, dynamic> json) =>
    CoinChartModelV2(
      prices: (json['prices'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      marketCaps: (json['market_caps'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      totalVolumes: (json['total_volumes'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$CoinChartModelV2ToJson(CoinChartModelV2 instance) =>
    <String, dynamic>{
      'prices': instance.prices,
      'marketCaps': instance.marketCaps,
      'totalVolumes': instance.totalVolumes,
    };
