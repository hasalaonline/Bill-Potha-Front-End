import 'package:billpotha/pages/bills.dart';
import 'analytics.dart';
import 'package:flutter/material.dart';
import '../widgets/add_bills_payments.dart';

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

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String sample_text = "Test";
  void _handleMenuItemTap() async {
    setState(() {
      // Update the state variables as needed
      sample_text = "Working";
    });

    await Future.delayed(Duration.zero);
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

  @override
  Widget build(BuildContext context) {
    return const Text('');
  }
}
