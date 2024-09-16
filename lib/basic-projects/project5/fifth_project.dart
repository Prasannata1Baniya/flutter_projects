import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey=GlobalKey<ScaffoldState>();

  //For Drawer
  List<String> elementsTitle=[
    "Home",
    "Phone Number",
    "Email",
  ];
  List<IconData> iconsData=[
    Icons.home,
    Icons.phone,
    Icons.email,
  ];

  //For body ListTiles -titles
  List<Widget> generateTiles(int num){
    return List.generate(num, (index) => Card(
      margin:const  EdgeInsets.only(left: 24, right:24,bottom:14,top:14),
      color: Colors.blue.shade300,
      child: ListTile(
        title: Text("Item $index",style:const TextStyle(color:Colors.white,fontSize: 25,
        fontWeight:FontWeight.bold)),
        leading:const Icon(Icons.person),
        trailing: const Icon(Icons.arrow_forward_sharp),
      ),
    ));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: const Text("Flutter App"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue.shade300,
       // key:scaffoldKey.currentState?.openDrawer(),
        child:elements(),
      ),

      body: ListView(
        children: generateTiles(10),
      ),
    );
  }

//For Drawer-Elements
ListView elements(){
    return ListView(
      children: [
        IconButton(onPressed: (){
          Navigator.of(context).pop();
        },
            icon:const Icon(Icons.cancel,size: 25,)
        ),
        for(int i=0;i<elementsTitle.length;i++)
        ListTile(
          title: Text(elementsTitle[i]),
          leading: Icon(iconsData[i]),
        ),
      ],
    );
  }

//Another Approach
/*ListView elements(){
    return ListView(
      children:
      List.generate(elementsTitle.length, (index) =>ListTile(
          title: Text(elementsTitle[index]),
          leading: Icon(iconsData[index]),
        )),
    );
  }*/
}
