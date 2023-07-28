import 'package:flutter/material.dart';

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
          title: const Text('Bills & Payments'),
          leading: IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
            },
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
              child: Text(
                'Electricity',
                style: TextStyle(fontSize: 24),
              ),
            ),
             Center(
              child: Text(
                'Water',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
