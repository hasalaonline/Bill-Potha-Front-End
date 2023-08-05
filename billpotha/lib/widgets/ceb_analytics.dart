import 'package:flutter/material.dart';
import '../functions/analytics.dart';
import '../bar graph/bar_graph.dart';

class CebAnalytics extends StatefulWidget {
  const CebAnalytics({Key? key}) : super(key: key);

  @override
  State<CebAnalytics> createState() => _CebAnalyticsState();
}

class _CebAnalyticsState extends State<CebAnalytics> {
  int _averageConsumption = 0;
  double _averageExpenditure = 0.0;
  List _totalConsumption = [];
  int _highestMonthlyConsumption = 0;
  String _highestMonthlyConsumptionMonth = '';
  double _highestMonthlyExpenditure = 0.0;
  List _lastBill = [];
  String _currentBalance = '0.0';

  @override
  void initState() {
    super.initState();
    _averageConsumption = averageConsumption('cebBillsDatabase');
    _averageExpenditure = averageExpense('cebBillsDatabase');
    _totalConsumption = totalConsumption('cebBillsDatabase');
    _highestMonthlyConsumption = highestConsumption('cebBillsDatabase');
    _highestMonthlyConsumptionMonth =
        highestConsumptionMonth('cebBillsDatabase');
    _highestMonthlyExpenditure = highestExpense('cebBillsDatabase');
    _lastBill = lastBill('cebBillsDatabase');
    // _currentBalance = currentBalance('electricityBalance');
    void fetchCurrentBalance() async {
      _currentBalance = await currentBalance('electricityBalance');
      setState(() {});
    }

    fetchCurrentBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ceb.png',
            height: 80,
            width: 80,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              singleValueCard('Current Balance', 'Rs. -$_currentBalance'),
              const SizedBox(width: 12),
              _buildMetricCard('Last Bill', 20, _lastBill[0].toString(), 20,
                  'Rs. ' + _lastBill[1].toString(), 16),
            ],
          ),
          const SizedBox(height: 16),
          _buildMetricCard(
            'Average Consumption',
            22,
            _averageConsumption.toStringAsFixed(2),
            22,
            'Rs. $_averageExpenditure',
            22,
          ),
          const SizedBox(height: 24),
          const Text('Consumption Analysis',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const BarGraph(billDatabase: 'cebBillsDatabase'),
          _buildInfoCard(
              'Highest Consumption',
              _highestMonthlyConsumptionMonth,
              _highestMonthlyConsumption.toString(),
              'Rs. $_highestMonthlyExpenditure'),
          const SizedBox(height: 16),
          _buildInfoCard(
            'Total Consumption',
            '2023',
            _totalConsumption[1].toString(),
            'Rs. ' + _totalConsumption[0].toString(),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, double titleSize, String firstValue,
      double firstValueSize, String secondValue, double secondValueSize) {
    return Card(
      color: Colors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: titleSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  firstValue,
                  style: TextStyle(
                    fontSize: firstValueSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  secondValue,
                  style: TextStyle(
                    fontSize: secondValueSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      String title, String month, String firstValue, String secondValue) {
    return Card(
      color: Colors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              month,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  firstValue,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  secondValue,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget singleValueCard(String title, String value) {
  return Card(
    color: Colors.deepPurple,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
