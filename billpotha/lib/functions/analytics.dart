import 'package:shared_preferences/shared_preferences.dart';

import 'bill_handling.dart';
import '../models/bill.dart';

int averageConsumption(String billDatabase) {
  int totalUnits = 0;
  int totalMonths = 0;
  for (Bill i in getBills(billDatabase)) {
    if (i.units != 0) {
      totalUnits += i.units;
      totalMonths++;
    }
  }
  if (totalMonths == 0) {
    return 0;
  }
  return totalUnits ~/ totalMonths;
}

double averageExpense(String billDatabase) {
  double totalAmount = 0;
  int totalMonths = 0;
  for (Bill i in getBills(billDatabase)) {
    if (i.amount != 0) {
      totalAmount += i.amount;
      totalMonths++;
    }
  }
  if (totalMonths == 0) {
    return 0;
  }
  return totalAmount / totalMonths;
}

int highestConsumption(String billDatabase) {
  int highestUnits = 0;
  for (Bill i in getBills(billDatabase)) {
    if (i.units > highestUnits) {
      highestUnits = i.units;
    }
  }
  return highestUnits;
}

String highestConsumptionMonth(String billDatabase) {
  int highestUnits = 0;
  String highestMonth = '';
  for (Bill i in getBills(billDatabase)) {
    if (i.units > highestUnits) {
      highestUnits = i.units;
      highestMonth = i.month;
    }
  }
  return highestMonth;
}

double highestExpense(String billDatabase) {
  double highestAmount = 0;
  for (Bill i in getBills(billDatabase)) {
    if (i.amount > highestAmount) {
      highestAmount = i.amount;
    }
  }
  return highestAmount;
}

String highestExpenseMonth(String billDatabase) {
  int highestAmount = 0;
  String highestMonth = '';
  for (Bill i in getBills(billDatabase)) {
    if (i.amount > highestAmount) {
      highestAmount = i.amount.toInt();
      highestMonth = i.month;
    }
  }
  return highestMonth;
}

List totalConsumption(String billDatabase) {
  double totalAmount = 0;
  double totalUnits = 0;
  for (Bill i in getBills(billDatabase)) {
    totalAmount += i.amount;
  }

  for (Bill i in getBills(billDatabase)) {
    totalUnits += i.units;
  }
  return [totalAmount, totalUnits];
}

List lastBill(String billDatabase) {
  for (var i = getBills(billDatabase).length - 1; i >= 0; i--) {
    if (getBills(billDatabase)[i].units != 0) {
      return [
        getBills(billDatabase)[i].units,
        getBills(billDatabase)[i].amount
      ];
    }
  }
  double lastAmount =
      getBills(billDatabase)[getBills(billDatabase).length - 1].amount;
  int lastUnits =
      getBills(billDatabase)[getBills(billDatabase).length - 1].units;
  return [lastAmount, lastUnits];
}

Future<String> currentBalance(String service) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? currentBalanceStr = prefs.getString(service);

  return currentBalanceStr!;
}
