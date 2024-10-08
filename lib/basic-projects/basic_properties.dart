import 'package:flutter/material.dart';
import 'package:flutter_projects/basic-projects/project1/first_project.dart';
import 'package:flutter_projects/basic-projects/project2/second_project.dart';
import 'package:flutter_projects/basic-projects/project3/third_project.dart';
import 'package:flutter_projects/basic-projects/project4/fourth_project.dart';
import 'package:flutter_projects/basic-projects/project5/fifth_project.dart';
import 'package:flutter_projects/basic-projects/project6/sixth_project.dart';
import 'package:flutter_projects/basic-projects/project7/seventh_project.dart';
import 'package:flutter_projects/basic-projects/project8/eighth_project.dart';
import 'package:flutter_projects/basic-projects/project9/ninth_project.dart';
import 'package:flutter_projects/home-page/home_page.dart';

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
      AllProjects(
          navigationPage:()=>Navigator.push(context, MaterialPageRoute(
              builder: (context)=>const StopWatch()))
      ),
    ];
    List titles=List.generate(15, (index) => Text("Project $index")
    );

    return Scaffold(
      body:  ListView.builder(
        itemCount: projects.length,
          itemBuilder: (context,index){
            return Card(
              child: Row(
                children: [
                  Text(titles[index]),
                  IconButton(
                      onPressed: ()=>projects[index],
                      icon:const Icon(Icons.arrow_forward_ios)
                  ),
                ],
              ),
            );
          }),
    );
  }
}
