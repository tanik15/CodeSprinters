import 'package:flutter/material.dart';

class BlackBOx extends StatelessWidget {
  const BlackBOx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WazirX Example'),
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'INR Deposits\nAre Live!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Deposit funds directly from your bank account to WazirX wallet. Deposit Now',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue[900],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'AUDIO',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$21.667',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
                Text(
                  '14.04%',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'wazirx P2P',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue[900],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SC',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '₹1.0644',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
                Text(
                  '13.24%',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text('New'),
          ),
        ]),
      ),
    );
  }
}
