import 'package:flutter/material.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
   bool switchOff=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toggle Switch",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back,color: Colors.white,),
      ),
        body:Column(
          children: [
            Switch(
              activeColor: Colors.red,
                value: switchOff,
                onChanged:(bool switchOn){
              setState(() {
                switchOff=switchOn;
              });
             }
            ),
          ],
        ),
    );
  }
}
