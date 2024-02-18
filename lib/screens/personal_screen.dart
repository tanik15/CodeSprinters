import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalPortfolio extends StatefulWidget {
  const PersonalPortfolio({super.key});

  @override
  State<PersonalPortfolio> createState() => _PersonalPortfolioState();
}

class _PersonalPortfolioState extends State<PersonalPortfolio> {
  bool isLoading = false;

  void alertbox(
    context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          title: const Text(
            "Created your account",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Okay",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "My Portfolio",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setStringList("portfolio", ['']);

                  sharedPreferences.setStringList("price", ['']);
                  alertbox(
                    context,
                  );
                  setState(() {
                    isLoading = false;
                  });
                },
                child: const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
