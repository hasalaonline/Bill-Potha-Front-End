import 'analytics.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  int _selectedIndex = 0;

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return const AddBillsPayments();
      case 1:
        return const AnalyticsPage();
      case 2:
        return const Text('Profile Page');
      case 3:
        return const Text('Settings Page');
      default:
        return const Text('Unknown Page');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('බිල් පොත'),
        leading: IconButton(
          icon: const Icon(Icons.language),
          tooltip: 'Language options',
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'More options',
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          _buildContent(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.analytics,
            ),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt_long,
            ),
            label: 'View Bills',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}

class AddBillsPayments extends StatefulWidget {
  const AddBillsPayments({super.key});

  @override
  State<AddBillsPayments> createState() => _AddBillsPaymentsState();
}

class _AddBillsPaymentsState extends State<AddBillsPayments> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Add Bills and Payments',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
