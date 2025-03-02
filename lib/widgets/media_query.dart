import 'package:flutter/material.dart';

class ResponsiveHomePage extends StatefulWidget {
  const ResponsiveHomePage({super.key});

  @override
  State<ResponsiveHomePage> createState() => _ResponsiveHomePageState();
}

class _ResponsiveHomePageState extends State<ResponsiveHomePage> {


  @override
  Widget build(BuildContext context) {
    double screenWidth= MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    bool isLandscape=screenWidth > screenHeight;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Screen Width:$screenWidth",style:const TextStyle(fontSize: 25),),
          Text("Screen Height:$screenHeight",style:const TextStyle(fontSize: 25),),
         const SizedBox(height: 10,),
          isLandscape?const Text("Landscape Mode"):const Text("Portrait Mode"),
          const SizedBox(height: 20,),
          Center(
            child: Container(
              height: screenHeight*0.5,
              width: screenWidth*0.8,
              color: Colors.green,
              child:const  Center(
                child:  Text("Media Query",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
