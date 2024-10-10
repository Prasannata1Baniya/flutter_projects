import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> drawerElements=[
      "Menu",
      "Home",
      "Profile",
      "Contact"
    ];
    List<IconData> iconsData=[
      Icons.menu,
      Icons.home,
      Icons.person,
      Icons.contact_page_sharp,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Page",style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      drawer: Drawer(
        backgroundColor: Colors.orange,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:25.0),
                child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: drawerElements.length,
                  itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    title: Text(drawerElements[index]),
                    trailing: Icon(iconsData[index]),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
