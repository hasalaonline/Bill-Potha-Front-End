import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../functions/bill_handling.dart';

class NwsdbBill extends StatefulWidget {
  const NwsdbBill({super.key});

  @override
  State<NwsdbBill> createState() => _NwsdbBillState();
}

class _NwsdbBillState extends State<NwsdbBill> {
  late String _selectedMonth;

  @override
  void initState() {
    super.initState();
    // Get the current date and time
    DateTime now = DateTime.now();

    // Get the current month name
    _selectedMonth = DateFormat('MMMM').format(now);
  }

  final _formKey = GlobalKey<FormState>();
  String _units = '';
  String _amount = '';
  String _payment = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/nwsdb.png',
              height: 80,
              width: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: nwsdbBillForm(context),
            ),
          ],
        ),
      ),
    );
  }

  Form nwsdbBillForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      hintText: 'Month',
                      border: InputBorder.none,
                    ),
                    value: _selectedMonth,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedMonth = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a month';
                      }
                      return null;
                    },
                    items: <String>[
                      'January',
                      'February',
                      'March',
                      'April',
                      'May',
                      'June',
                      'July',
                      'August',
                      'September',
                      'October',
                      'November',
                      'December'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Units',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter units';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _units = value!;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Amount',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter amount';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _amount = value!;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Payment',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter payment';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _payment = value!;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepPurpleAccent),
                    iconColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      addBill(
                        _selectedMonth,
                        int.parse(_units),
                        double.parse(_amount),
                        double.parse(_payment),
                        'nwsdbBillsDatabase',
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data Added Successfully'),
                        ),
                      );
                    }
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
