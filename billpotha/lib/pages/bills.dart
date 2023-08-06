import 'package:billpotha/widgets/nwsdb_bills.dart';
import 'package:flutter/material.dart';
import '../widgets/ceb_bills.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewBills extends StatefulWidget {
  const ViewBills({super.key});

  @override
  State<ViewBills> createState() => _ViewBillsState();
}

class _ViewBillsState extends State<ViewBills> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Bills & Payments',
            style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold, color: Colors.black),
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
          children: [BillsTable(), NwsdbBillsTable()],
        ),
      ),
    );
  }
}
