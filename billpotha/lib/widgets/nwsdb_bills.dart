import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/bill.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NwsdbBillsTable extends StatelessWidget {
  const NwsdbBillsTable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var billsBox = Hive.box('nwsdbBillsDatabase');

    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
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
                  return DataRow(
                    cells: [
                      DataCell(cellValue(bill.month)),
                      DataCell(Center(child: cellValue(bill.units.toString()))),
                      DataCell(
                          Center(child: cellValue(bill.amount.toString()))),
                      DataCell(
                          Center(child: cellValue(bill.payment.toString()))),
                    ],
                  );
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
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: GoogleFonts.ubuntu(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ));
}

Widget cellValue(String value) {
  return Text(
    value,
    style: GoogleFonts.ubuntu(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
}
