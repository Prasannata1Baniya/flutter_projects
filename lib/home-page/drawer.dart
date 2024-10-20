import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  final List<String> title;
  final List<VoidCallback> trailing;
  const DrawerPage({super.key,required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: title.length,
          itemBuilder:(context,index){
            return ListTile(
              title: Text(title[index]),
              trailing: IconButton(
                  onPressed: trailing[index],
                  icon:const Icon (Icons.arrow_forward_ios,size: 30,)),
            );
          }
      ),
    );
  }
}
