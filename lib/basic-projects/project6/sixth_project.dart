import 'dart:math';

import 'package:flutter/material.dart';

class NumberGuessingGame extends StatefulWidget {
  const NumberGuessingGame({super.key});

  @override
  State<NumberGuessingGame> createState() => _NumberGuessingGameState();
}

//Users can guess upto three times

class _NumberGuessingGameState extends State<NumberGuessingGame> {
  final TextEditingController _controller = TextEditingController();

  //int randomNumber=Random().nextInt(100)+1;

  int? randomNumber;
  int? enteredNumber;
  bool isSubmitted=false;
  int submitLimit=3;
  String output='';
  bool gameOver=false;

  @override
  void initState(){
    super.initState();
    generatedRandomNumber();
  }

  void generatedRandomNumber(){
    randomNumber = Random().nextInt(100) + 1;
    debugPrint("$randomNumber");
  }

 /* void submitLimitThree(){
    while(submitLimit!=3) {
      setState(() {
        isSubmitted = !isSubmitted;
        result(output);
      });
      submitLimit++;
    }
  }

  void result(output){
    setState(() {
      if(randomNumber==enteredNumber){
       output= "It's right";
         // style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
      }
      else{
       output= "You are wrong";
       /*const Text("You are wrong",
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
        );*/
      }
    });
  }*/

  void handleSubmit(){
    if(submitLimit>0 && !gameOver){
      setState(() {
        int? enteredNumber= int.tryParse(_controller.text);
        if(enteredNumber==null){
          output="please enter the number";
          return;
        }
        if(enteredNumber==randomNumber){
          output="Congratulations, You guessed it right";
          gameOver=true;
        }
        else{
          submitLimit--;
          if(submitLimit>0){
            output="Wrong guess, you have $submitLimit attempts left ";
          }
          else{
            output="Game Over! The correct number is $randomNumber";
            gameOver=true;
          }
        }
        _controller.clear();
      });
    }
  }

  void restart(){
    setState(() {
      generatedRandomNumber();
      submitLimit = 3; // Reset attempts
      gameOver = false; // Reset game state
      output = ''; // Clear the output message
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade500,
        title:const Text("Number Guessing Game",
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
        ),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Guess and Enter the number from 1 to 100:",
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Enter the number",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:const  BorderSide(
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:const  BorderSide(
                  width: 1,
                ),
              )
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: handleSubmit,
              //submitLimitThree();
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side:const BorderSide(
                  color: Colors.blueAccent,
                ),
              ),
            ),
              child: const Text("Submit",style: TextStyle(color:Colors.white,
              fontSize: 25, fontWeight: FontWeight.w500,
              ),),
          ),
          const SizedBox(height: 20),
          Text("Result:$output",
            style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
          ),
           const SizedBox(height: 20),
           MaterialButton(
             color: Colors.green,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15),
               side:const BorderSide(
                 color: Colors.greenAccent,
               ),
             ),
             height: 60,
             minWidth: 80,
             onPressed: (){
               restart();
             },
           child: const Text("Restart",style: TextStyle(fontSize: 25,
           fontWeight:FontWeight.bold),),
           ),
        ],
      ),
    );
  }
}
