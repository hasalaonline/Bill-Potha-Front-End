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

double totalExpense(String billDatabase) {
  double totalAmount = 0;
  for (Bill i in getBills(billDatabase)) {
    totalAmount += i.amount;
  }
  return totalAmount;
}
