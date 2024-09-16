import 'package:flutter/material.dart';
import 'package:flutter_projects/Imp-widgets/stack/stack.dart';
import 'package:flutter_projects/basic-projects/project7/seventh_project.dart';
import 'package:flutter_projects/hive-local-storage/models/notes_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'hive-local-storage/hive.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var directory=await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>("notes");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:StackPage(),
      //HiveStorage(),
    );
  }
}
