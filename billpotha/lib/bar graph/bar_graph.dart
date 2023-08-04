import 'package:billpotha/bar%20graph/bar_data.dart';
import 'package:billpotha/functions/bill_handling.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../models/bill.dart';

class BarGraph extends StatelessWidget {
  final String billDatabase;
  const BarGraph({super.key, required this.billDatabase});

  @override
  Widget build(BuildContext context) {
    List<double> graphData = [];
    List<Bill> bills = getBills(billDatabase);
    for (int i = 0; i < bills.length; i++) {
      graphData.add(bills[i].units.toDouble());
    }

    BarData myBarData = BarData(
      graphData[0],
      graphData[1],
      graphData[2],
      graphData[3],
      graphData[4],
      graphData[5],
      graphData[6],
      graphData[7],
      graphData[8],
      graphData[9],
      graphData[10],
      graphData[11],
    );
    myBarData.initialiseBarData();

    return SizedBox(
      height: 400,
      child: BarChart(
        BarChartData(
          minY: 0,
          maxY: 400,
          gridData: const FlGridData(show: false),
          barGroups: myBarData.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      color: Colors.deepPurpleAccent,
                      width: 20,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
