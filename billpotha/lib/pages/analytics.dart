import 'package:billpotha/widgets/ceb_analytics.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import '../widgets/nwsdb_analytics.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Analytics'),
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
                const SideMenu();
              },
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            SingleChildScrollView(
              child: CebAnalytics(),
            ),
            SingleChildScrollView(
              child: NwsdbAnalytics(),
            ),
          ],
        ),
      ),
    );
  }
}
