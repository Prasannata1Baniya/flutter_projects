import 'dart:async';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

//enum Events{start,pause,stop,restart}
class _StopWatchState extends State<StopWatch> {
  Timer? timer;
  int time=10;
  bool stop=false;

  void startWatch(){
   if(stop){
     Timer(const Duration(hours: 1,minutes: 20,seconds: 15),
             () {
       setState(() {
        const  Text("Time has finished");
       });
             }
     );
   }
  }

  void pause(){

  }

  void restart(){

  }

  void stopWatch(){
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed:(){},
             icon:const  Icon(Icons.stop,size: 30,)
            ),

            IconButton(
                onPressed: (){},
                icon:const Icon(Icons.start,size:30)
            ),

            IconButton(
                onPressed: (){},
                icon:const Icon(Icons.pause,size:30)
            ),

            IconButton(
                onPressed: (){},
                icon:const Icon(Icons.restart_alt,size: 30,)),
          ],
        )
      ],
    ),
    );
  }
}
