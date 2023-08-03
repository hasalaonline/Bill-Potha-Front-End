import 'package:billpotha/signin.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bill.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(BillAdapter());
  await Hive.openBox('cebBillsDatabase');
  await Hive.openBox('nwsdbBillsDatabase');
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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('si'), // Sinhala
      ],
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomePage(),
        '/signin': (BuildContext context) => SignIn(),
        '/signup': (BuildContext context) => const SignUp(),
      },
    );
  }
}
