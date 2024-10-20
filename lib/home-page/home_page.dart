import 'package:flutter/material.dart';
import 'package:flutter_projects/basic-projects/basic_properties.dart';
import 'package:flutter_projects/hive-local-storage/hive.dart';
import 'package:flutter_projects/home-page/drawer.dart';
import 'package:flutter_projects/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    List<String> drawerTitle=[
      "Basic Properties",
      "Hive Local Storage",
      "Flutter Widgets"
    ];
    List<VoidCallback> drawerLeading=[
      ()=>Navigator.push(context,
          MaterialPageRoute(builder: (context)=>const BasicPropertiesPage())),
      ()=>Navigator.push(context,
          MaterialPageRoute(builder: (context)=>const HiveStorage())),
      ()=>Navigator.push(context,
          MaterialPageRoute(builder: (context)=>const WidgetsPage()))
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Projects"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.orange.shade300,
        child: DrawerPage(
          title:drawerTitle,
          trailing: drawerLeading,
        ),
      ),
      body:const BasicPropertiesPage(),
    );
  }
}
