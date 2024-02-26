import 'dart:async';
import 'dart:convert';

import 'package:crypto_app_01/models_v2/coin_chart_model_v2.dart';
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

List<CoinModelV2> coinModelFromJsonV2(String jsonStr) {
  List<dynamic> decodedJsonStr = json.decode(jsonStr);
  Iterable<CoinModelV2> ietrableData =
      decodedJsonStr.map((item) => CoinModelV2.fromJson(item));
  List<CoinModelV2> coinModelV2Data = List<CoinModelV2>.from(ietrableData);

  return coinModelV2Data;
}

CoinChartModelV2 coinChartModelFromJsonV2(String jsonStr) {
  Map<String, dynamic> decodedJsonStr = json.decode(jsonStr);
  CoinChartModelV2 coinChartModelV2Data =
      CoinChartModelV2.fromJson(decodedJsonStr);

  return coinChartModelV2Data;
}

void permanentlyNavigateTo(BuildContext context, Widget pageWidget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => pageWidget));
}

void navigateTo(BuildContext context, Widget pageWidget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => pageWidget));
}

void sleepFor(int secconds, void Function() callback) {
  Timer(Duration(seconds: secconds), callback);
}
