import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            color: Colors.indigo,
            shadowColor: Colors.indigo.shade300,
            child: const Text("Hello World",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
