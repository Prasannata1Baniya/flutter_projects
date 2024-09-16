import 'package:flutter/material.dart';

class MemoryMatchingGame extends StatefulWidget {
  const MemoryMatchingGame({super.key});

  @override
  State<MemoryMatchingGame> createState() => _MemoryMatchingGameState();
}

class _MemoryMatchingGameState extends State<MemoryMatchingGame> {

  List<String> imagesData=[
    "assets/images/circle.png",
    "assets/images/heart.png",
    "assets/images/star.png",
    "assets/images/triangle.png",
    "assets/images/circle.png",
    "assets/images/heart.png",
    "assets/images/star.png",
    "assets/images/triangle.png",
    "assets/images/star.png",
  ];

  //List<String> imagesData= ['🍎', '🍌', '🍇', '🍉', '🍒', '🥝','🍎', '🍌'];

  List<bool> revealed=[];


  @override
  void initState(){
    super.initState();
    imagesData.shuffle();
    revealed=List.generate(imagesData.length, (index) => false);
  }


  int firstSelected=-1;
  int secondSelected=-1;
  int score=0;

  void onCardTapped(index){
    if (revealed[index]) {
      // If the card is already revealed, do nothing
      return;
    }
    setState(() {
      if (firstSelected == -1) {
        firstSelected = index;
        revealed[firstSelected]=true;
        /*Future.delayed(const Duration(milliseconds: 300),(){
          revealed[firstSelected]=true;
        });*/
      }
      else if (secondSelected == -1 && index != firstSelected) {
        secondSelected = index;
        revealed[firstSelected]=true;

        // Checks if two selected images match
        if (imagesData[firstSelected] == imagesData[secondSelected]) {
          score=score+10;
          revealed[firstSelected] = true;
          revealed[secondSelected] = true;

          // Reset selections after a short delay
          Future.delayed(const Duration(milliseconds: 300), () {
            setState(() {
              firstSelected = -1;
              secondSelected = -1;
            });
          });
        } else {
          // If they don't match, flip them back after a delay
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              revealed[firstSelected] = false;
              revealed[secondSelected] = false;
              firstSelected =-1;
              secondSelected = -1;
            });
          });
        }

        // Temporarily show both selected cards
        revealed[firstSelected] = true;
        revealed[secondSelected] = true;
      }
      else{
        return;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          containers("Score"),
          const SizedBox(height:15),
          SizedBox(
            height:400,
            width: 400,
            child: GridView.builder(
                itemCount: imagesData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:3),
                itemBuilder:(context,index){
                  return GestureDetector(
                    onTap: (){
                      onCardTapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange.shade700,
                        image:DecorationImage(
                          image: AssetImage(
                              revealed[index] ? imagesData[index]:
                              "assets/images/hidden.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
  Container containers(String title){
    return Container(
      height: 80,
      width:80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:Colors.blue,
      ),
      child: Column(
        children: [
          Text(title,
          style:const TextStyle(color:Colors.black,fontWeight: FontWeight.bold,
          fontSize: 25),
          ),
          Text("$score",style:const TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}
