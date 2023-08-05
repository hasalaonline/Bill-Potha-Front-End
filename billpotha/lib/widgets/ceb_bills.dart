import 'package:flutter/material.dart';
import '../models/bill.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BillsTable extends StatelessWidget {
  const BillsTable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var billsBox = Hive.box('cebBillsDatabase');

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ceb.png',
              height: 80,
              width: 80,
            ),
            DataTable(
              horizontalMargin: screenWidth * 0.07,
              columnSpacing: screenWidth * 0.06,
              columns: [
                DataColumn(
                  label: columTitle('Month'),
                ),
                DataColumn(
                  label: columTitle('Units'),
                ),
                DataColumn(
                  label: columTitle('Amount'),
                ),
                DataColumn(
                  label: columTitle('Paid'),
                ),
              ],
              rows: List<DataRow>.generate(
                billsBox.length,
                (index) {
                  var bill = billsBox.getAt(index) as Bill;
                  return DataRow(cells: [
                    DataCell(cellValue(bill.month)),
                    DataCell(Center(child: cellValue(bill.units.toString()))),
                    DataCell(Center(child: cellValue(bill.amount.toString()))),
                    DataCell(Center(child: cellValue(bill.payment.toString()))),
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget columTitle(String title) {
  return Card(
      color: Colors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ));
}

Widget cellValue(String value) {
  return Text(
    value,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
}
