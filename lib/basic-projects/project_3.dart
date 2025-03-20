import 'dart:math';

import 'package:flutter/material.dart';

class ThirdProject extends StatefulWidget {
  const ThirdProject({super.key});

  @override
  State<ThirdProject> createState() => _ThirdProjectState();
}
//Scissor , Paper , rock
class _ThirdProjectState extends State<ThirdProject> {
  List<String> rowsTitle=["Scissor","Paper","Rock"];
  String computerTurn='';
  String displayText='';
  String result='';

  @override
 void initState(){
   super.initState();
  }

  void update(text){
    setState(() {
      displayText=text;
      //shuffle and choose a new computer turn each time a player makes a choice
      rowsTitle.shuffle();
      computerTurn=rowsTitle[Random().nextInt(rowsTitle.length)];
      winner(); // Call winner function after updating both turns
    });
  }

  winner(){
      if(displayText=='Scissor' && computerTurn=='Scissor'||
          displayText=='Paper' && computerTurn=='Paper'
      ||displayText=='Rock' && computerTurn=='Rock'){
        setState(() {
         result= "Draw";
        });
      }
      else if(displayText=='Scissor' && computerTurn=='Paper'||
          displayText=='Paper' && computerTurn=='Rock'||displayText=='Rock' && computerTurn=='Scissor'){
        setState(() {
          result= "You win";
        });
      }
      else if(displayText=='Scissor' && computerTurn=='Rock'||
          displayText=='Paper' && computerTurn=='Scissor'||
          displayText=='Rock' && computerTurn=='Paper'){
        setState(() {
          result="Computer win";
        });
      }
      else {
        return;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rock Paper Scissors",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back,color: Colors.white,),
      ),
      body: Column(
        children: [
         const Text("Click One",
           style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn("Scissor"),
              btn("Paper"),
              btn("Rock"),
            ],
                      ),

         const SizedBox(height: 20,),
          Text("You clicked:$displayText",
           style:const  TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20,),
          Text("Computer's Choice:$computerTurn",
            style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20,),
           Row(
             children: [
               Text("Winner:$result",
                style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
               ),
              // winner(),
             ],
           )
          ],
           ),
      );
  }

  ElevatedButton btn(dataName){
    return ElevatedButton(
        onPressed: (){
          setState(() {
            debugPrint("you pressed:$dataName");
            update(dataName);
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: Text(dataName,
          style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
    );
  }
}
