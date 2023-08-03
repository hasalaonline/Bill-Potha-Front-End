import 'package:flutter/material.dart';
import '../models/bill.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NwsdbBillsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var billsBox = Hive.box('nwsdbBillsDatabase');

    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/nwsdb.png',
            height: 80,
            width: 80,
          ),
          DataTable(
            columns: const [
              DataColumn(label: Text('Month')),
              DataColumn(label: Text('Units')),
              DataColumn(label: Text('Amount')),
              DataColumn(label: Text('Payment')),
            ],
            rows: List<DataRow>.generate(
              billsBox.length,
              (index) {
                var bill = billsBox.getAt(index) as Bill;
                return DataRow(cells: [
                  DataCell(Text(bill.month)),
                  DataCell(Text(bill.units.toString())),
                  DataCell(Text(bill.amount.toString())),
                  DataCell(Text(bill.payment.toString())),
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}