import 'package:billpotha/bar%20graph/bar_graph.dart';
import 'package:flutter/material.dart';
import 'package:billpotha/functions/analytics.dart';

class NwsdbAnalytics extends StatefulWidget {
  const NwsdbAnalytics({super.key});

  @override
  State<NwsdbAnalytics> createState() => _NwsdbAnalyticsState();
}

class _NwsdbAnalyticsState extends State<NwsdbAnalytics> {
  final int _averageConsumption = averageConsumption('nwsdbBillsDatabase');
  final String _averageExpenditure =
      averageExpense('nwsdbBillsDatabase').toStringAsFixed(2);
  final int _highestMonthlyConsumption =
      highestConsumption('nwsdbBillsDatabase');
  final String _highestMonthlyConsumptionMonth =
      highestConsumptionMonth('nwsdbBillsDatabase');
  final double _highestMonthlyExpenditure =
      highestExpense('nwsdbBillsDatabase');
  final String _highestMonthlyExpenditureMonth =
      highestExpenseMonth('nwsdbBillsDatabase');
  final double _totalExpenditure = totalExpense('nwsdbBillsDatabase');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
              'assets/images/nwsdb.png',
              height: 80,
              width: 80,
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.deepPurpleAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Average',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Consumption',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Card(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$_averageConsumption',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.deepPurpleAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Average',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Expenditure',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Card(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Rs. $_averageExpenditure',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                      ],
                    ),
                  )),
            ),
          ],
        ),
        const Text('Comsumption Analysis', style: TextStyle(fontSize: 24)),
        const BarGraph(
          billDatabase: 'nwsdbBillsDatabase',
        ),
        Card(
          color: Colors.deepPurpleAccent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('Highest Monthly Comsumption',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                Text(_highestMonthlyConsumptionMonth,
                    style: const TextStyle(
                        fontSize: 24, color: Colors.yellowAccent)),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$_highestMonthlyConsumption',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          color: Colors.deepPurpleAccent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('Highest Monthly Expenditure',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                Text(_highestMonthlyExpenditureMonth,
                    style: const TextStyle(
                        fontSize: 24, color: Colors.yellowAccent)),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Rs. $_highestMonthlyExpenditure',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          color: Colors.deepPurpleAccent,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('Total Expenditure',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                const Text('2023',
                    style: TextStyle(fontSize: 24, color: Colors.yellowAccent)),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Rs. $_totalExpenditure',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.deepPurpleAccent,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Last Month',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Consumption',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Card(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '112',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.deepPurpleAccent,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Decresemnt',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Percentage',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Card(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '4%',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
