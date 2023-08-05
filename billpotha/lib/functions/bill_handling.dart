import 'package:billpotha/functions/analytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/bill.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initializeBillDatabase(String billDatabase) async {
  final billBox = Hive.box(billDatabase);
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  for (var i = 0; i < 12; i++) {
    final bill = Bill(months[i], 0, 0, 0);
    await billBox.add(bill);
  }
}

void addBill(String month, int units, double amount, double payment,
    String billDatabase) async {
  int j = 0;
  final billBox = Hive.box(billDatabase);
  final bill = Bill(month, units, amount, payment);
  for (Bill i in getBills(billDatabase)) {
    if (i.month == month) {
      await billBox.putAt(j, bill);
      return;
    }
    j++;
  }
  String _currentBalance = '';
  void fetchCurrentBalance() async {
      _currentBalance = await currentBalance('electricityBalance');
    }
    fetchCurrentBalance();
    double _newBalance = await double.parse(_currentBalance) - payment;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('electricityBalance', _newBalance.toString());
  await billBox.add(bill);
}

List<Bill> getBills(String billDatabase) {
  final billBox = Hive.box(billDatabase);
  List<Bill> billDetails = [];

  for (var i = 0; i < billBox.length; i++) {
    final bill = billBox.getAt(i) as Bill;
    billDetails.add(bill);
  }

  return billDetails;
}

void clearBills(String billDatabase) async {
  final billBox = Hive.box(billDatabase);
  await billBox.clear();
  initializeBillDatabase(billDatabase);
}
