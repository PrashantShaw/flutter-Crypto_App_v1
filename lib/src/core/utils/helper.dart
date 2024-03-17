import 'dart:async';
import 'dart:convert';

import 'package:crypto_app_01/src/features/charts/models_v2/coin_chart_model_v2.dart';
import 'package:crypto_app_01/src/features/crypto/models_v2/coin_model_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

SystemUiOverlayStyle getSystemUiOverlayLight() {
  return const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}

SystemUiOverlayStyle getSystemUiOverlayDark() {
  return const SystemUiOverlayStyle(
    systemNavigationBarColor: Color.fromARGB(255, 20, 20, 20),
    systemNavigationBarIconBrightness: Brightness.light,
  );
}
