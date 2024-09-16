import 'package:flutter/material.dart';

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({super.key});

  Future<int> fetchData() async{
    await Future.delayed(const Duration(seconds: 3));
    return 420;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<int>(
            future: fetchData(),
            builder: (context,snapShot){
          if(snapShot.connectionState==ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          else{
            return Text("Result{$snapShot.data}");
          }
            }),
      ),
    );
  }
}
