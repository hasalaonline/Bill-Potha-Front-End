import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/bill.dart';
import '../functions/bill_handling.dart';
import '../pages/welcome.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(BillAdapter());

  await Hive.openBox('cebBillsDatabase');
  await Hive.openBox('nwsdbBillsDatabase');

  if (Hive.box('cebBillsDatabase').isEmpty) {
    await initializeBillDatabase('cebBillsDatabase');
  }

  if (Hive.box('nwsdbBillsDatabase').isEmpty) {
    await initializeBillDatabase('nwsdbBillsDatabase');
  }
  runApp(const MyApp());
}

class BillAdapter extends TypeAdapter<Bill> {
  @override
  int get typeId => 0; // Unique identifier for the adapter

  @override
  Bill read(BinaryReader reader) {
    return Bill(reader.read(), reader.read(), reader.read(), reader.read());
  }

  @override
  void write(BinaryWriter writer, Bill obj) {
    writer.write(obj.month);
    writer.write(obj.units);
    writer.write(obj.amount);
    writer.write(obj.payment);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bill Potha',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: checkFirstTimeUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return const WelcomePage();
            } else {
              return const HomePage();
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

