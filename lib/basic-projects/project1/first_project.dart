/*import 'package:flutter/material.dart';

class FirstProject extends StatefulWidget {
  const FirstProject({super.key});

  @override
  State<FirstProject> createState() => _FirstProjectState();
}
//For Calculator
class _FirstProjectState extends State<FirstProject> {
  List<String> numbersAndOperators=[
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "+",
    "-",
    "*",
    "/",
    "=",
    "C"
  ];
  List<String> operators=["+",
    "-",
    "*",
    "/",
    "=",
    "C"
  ];
  String currentInput='';
  String previousInput='';
  String selectedOperator='';
  String? result;

  void onNumberTap(number){
    setState(() {
        currentInput+=number;
    });
  }
void clearTap(){
    setState(() {
      if(selectedOperator=='C'){
        currentInput='';
        previousInput='';
      }
    });
}
  void onOperatorTap(operator){
    setState(() {
      if (currentInput.isNotEmpty) {
        previousInput += currentInput;
        selectedOperator = operator;
        currentInput = '';
      }
    });
  }

  void onEqualsTap() {
    double num1 = double.parse(previousInput);
    double num2 = double.parse(currentInput);
    double result;

    switch (selectedOperator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      default:
        result = num2;
    }

    setState(() {
      currentInput = result.toString();
      selectedOperator = '';
      previousInput = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:const  EdgeInsets.all(15),
      margin: const EdgeInsets.all(55),
      height:800,
      width:400,
      decoration: BoxDecoration(
        color:Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:Colors.black,
        )
      ),
      child:Column(
        children: [
          //For screen
          Container(
            height: 60,
            width:300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:Colors.grey.shade500,
                border: Border.all(
                  color:Colors.black,
                )
            ),
            child:Text(currentInput.isEmpty ? '0' : currentInput,
              style: const TextStyle(fontSize: 32, color: Colors.black),
            ),
          ),
          const SizedBox(height:10),
          //For numbers and operators
         Expanded(
           child: GridView.builder(
               gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,
                 //childAspectRatio: 0.8,
           ),
               itemCount: numbersAndOperators.length,
               itemBuilder: (context,index){
                 final input=numbersAndOperators[index];

             return GestureDetector(
               onTap: (){
                 debugPrint("hello");
                 if(RegExp(r'[0-9]').hasMatch(input)){
                  onNumberTap(numbersAndOperators[index]);
                 }
                 else if(selectedOperator=='C'){
                   clearTap();
                 }
                 else if(selectedOperator=='='){
                   onEqualsTap();
                 }
                 else{
                   onOperatorTap(operators.toString());
                 }
               },
               child: Container(
                 height:30,
                 width:40,
                 decoration: BoxDecoration(
                   color:Colors.orange.shade500,
                     borderRadius: BorderRadius.circular(25),
                     border: Border.all(
                       color:Colors.black,
                     )
                 ),
                 child: Center(child: Text(numbersAndOperators[index],
                   style:const TextStyle(
                   color:Colors.white,
                   fontSize:25,
                   fontWeight: FontWeight.bold,
                 ),)),
               ),
             );
               }),
         ),
        ],
      ),
              ),
    );
  }
}
*/


/*import 'package:flutter/material.dart';

class FirstProject extends StatefulWidget {
  const FirstProject({super.key});

  @override
  State<FirstProject> createState() => _FirstProjectState();
}

class _FirstProjectState extends State<FirstProject> {
  List<String> numbersAndOperators = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "+", "-", "*", "/", "=", "C"
  ];

  String currentInput = '';
  String previousInput = '';
  String selectedOperator = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(55),
        height: 800,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Column(
          children: [
            // Display screen
            Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade500,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Center(
                child: Text(
                 ""
                 // style: const TextStyle(fontSize: 32, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Numbers and operators grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: numbersAndOperators.length,
                itemBuilder: (context, index) {
                  final input = numbersAndOperators[index];

                  return GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      height: 30,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade500,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          input,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

class FirstProjectCalculator extends StatefulWidget {
  const FirstProjectCalculator({super.key});

  @override
  State<FirstProjectCalculator> createState() => _FirstProjectCalculatorState();
}

class _FirstProjectCalculatorState extends State<FirstProjectCalculator> {
  List<String> numbersAndOperators = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "+", "-", "*", "/", "=", "C"
  ];

  String currentInput = '';
  String previousInput = '';
  String selectedOperator = '';
  String errorMessage = '';

  void onNumberTap(String number) {
    setState(() {
      currentInput += number;
      errorMessage = '';  // Clear error message when a number is tapped
    });
  }

  void clearTap() {
    setState(() {
      currentInput = '';
      previousInput = '';
      selectedOperator = '';
      errorMessage = '';  // Clear error message on clear
    });
  }

  void onOperatorTap(String operator) {
    setState(() {
      if (currentInput.isNotEmpty) {
        previousInput = currentInput;
        selectedOperator = operator;
        currentInput += operator;  // Concatenate the operator
      }
    });
  }

  void onEqualsTap() {
    if (previousInput.isNotEmpty && currentInput.isNotEmpty) {
      // Extract the numbers from the input string
      final parts = currentInput.split(selectedOperator);
      if (parts.length == 2) {
        double num1 = double.parse(parts[0]);
        double num2 = double.parse(parts[1]);
        double result;

        try {
          switch (selectedOperator) {
            case '+':
              result = num1 + num2;
              break;
            case '-':
              result = num1 - num2;
              break;
            case '*':
              result = num1 * num2;
              break;
            case '/':
              if (num2 == 0) {
                throw Exception("Division by zero is not allowed");
              }
              result = num1 / num2;
              break;
            default:
              throw Exception("Invalid operation");
          }

          setState(() {
            currentInput = result.toString();
            selectedOperator = '';
            previousInput = '';
            errorMessage = '';  // Clear error message on success
          });
        } catch (e) {
          setState(() {
            errorMessage = e.toString();
            currentInput = '';  // Clear the input to avoid further errors
            selectedOperator = '';
            previousInput = '';
          });
        }
      } else {
        setState(() {
          errorMessage = "Invalid input";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(55),
        height: 800,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Column(
          children: [
            // Display screen
            Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade500,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Center(
                child: Text(
                  errorMessage.isEmpty ? (currentInput.isEmpty ? '0' : currentInput) : errorMessage,
                  style: TextStyle(fontSize: 32, color: errorMessage.isEmpty ? Colors.black : Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Numbers and operators grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: numbersAndOperators.length,
                itemBuilder: (context, index) {
                  final input = numbersAndOperators[index];

                  return GestureDetector(
                    onTap: () {
                      if (RegExp(r'[0-9]').hasMatch(input)) {
                        onNumberTap(input);
                      } else if (input == 'C') {
                        clearTap();
                      } else if (input == '=') {
                        onEqualsTap();
                      } else {
                        onOperatorTap(input);
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade500,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          input,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
