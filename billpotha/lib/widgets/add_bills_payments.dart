import 'package:billpotha/widgets/ceb_bill_form.dart';
import 'package:billpotha/widgets/nwsdb_bill_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          title: Center(
              child: Text(
            'Add Bills & Payments',
            style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
          )),
          leading: IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {},
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Image.asset('assets/images/ceb.png'),
              ),
              Tab(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset('assets/images/nwsdb.png'),
                ),
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
