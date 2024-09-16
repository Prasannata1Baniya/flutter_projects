import 'package:flutter/material.dart';

class SecondProject extends StatefulWidget {
  const SecondProject({super.key});

  @override
  State<SecondProject> createState() => _SecondProjectState();
}
/*For making tic tac toe game
//X turn, O turn
//Who is Winner ? Winner check
//Clear the game after one opponent wins
//After one opponent turn another opponent play
//One is computer and another is Human
//Starts from X and then another player plays being X
Game of computer vs human
*/
class _SecondProjectState extends State<SecondProject> {
  String currentTurn='X';
  String humanTurn='X';
  String computerTurn='';

  List<String> board=List.filled(9, '');

  void onTap(){
    if(board.isEmpty){
      setState(() {
        currentTurn='X';
      });
    }
  }

  void checkWinner(){
   List<List> conditions=[
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,4,8],
     [2,4,6],
     [0,3,6],
     [1,4,7],
     [2,5,8],
   ];
   for(int i=0;i<conditions.length;i++){
     for(int j=0;j<conditions.length;j++){
       if(board[i][j]==board[i][j]){

       }
     }
   }
  }

  void winner(){

  }
  void clear(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: GridView.builder(
                  itemCount: 9,
                    gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context,index){
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Text(board[index],
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  );
                    }),
              ),
            ),
           const  Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Computer Turn:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                  color:Colors.black),),

                Text("Human Turn:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                  color:Colors.black,),),
              ],
            ),
           const SizedBox(height:12),
           const Text("Winner:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
           color:Colors.black,
           ),)
          ],
        ),

      ),

    );
  }
}


