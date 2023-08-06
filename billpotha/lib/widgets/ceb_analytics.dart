import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              singleValueCard('Current Balance', 'Rs. -$_currentBalance'),
              const SizedBox(width: 12),
              _buildMetricCard('Last Bill', _lastBill[0].toString(),
                  'Rs. ' + _lastBill[1].toString(), 170, 170),
            ],
          ),
          const SizedBox(height: 16),
          _buildMetricCard(
              'Average Consumption',
              _averageConsumption.toStringAsFixed(2),
              'Rs. ' + _averageExpenditure.toStringAsFixed(2),
              345,
              180),
          const SizedBox(height: 24),
          Text(
            'Consumption Analysis',
            style: GoogleFonts.ubuntu(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: BarGraph(billDatabase: 'cebBillsDatabase'),
            ),
          ),
          const SizedBox(height: 24),
          _buildInfoCard(
              'Highest Consumption',
              _highestMonthlyConsumptionMonth,
              _highestMonthlyConsumption.toString(),
              'Rs. ' + _highestMonthlyExpenditure.toStringAsFixed(2)),
          const SizedBox(height: 16),
          _buildInfoCard(
            'Total Consumption',
            '2023',
            _totalConsumption[1].toString(),
            'Rs. ' + _totalConsumption[0].toStringAsFixed(2),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String firstValue, String secondValue,
      double boxWidth, double boxHeight) {
    return Container(
      height: boxHeight,
      width: boxWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.ubuntu(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  firstValue,
                  style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                secondValue,
                style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
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
    return Container(
      height: 210,
      width: 345,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.ubuntu(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              month,
              style: GoogleFonts.ubuntu(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  firstValue,
                  style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                secondValue,
                style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
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
  return Container(
    height: 170,
    width: 170,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(40),
    ),
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.ubuntu(
              fontSize: 20,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  color: Color.fromARGB(255, 172, 33, 23),
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
