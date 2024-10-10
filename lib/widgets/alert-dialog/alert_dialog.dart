import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  const AlertDialogPage({super.key});

  @override
  State<AlertDialogPage> createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {

  void _dialog(){
    showDialog(context: context,
        builder: (context){
       return AlertDialog(
         backgroundColor: Colors.white,
         title:const  Text("Information",style: TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 25,
           color: Colors.black,
         )),
         content: const Text("Coding is Fun.",style: TextStyle(
             fontWeight: FontWeight.normal,
            fontSize: 25,
           color: Colors.black,
         ),),
         actions: [
           TextButton(onPressed: (){
             Navigator.pop(context);
           }, child: const Text("Go back",style: TextStyle(color:Colors.blue),),
           ),
         ],
       );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _dialog,
                child:const Text("Click Here"),
            ),
          ),
        ],
      ),
    );
  }
}
