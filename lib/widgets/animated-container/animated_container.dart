import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
    double height=200;
    double width=300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              height: height,
                width: width,
                duration:const  Duration(milliseconds: 300),
              decoration:const  BoxDecoration(
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: (){
          setState(() {
            final random = Random();
            height=random.nextInt(300).toDouble();
            width=random.nextInt(200).toDouble();
          });
          },
        child:const Icon(Icons.ads_click,size: 25,color: Colors.white,),
      ),
    );
  }
}
