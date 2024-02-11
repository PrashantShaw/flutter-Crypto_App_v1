// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
import 'package:crypto_app_01/apis/get_coin_prices.dart';
import 'package:crypto_app_01/models/coin_chart_model.dart';
import 'package:crypto_app_01/utils/util.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class CoinChartPage extends StatefulWidget {
  final String coinId;
  const CoinChartPage({super.key, required this.coinId});

  @override
  State<CoinChartPage> createState() => _CoinChartPageState();
}

class _CoinChartPageState extends State<CoinChartPage> {
  late List<List<double>> chartData;
  late double touchedData;
  late DateTime touchedDateTime;
  bool isFetching = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    fetchCoinChartData();
  }

  void fetchCoinChartData() async {
    try {
      // print("Passed coinname :::::::: ${widget.coinId}");
      setState(() {
        isFetching = true;
      });
      CoinChartModel data = await getCoinChartData(widget.coinId);
      chartData = data.prices;
      List<double> lastDataPoint = chartData[chartData.length - 1];
      touchedData = lastDataPoint[1];
      touchedDateTime = dateTimeFormatter(lastDataPoint[0].toInt());
      // print("chartData :: $chartData");
    } catch (e) {
      // print("errrrrrrrrrrrrror::: $e");
      setState(() {
        isError = true;
      });
    } finally {
      setState(() {
        isFetching = false;
      });
    }
  }

  List<FlSpot> getChartFlSpots() {
    List<FlSpot> chartSpots = chartData.map((point) {
      double x = point[0].toDouble();
      double y = point[1].toDouble();
      return FlSpot(x, y);
    }).toList();
    return chartSpots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f0f0f),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: showWidget(),
    );
  }

  Widget showWidget() {
    Widget toShow = isFetching
        ? renderLoading()
        : isError
            ? renderErrorText()
            : renderCoinChartPage();

    return toShow;
  }

  Widget renderLoading() {
    return const Center(
      // child: CircularProgressIndicator(),
      child: SpinKitHourGlass(
        color: Colors.white70,
        size: 50.0,
      ),
    );
  }

  Widget renderErrorText() {
    return Center(
      child: Text(
        "Some Error Occured while fetching!",
        style: textStyle(20, Colors.white, FontWeight.bold),
      ),
    );
  }

  Widget renderCoinChartPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$ $touchedData',
            style: textStyle(24, Colors.white, FontWeight.w600),
          ),
          Text(
            '$touchedDateTime',
            style: textStyle(16, Colors.grey, FontWeight.w400),
          ),
          AspectRatio(
            aspectRatio: 1.25,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade900),
                  child: LineChart(createLineChart())),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData createLineChart() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          maxContentWidth: 0,
          tooltipBgColor: Colors.transparent,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              const textStyle = TextStyle();
              // DateTime dateTime =
              //     DateTime.fromMillisecondsSinceEpoch(touchedSpot.x.toInt());
              return const LineTooltipItem(
                '',
                textStyle,
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
        getTouchLineStart: (data, index) => touchedData,
        touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
          var yVal = touchResponse?.lineBarSpots?[0].y;
          var xVal = touchResponse?.lineBarSpots?[0].x;
          if (xVal != null && yVal != null) {
            // print("TOuchedTouches $xVal, $yVal");
            setState(() {
              touchedDateTime = dateTimeFormatter(xVal.toInt());
              touchedData = yVal;
            });
          }
        },
      ),
      lineBarsData: [
        LineChartBarData(
          color: Colors.amber,
          spots: getChartFlSpots(),
          isCurved: true,
          isStrokeCapRound: true,
          barWidth: 2,
          belowBarData: BarAreaData(
            show: false,
          ),
          dotData: const FlDotData(show: false),
        ),
      ],
      titlesData: const FlTitlesData(
        show: false,
      ),
      gridData: const FlGridData(
        show: false,
      ),
      // borderData: FlBorderData(show: false),
    );
  }
}
