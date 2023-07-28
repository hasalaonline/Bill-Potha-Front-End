import 'package:flutter/material.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Analytics',
          style: TextStyle(fontSize: 24),
        ),
      ),
      );
  }
}
