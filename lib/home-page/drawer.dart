import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  final List<String> title;
  final List<VoidCallback> trailing;
  const DrawerPage({super.key, required this.title, required this.trailing});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: widget.title.length,
        itemBuilder:(context,index){
      return ListTile(
      title: Text(widget.title[index]),
      trailing: IconButton(
      onPressed: widget.trailing[index],
      icon:const Icon (Icons.arrow_forward_ios,size: 30,)),
      );
      }
      ),
    );
  }
}
