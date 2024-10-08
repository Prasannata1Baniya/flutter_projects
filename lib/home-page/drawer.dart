import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  final String title;
  final VoidCallback leading;
  const DrawerPage({super.key, required this.title, required this.leading});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      leading:  IconButton(
        onPressed: ()=>widget.leading,
       icon:const Icon (Icons.arrow_forward_ios,size: 30,)),
    );
  }
}
