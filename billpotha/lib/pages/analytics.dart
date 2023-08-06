import 'package:billpotha/widgets/ceb_analytics.dart';
import 'package:flutter/material.dart';
import '../widgets/nwsdb_analytics.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          title: Center(
              child: Text(
            'Analytics',
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold,
            ),
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
              onPressed: () {},
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
