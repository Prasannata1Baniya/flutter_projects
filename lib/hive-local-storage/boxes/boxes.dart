import 'package:flutter_projects/hive-local-storage/models/notes_model.dart';
import 'package:hive/hive.dart';

class Boxes{
  static Box<NotesModel> getData()=> Hive.box<NotesModel>('notes');
}