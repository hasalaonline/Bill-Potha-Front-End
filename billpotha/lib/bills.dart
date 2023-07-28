import 'package:flutter/material.dart';

class ViewBills extends StatefulWidget {
  const ViewBills({super.key});

  @override
  State<ViewBills> createState() => _ViewBillsState();
}

class _ViewBillsState extends State<ViewBills> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'View Bills',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
