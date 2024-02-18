import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:portfolio/model/chart_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MutualFundScreen extends StatefulWidget {
  const MutualFundScreen({super.key});

  @override
  State<MutualFundScreen> createState() => _MutualFundScreenState();
}

final List<CandleData> _data = [
  CandleData(timestamp: 1, open: 50, close: 120, volume: 50),
  CandleData(timestamp: 2, open: 60, close: 130, volume: 50),
  CandleData(timestamp: 3, open: 70, close: 140, volume: 50),
];



class _MutualFundScreenState extends State<MutualFundScreen> {
  late List<ChartSampleData> chartData;
  List<ChartSampleData> abc = [
    ChartSampleData(
        close: 23.4, high: 27, low: 18, open: 22, time: DateTime(2016, 03, 05)),
    ChartSampleData(
        close: 20.4, high: 25, low: 20, open: 22, time: DateTime(2016, 03, 06)),
    ChartSampleData(
        close: 28.4, high: 30, low: 22, open: 22, time: DateTime(2016, 03, 07)),
    ChartSampleData(
        close: 29.4, high: 20, low: 24, open: 22, time: DateTime(2016, 03, 08)),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: const Text("Wealth Wise"),
      ),
      // SizedBox(
      //   height: 300,
      //   child: WebviewScaffold(
      //     url: 'https://in.tradingview.com/', // Put your URL here
      //     withZoom: true,
      //     withJavascript: true,
      //     hidden: true,
      //     initialChild: Container(
      //       color: Colors.blueAccent,
      //       child: const Center(
      //         child: CircularProgressIndicator(),
      //       ),
      //     ),
      //   ),
      // ),

      // SingleChildScrollView(
      //     scrollDirection: Axis.horizontal,
      //     child: Center(
      //       child: Container(
      //           child: SfCartesianChart(
      //               primaryXAxis: DateTimeAxis(
      //                 majorGridLines: MajorGridLines(color: Colors.grey[800]),
      //               ),
      //               series: <CartesianSeries>[
      //             CandleSeries<ChartSampleData, DateTime>(
      //               dataSource: abc,
      //               xValueMapper: (ChartSampleData data, _) => data.time,
      //               lowValueMapper: (ChartSampleData data, _) => data.low,
      //               highValueMapper: (ChartSampleData data, _) => data.high,
      //               openValueMapper: (ChartSampleData data, _) => data.open,
      //               closeValueMapper: (ChartSampleData data, _) => data.close,
      //               borderWidth: 1,
      //               name: 'Gold',
      //             ),
      //           ])),
      //     ))
    ]);
  }
}

_computeTrendLines() {
  final ma7 = CandleData.computeMA(_data, 7);
  final ma30 = CandleData.computeMA(_data, 30);
  final ma90 = CandleData.computeMA(_data, 90);

  for (int i = 0; i < _data.length; i++) {
    _data[i].trends = [ma7[i], ma30[i], ma90[i]];
  }
}

_removeTrendLines() {
  for (final data in _data) {
    data.trends = [];
  }
}
