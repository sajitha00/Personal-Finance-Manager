import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;
import 'package:cashapp/data/myExpenses.dart';
import "package:flutter/material.dart";

class PieChart extends StatelessWidget {
  const PieChart({
    super.key,
    required List<MyExpenses> chartData,
  }) : _chartData = chartData;

  final List<MyExpenses> _chartData;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      onCreateShader: (ChartShaderDetails chartShaderDetails) {
        return ui.Gradient.radial(
          chartShaderDetails.outerRect.center,
          chartShaderDetails.outerRect.right -
              chartShaderDetails.outerRect.center.dx,
          <Color>[
            Color(0xFFB3A142),
            Color(0xFFA9A647),
            Color(0xFFA4AA4B),
            Color(0xFF9CAE4F),
            Color(0xFF99B861),
            Color(0xFF9BBB67), // blue sky
            Color(0xFFA9C681),
          ],
          <double>[0.2, 0.4, 0.6, 0.8, 10.0, 12.0, 14.0],
        );
      },
      series: <CircularSeries>[
        PieSeries<MyExpenses, String>(
          explode: true,
          radius: "100%",
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          strokeColor: Color(0xFFCCAD5E),
          dataSource: _chartData,
          xValueMapper: (MyExpenses data, _) => data.expenseName,
          yValueMapper: (MyExpenses data, _) => data.expenceValue,
          dataLabelMapper: (MyExpenses data, _) => "${data.expenseName}",
        ),
      ],
    );
  }
}
