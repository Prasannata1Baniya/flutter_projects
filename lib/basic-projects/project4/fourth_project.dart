import 'package:flutter/material.dart';

class ClickAndShowMessage extends StatefulWidget {
  const ClickAndShowMessage({super.key});

  @override
  State<ClickAndShowMessage> createState() => _ClickAndShowMessageState();
}

//setState rebuilds the UI
class _ClickAndShowMessageState extends State<ClickAndShowMessage> {
  bool isMessageVisible=false;

  void toggleMessage(){
    setState(() {
      isMessageVisible=!isMessageVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              toggleMessage();
            },
                child:const  Text("Click Me",style: TextStyle(color:Colors.white,fontSize:25,
                fontWeight:FontWeight.bold,)),
            ),
            if(isMessageVisible)
           const Text("Message has been displayed",style: TextStyle(color:Colors.white,fontSize:25,
                fontWeight:FontWeight.bold,)),
          ],
        ),
      ),
    );
  }
}
