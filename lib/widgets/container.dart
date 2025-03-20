import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Container(
            width:80,
            height:80,
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(25),
              border: Border.all(
                color:Colors.black,
                width: 0.5,
              ),
              boxShadow:const [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 2,
                  spreadRadius: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
