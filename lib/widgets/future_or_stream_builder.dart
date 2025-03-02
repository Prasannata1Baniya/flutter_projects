import 'package:flutter/material.dart';

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({super.key});

  Future<int> fetchData() async {
    // Simulating a network call or data fetching delay
    await Future.delayed(const Duration(seconds: 3));
    return 420;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder Example'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: FutureBuilder<int>(
          future: fetchData(),
          builder: (context, snapShot) {
            // Check if the data is still being fetched
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Loading indicator
            }
            // Check if the data was successfully fetched
            else if (snapShot.hasData) {
              return Text("Result: ${snapShot.data}"); // Display the result
            }
            // Handle the case where there's an error
            else if (snapShot.hasError) {
              return Text("Error: ${snapShot.error}");
            }
            // Fallback in case there's no data or error
            else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }
}




