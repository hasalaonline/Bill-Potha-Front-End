import 'package:billpotha/bills.dart';
import 'analytics.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  void _handleMenuItemTap() {
    setState(() {
      // Update the state variables as needed
      sample_text = "Working";
    });
  }

  void _showMenu(BuildContext context) async {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        screenWidth,
        screenHeight / 8,
        0,
        0,
      ),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          value: 1,
          onTap: _handleMenuItemTap,
          child: const Row(
            children: [
              Icon(Icons.exit_to_app),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(Icons.settings),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int _selectedIndex = 0;

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return const AddBillsPayments();
      case 1:
        return const AnalyticsPage();
      case 2:
        return const ViewBills();
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
          onPressed: () {},
          icon: const Icon(Icons.language),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              _showMenu(context);
            },
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

String sample_text = "Test";

class AddBillsPayments extends StatefulWidget {
  const AddBillsPayments({super.key});

  @override
  State<AddBillsPayments> createState() => _AddBillsPaymentsState();
}

class _AddBillsPaymentsState extends State<AddBillsPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          sample_text,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
