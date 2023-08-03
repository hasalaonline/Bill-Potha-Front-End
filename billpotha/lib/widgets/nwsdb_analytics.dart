import 'package:flutter/material.dart';

class NwsdbAnalytics extends StatelessWidget {
  const NwsdbAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.deepPurpleAccent,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Average',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Consumption',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Card(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '103',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.deepPurpleAccent,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Average',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Expenditure',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Card(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Rs. 4,000',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                      ],
                    ),
                  )),
            ),
          ],
        ),
        const Text('Comsumption Analysis', style: TextStyle(fontSize: 24)),
        Image.asset('assets/comsumption.png'),
        const Card(
          color: Colors.deepPurpleAccent,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Highest Monthly Comsumption',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                Text('June',
                    style: TextStyle(fontSize: 24, color: Colors.yellowAccent)),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('116',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Card(
          color: Colors.deepPurpleAccent,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Highest Monthly Expenditure',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                Text('June',
                    style: TextStyle(fontSize: 24, color: Colors.yellowAccent)),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Rs. 4,500',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Card(
          color: Colors.deepPurpleAccent,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Total Expenditure',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                Text('2023',
                    style: TextStyle(fontSize: 24, color: Colors.yellowAccent)),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Rs. 40,000',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.deepPurpleAccent,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Last Month',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Consumption',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Card(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '112',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.deepPurpleAccent,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Decresemnt',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Percentage',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Card(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '4%',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
