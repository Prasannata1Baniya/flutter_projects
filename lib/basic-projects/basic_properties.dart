import 'package:flutter/material.dart';
import 'package:flutter_projects/basic-projects/project1/first_project.dart';
import 'package:flutter_projects/basic-projects/project2/second_project.dart';
import 'package:flutter_projects/basic-projects/project3/third_project.dart';
import 'package:flutter_projects/basic-projects/project4/fourth_project.dart';
import 'package:flutter_projects/basic-projects/project5/fifth_project.dart';
import 'package:flutter_projects/basic-projects/project6/sixth_project.dart';
import 'package:flutter_projects/basic-projects/project7/seventh_project.dart';
import 'package:flutter_projects/basic-projects/project8/eighth_project.dart';
import 'package:flutter_projects/for-basic-and-widgets/basic_widgets.dart';

class BasicPropertiesPage extends StatefulWidget {
  const BasicPropertiesPage({super.key});

  @override
  State<BasicPropertiesPage> createState() => _BasicPropertiesPageState();
}

class _BasicPropertiesPageState extends State<BasicPropertiesPage> {
  @override
  Widget build(BuildContext context) {
    List<AllProjects> projects=[
      AllProjects(
          navigationPage:()=>Navigator.push(context, MaterialPageRoute(
              builder: (context)=>const FirstProjectCalculator()))
      ),
      AllProjects(
          navigationPage:()=>Navigator.push(context, MaterialPageRoute(
              builder: (context)=>const SecondProject()))
      ),
      AllProjects(
          navigationPage:()=>Navigator.push(context, MaterialPageRoute(
              builder: (context)=>const ThirdProject()))
      ),
      AllProjects(
          navigationPage:()=>Navigator.push(context, MaterialPageRoute(
              builder: (context)=>const ClickAndShowMessage()))
      ),
      AllProjects(
          navigationPage:()=>Navigator.push(context, MaterialPageRoute(
              builder: (context)=>const FifthPage()))
      ),
      AllProjects(
          navigationPage:()=>Navigator.push(context, MaterialPageRoute(
              builder: (context)=>const NumberGuessingGame()))
      ),
      AllProjects(
          navigationPage:()=>Navigator.push(context, MaterialPageRoute(
              builder: (context)=>const MemoryMatchingGame()))
      ),
      AllProjects(
          navigationPage:()=>Navigator.push(context, MaterialPageRoute(
              builder: (context)=>const ToggleSwitch()))
      ),
    ];
    List<String> titles=List.generate(projects.length, (index) => "Project ${index+1}"
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title:const Text("Basic Properties",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
          itemCount: projects.length,
          itemBuilder:(context,index) {
        return Padding(
            padding:const EdgeInsets.all(8),
          child: listview(
              titles[index],
              projects[index].navigationPage
          ),
        );
      }),
    );
  }
}
class AllProjects{
  final VoidCallback navigationPage;
  AllProjects({required this.navigationPage,});
}

