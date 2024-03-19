import 'package:flutter/material.dart';
import 'package:cashapp/data/expencesvsincome.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatelessWidget {
  const BarChart({
    super.key,
    required List<ExpensesVsIncome>? chartData,
  }) : _chartData = chartData;

  final List<ExpensesVsIncome>? _chartData;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(
        isVisible: true,
      ),
      primaryXAxis: CategoryAxis(
        isVisible: true,
      ),
      series: <CartesianSeries>[
        StackedColumnSeries<ExpensesVsIncome, String>(
          dataSource: _chartData,
          xValueMapper: (ExpensesVsIncome ch, _) => ch.day,
          yValueMapper: (ExpensesVsIncome ch, _) => ch.incomeValue,
          color: Color(0xFF007D0D),
          legendItemText: "Income",
        ),
        StackedColumnSeries<ExpensesVsIncome, String>(
          dataSource: _chartData,
          xValueMapper: (ExpensesVsIncome ch, _) => ch.day,
          yValueMapper: (ExpensesVsIncome ch, _) => ch.expenseValue,
          color: Color(0xFFAA7A00),
          legendItemText: "Expenses",
        ),
      ],
    );
  }
}
