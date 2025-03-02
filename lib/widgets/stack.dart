import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
        children: [
          // First layer (bottom)
          Container(
            width:300,
            height:300,
            color:Colors.red,
          ),
          //Second Layer(middle)
          Container(
            width: 200,
            height:200,
            color:Colors.yellow,
          ),
          //Third Layer (top)
          Container(
            width: 100,
            height:100,
            color: Colors.green,
          ),
          Positioned(
            top: 10,
              right: 10,
              child: Container(
              width:50,
              height: 50,
              color:Colors.purple,
          ),
         ),
        ],
        ),
      ),
    );
  }
}
