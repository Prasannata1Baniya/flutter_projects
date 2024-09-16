import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  List drawerElements=[
    "Menu",
    "Home",
    "Profile",
    "Contact"
  ];
  List iconsData=[
   const  Icon(Icons.menu),
    const Icon(Icons.home),
    const Icon(Icons.person),
    const Icon(Icons.contact_page_sharp),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.orange,
        child: Column(
          children: [
            Center(
              child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.cancel),
              ),
            ),
            ListView.builder(
                itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text(drawerElements[index]),
                  trailing: Icon(iconsData[index]),
                ),
              );
            }),
          ],
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
