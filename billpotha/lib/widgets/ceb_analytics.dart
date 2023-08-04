import 'package:flutter/material.dart';
import '../functions/analytics.dart';
import '../bar graph/bar_graph.dart';

class CebAnalytics extends StatefulWidget {
  const CebAnalytics({super.key});

  @override
  State<CebAnalytics> createState() => _CebAnalyticsState();
}

class _CebAnalyticsState extends State<CebAnalytics> {
  final int _averageConsumption = averageConsumption('cebBillsDatabase');
  final double _averageExpenditure = averageExpense('cebBillsDatabase');
  final String _averageExpense =
      averageExpense('cebBillsDatabase').toStringAsFixed(2);
  final int _highestMonthlyConsumption = highestConsumption('cebBillsDatabase');
  final String _highestMonthlyConsumptionMonth =
      highestConsumptionMonth('cebBillsDatabase');
  final double _highestMonthlyExpenditure = highestExpense('cebBillsDatabase');
  final String _highestMonthlyExpenditureMonth =
      highestExpenseMonth('cebBillsDatabase');
  final double _totalExpenditure = totalExpense('cebBillsDatabase');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/ceb.png',
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
                            _averageConsumption.toStringAsFixed(2),
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
         const BarGraph(billDatabase: 'cebBillsDatabase',),
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
                    child: Text(_highestMonthlyConsumption.toString(),
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
                    child: Text('Rs. $_averageExpense',
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
