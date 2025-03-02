import 'package:flutter/material.dart';
import 'dart:math';

class SecondProject extends StatefulWidget {
  const SecondProject({super.key});

  @override
  State<SecondProject> createState() => _SecondProjectState();
}

class _SecondProjectState extends State<SecondProject> {
  String currentTurn = 'X'; // X always starts first
  String winner = '';
  List<String> board = List.filled(9, ''); // Create an empty board

  void onTap(int index) {
    if (board[index] == '' && winner == '') {
      setState(() {
        board[index] = currentTurn; // Place the current turn (X or O) on the board
        if (checkWinner()) {
          winner = currentTurn;
        } else {
          currentTurn = currentTurn == 'X' ? 'O' : 'X'; // Switch turns
          if (currentTurn == 'O') {
            computerPlay(); // Let the computer play after human's turn
          }
        }
      });
    }
  }

  void computerPlay() {
    Random random = Random();
    int index;
    do {
      index = random.nextInt(9); // Randomly choose a spot on the board
    } while (board[index] != '');
    setState(() {
      board[index] = currentTurn;
      if (checkWinner()) {
        winner = currentTurn;
      } else {
        currentTurn = 'X'; // Human's turn after computer
      }
    });
  }

  bool checkWinner() {
    List<List<int>> winConditions = [
      [0, 1, 2], // Top row
      [3, 4, 5], // Middle row
      [6, 7, 8], // Bottom row
      [0, 3, 6], // Left column
      [1, 4, 7], // Middle column
      [2, 5, 8], // Right column
      [0, 4, 8], // Diagonal from top-left
      [2, 4, 6], // Diagonal from top-right
    ];

    for (var condition in winConditions) {
      if (board[condition[0]] == board[condition[1]] &&
          board[condition[1]] == board[condition[2]] &&
          board[condition[0]] != '') {
        return true; // A winner is found
      }
    }
    return false; // No winner yet
  }

  void clearBoard() {
    setState(() {
      board = List.filled(9, ''); // Clear the board
      currentTurn = 'X'; // Reset the game with 'X' starting first
      winner = ''; // Reset the winner
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe: Human vs Computer"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          board[index],
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (winner != '') // Display the winner if there is one
            Text(
              "Winner: $winner",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: clearBoard,
            child: const Text("Restart Game"),
          ),
        ],
      ),
    );
  }
}
