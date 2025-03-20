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
      appBar: AppBar(
        title:  const Text("Calculator",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back,color: Colors.white,),
      ),
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
