import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/nwsdb.png',
              height: 100,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            hintText: 'Month',
                            border: OutlineInputBorder(),
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Units',
                            border: OutlineInputBorder(),
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Amount',
                            border: OutlineInputBorder(),
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
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.deepPurpleAccent),
                              iconColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
