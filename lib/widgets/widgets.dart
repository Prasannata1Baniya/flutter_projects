import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/alert-dialog/alert_dialog.dart';
import 'package:flutter_projects/widgets/animated-container/animated_container.dart';
import 'package:flutter_projects/widgets/card/card.dart';
import 'package:flutter_projects/widgets/container/container.dart';
import 'package:flutter_projects/widgets/drawer/drawer.dart';
import 'package:flutter_projects/widgets/future-and-stream-builder/future_or_stream_builder.dart';
import 'package:flutter_projects/widgets/linear-gradient/linear_gradient.dart';
import 'package:flutter_projects/widgets/media-query/media_query.dart';
import 'package:flutter_projects/widgets/stack/stack.dart';

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key});

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {

  @override
  Widget build(BuildContext context) {
    List<ForWidgets> widgets=[
      ForWidgets(
          title: "Alert Dialog ",
          page: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const AlertDialogPage()))
      ),
      ForWidgets(
          title: "Animated Container",
          page: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const AnimatedContainerWidget()))
      ),
      ForWidgets(
          title: "Card",
          page: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const CardPage()))
      ),
      ForWidgets(
          title: "Container",
          page: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const ContainerPage()))
      ),
      ForWidgets(
          title: "Drawer",
          page: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const DrawerWidget()))
      ),
      ForWidgets(
          title: "Future Builder",
          page: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const FutureBuilderPage()))
      ),
      ForWidgets(
          title: "Linear Gradient",
          page: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const LinearGradientPage()))
      ),
      ForWidgets(
          title: "Media Query",
          page: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const ResponsiveHomePage()))
      ),
      ForWidgets(
          title: "Stack",
          page: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const StackPage()))
      ),
    ];
    return Scaffold(
      body: ListView.builder(
        itemCount: widgets.length,
          itemBuilder: (context,index){
        return Card(
          child: Row(
            children: [
              Text(widgets[index].title),
              IconButton(
                  onPressed:()=> widgets[index].page,
                  icon:const Icon(Icons.arrow_forward_ios,size:15)
              ),
            ],
          ),
        );
      }),
    );
  }
}

class ForWidgets{
  final String title;
  final VoidCallback page;
  ForWidgets({required this.title,required this.page});
}