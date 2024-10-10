import 'package:flutter/material.dart';

class LinearGradientPage extends StatelessWidget {
  const LinearGradientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Colors.pink.shade500,
              Colors.pink.shade100,
            ]),
      ),
      child: const Center(
        child:Text("Linear Gradient",style: TextStyle(fontSize: 25,
            color:Colors.white,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
