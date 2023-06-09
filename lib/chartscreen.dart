import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:weekly_expense_calcultor_app/main.dart';

class ChartScreen extends StatelessWidget {
  final charts.Series<Expense, String> chartData;

  ChartScreen(this.chartData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: const Text('Bar Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: charts.BarChart(
          [chartData],
          animate: true,
          barGroupingType: charts.BarGroupingType.grouped,
          behaviors: [
            charts.ChartTitle('Expense',
                behaviorPosition: charts.BehaviorPosition.bottom),
            charts.ChartTitle('Amount',
                behaviorPosition: charts.BehaviorPosition.start),
          ],
          defaultRenderer: charts.BarRendererConfig(
            // Customize the label position and style
            barRendererDecorator: charts.BarLabelDecorator<String>(
              insideLabelStyleSpec: charts.TextStyleSpec(
                fontSize: 12,
                color: charts.ColorUtil.fromDartColor(Colors.white),
              ),
              outsideLabelStyleSpec: charts.TextStyleSpec(
                fontSize: 12,
                color: charts.ColorUtil.fromDartColor(Colors.black),
              ),
              labelPosition: charts.BarLabelPosition.inside,
              labelAnchor: charts.BarLabelAnchor.end,
            ),
          ),
          domainAxis: const charts.OrdinalAxisSpec(
            // Remove the expense name from the x-axis labels
            renderSpec: charts.NoneRenderSpec(),
          ),
        ),
      ),
    );
  }
}
