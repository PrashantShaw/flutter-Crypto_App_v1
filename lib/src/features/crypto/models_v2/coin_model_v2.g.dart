// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinModelV2 _$CoinModelV2FromJson(Map<String, dynamic> json) => CoinModelV2(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      currentPrice: (json['current_price'] as num).toDouble(),
      marketCap: json['market_cap'] as int,
      marketCapRank: json['market_cap_rank'] as int,
      priceChangePercentage24H:
          (json['price_change_percentage_24h'] as num).toDouble(),
      priceChangePercentage24HInCurrency:
          (json['price_change_percentage_24h_in_currency'] as num).toDouble(),
    );

Map<String, dynamic> _$CoinModelV2ToJson(CoinModelV2 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'currentPrice': instance.currentPrice,
      'marketCap': instance.marketCap,
      'marketCapRank': instance.marketCapRank,
      'priceChangePercentage24H': instance.priceChangePercentage24H,
      'priceChangePercentage24HInCurrency':
          instance.priceChangePercentage24HInCurrency,
    };
