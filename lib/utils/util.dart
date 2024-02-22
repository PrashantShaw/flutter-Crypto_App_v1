import 'dart:convert';

import 'package:crypto_app_01/models_v2/coin_model_v2.dart';
import 'package:flutter/material.dart';

TextStyle textStyle(
  double fSize,
  Color fColor,
  FontWeight fWeight,
) {
  return TextStyle(
    fontSize: fSize,
    color: fColor,
    fontWeight: fWeight,
  );
}

DateTime dateTimeFormatter(int timestrap) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestrap.toInt());
  return dateTime;
}

List<CoinModelV2> coinModelFromJsonV2(String str) => List<CoinModelV2>.from(
    json.decode(str).map((x) => CoinModelV2.fromJson(x)));
