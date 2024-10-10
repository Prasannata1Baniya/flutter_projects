import 'package:flutter/material.dart';

Card listview(String head, VoidCallback callback){
          return Card(
            color: Colors.grey.shade300,
            margin: const EdgeInsets.all(8),
            borderOnForeground: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(head),
                IconButton(
                    onPressed: callback,
                    icon:const Icon(Icons.arrow_forward_ios)
                ),
              ],
            ),
  );
}
