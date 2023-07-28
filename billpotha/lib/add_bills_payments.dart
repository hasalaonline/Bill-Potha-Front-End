import 'package:billpotha/ceb_bill.dart';
import 'package:billpotha/nwsdb_bill.dart';
import 'package:flutter/material.dart';

class AddBillsPayments extends StatefulWidget {
  const AddBillsPayments({
    super.key,
  });

  @override
  State<AddBillsPayments> createState() => _AddBillsPaymentsState();
}

class _AddBillsPaymentsState extends State<AddBillsPayments> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: AddBills(),
    ));
  }
}

class AddBills extends StatefulWidget {
  const AddBills({super.key});

  @override
  State<AddBills> createState() => _AddBillsState();
}

class _AddBillsState extends State<AddBills> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Bills & Payments'),
          leading: IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {},
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.flash_on),
              ),
              Tab(
                icon: Icon(Icons.water_rounded),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // _showMenu(context);
              },
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            Center(
              child: CebBill(),
            ),
            Center(
              child: NwsdbBill(),
            ),
          ],
        ),
      ),
    );
  }
}
