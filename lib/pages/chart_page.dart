import 'package:crypto_app_01/components/chart_filter_button.dart';
import 'package:crypto_app_01/providers/coinchart_provider.dart';
import 'package:crypto_app_01/utils/util.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

final Map<String, int> filterSpanDataPoints = {
  '1H':
      12, // data points are of 5mins of interval, so 60/5=12 data points in 1H
  '6H': 12 * 6,
  '12H': 12 * 12,
  '24H': 12 * 24,
};

class CoinChartPage extends StatefulWidget {
  final String coinId;
  final String coinName;
  final String coinImage;

  const CoinChartPage({
    super.key,
    required this.coinId,
    required this.coinName,
    required this.coinImage,
  });

  @override
  State<CoinChartPage> createState() => _CoinChartPageState();
}

class _CoinChartPageState extends State<CoinChartPage> {
  late double touchedData;
  late DateTime touchedDateTime;
  String activeChartSpan = '12H';
  bool isInitDataSet = false;

  @override
  void initState() {
    super.initState();
  }

  List<FlSpot> getFlSpotList(span) {
    List<List<double>> chartData = context.read<CoinChart>().coinChartData;
    List<FlSpot> spots = [];
    int len = chartData.length;
    int startIdx = len - filterSpanDataPoints[span]!;

    for (var i = startIdx; i < len; i++) {
      if (i < 0) continue; // if -ve index arises

      List<double> point = chartData[i];
      double x = point[0].toDouble();
      double y = point[1].toDouble();
      FlSpot spot = FlSpot(x, y);
      spots.add(spot);
    }
    return spots;
  }

  List<FlSpot> getChartFlSpots() {
    List<FlSpot> spotsList;

    spotsList = switch (activeChartSpan) {
      '1H' => getFlSpotList('1H'),
      '6H' => getFlSpotList('6H'),
      '12H' => getFlSpotList('12H'),
      '24H' => getFlSpotList('24H'),
      _ => throw const FormatException('Invalid')
    };
    return spotsList;
  }

  void changeChartSpan(String span) {
    setState(() {
      activeChartSpan = span;
    });
  }

  void goToPrevPage() {
    // navigateTo(context, const CoinMarketPage());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        leading: IconButton(
          onPressed: goToPrevPage,
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: showWidget(),
    );
  }

  Widget showWidget() {
    Widget toRender = switch (context.watch<CoinChart>().loadingState) {
      DataState.loading => renderLoading(),
      DataState.loaded => renderCoinChartPage(),
      DataState.error => renderErrorText()
    };
    return toRender;
  }

  Widget renderLoading() {
    return const Center(
      // child: CircularProgressIndicator(),
      child: SpinKitHourGlass(
        color: Colors.amber,
        size: 50.0,
      ),
    );
  }

  Widget renderErrorText() {
    return Center(
      child: Text(
        "Some Error Occured while fetching!",
        style: textStyle(20, Colors.black, FontWeight.bold),
      ),
    );
  }

  void setInitData() {
    final data = context.read<CoinChart>().coinChartData;
    List<double> lastDataPoint = data[data.length - 1];
    setState(() {
      touchedData = lastDataPoint[1];
      touchedDateTime = dateTimeFormatter(lastDataPoint[0].toInt());
      isInitDataSet = true;
    });
  }

  Widget renderCoinChartPage() {
    isInitDataSet ? null : setInitData();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Image.network(
          widget.coinImage,
          width: 60,
        ),
        const SizedBox(height: 10),
        Text(
          widget.coinName,
          style: textStyle(20, Colors.black38, FontWeight.w600),
        ),
        const SizedBox(height: 30),
        Text(
          '\$ $touchedData',
          style: textStyle(24, Colors.black87, FontWeight.w600),
        ),
        Text(
          '$touchedDateTime',
          style: textStyle(16, Colors.grey, FontWeight.w400),
        ),
        // chart
        AspectRatio(
          aspectRatio: 1.25,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: LineChart(createLineChart())),
          ),
        ),
        // chart filter buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChartFilterButton(
              name: "1H",
              isActive: activeChartSpan == '1H',
              onPressed: () => changeChartSpan('1H'),
            ),
            ChartFilterButton(
              name: "6H",
              isActive: activeChartSpan == '6H',
              onPressed: () => changeChartSpan('6H'),
            ),
            ChartFilterButton(
              name: "12H",
              isActive: activeChartSpan == '12H',
              onPressed: () => changeChartSpan('12H'),
            ),
            ChartFilterButton(
              name: "24H",
              isActive: activeChartSpan == '24H',
              onPressed: () => changeChartSpan('24H'),
            ),
          ],
        ),
      ],
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
          touchCallback:
              (FlTouchEvent event, LineTouchResponse? touchResponse) {
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
        titlesData: const FlTitlesData(show: false),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false)
        // borderData: FlBorderData(show: false),
        );
  }
}
