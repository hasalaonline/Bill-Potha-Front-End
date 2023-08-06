import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _electricityBalanceInputController =
      TextEditingController();
  final TextEditingController _waterBalanceInputController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Center(
                child: Card(
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Welcome to බිල් පොත',
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: GoogleFonts.ubuntu(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _electricityBalanceInputController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                'Enter your current electricity bill balance',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: GoogleFonts.ubuntu(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _waterBalanceInputController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your current water bill balance',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              ),
              onPressed: () {
                saveUserInput();
              },
              child: Text(
                'Start',
                style: GoogleFonts.ubuntu(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveUserInput() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String electricityBalance = _electricityBalanceInputController.text;
    String waterBalance = _waterBalanceInputController.text;
    prefs.setString('electricityBalance', electricityBalance);
    prefs.setString('waterBalance', waterBalance);
    prefs.setBool('isFirstTimeUser', false);
    // You can also set a flag to indicate that the first-time user input has been taken
    // For example, prefs.setBool('isFirstTimeUser', false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}

Future<bool> checkFirstTimeUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Change 'isFirstTimeUser' to a flag that you set when the user provides input for the first time.
  bool isFirstTimeUser = prefs.getBool('isFirstTimeUser') ?? true;
  return isFirstTimeUser;
}
