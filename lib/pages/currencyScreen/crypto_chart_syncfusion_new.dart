import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CryptoChartSyncfusionNew extends StatefulWidget {
  const CryptoChartSyncfusionNew({Key key}) : super(key: key);

  @override
  _CryptoChartSyncfusionNewState createState() =>
      _CryptoChartSyncfusionNewState();
}

class _CryptoChartSyncfusionNewState extends State<CryptoChartSyncfusionNew> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      legend: Legend(isVisible: false),
      primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          labelPlacement: LabelPlacement.onTicks),
      primaryYAxis: NumericAxis(
        minimum: 30000,
        maximum: 41000,
        axisLine: AxisLine(width: 0),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        labelFormat: '{value}',
        majorTickLines: MajorTickLines(size: 0),
      ),
      series: _getDefaultSplineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of chart series which need to render on the spline chart.
  List<SplineSeries<SalesData, String>> _getDefaultSplineSeries() {
    List<SalesData> chartData = [
      SalesData('9 AM', 36987),
      SalesData('10 AM', 34865),
      SalesData('11 AM', 33258),
      SalesData('12 PM', 35800),
      SalesData('01 PM', 34200),
      SalesData('02 PM', 38421),
      SalesData('03 PM', 36500),
      SalesData('04 PM', 38000),
      SalesData('05 PM', 37684),
      SalesData('06 PM', 39950)
    ];
    return <SplineSeries<SalesData, String>>[
      SplineSeries<SalesData, String>(
        dataSource: chartData,
        name: 'BTC',
        markerSettings: MarkerSettings(isVisible: true),
        xValueMapper: (SalesData sales, _) => '${sales.x}',
        yValueMapper: (SalesData sales, _) => sales.y,
      )
    ];
  }
}

class SalesData {
  SalesData(this.x, this.y);

  final String x;
  final num y;
}
