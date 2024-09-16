import 'package:flutter/material.dart';
import 'package:flutter_projects/hive-local-storage/models/notes_model.dart';
import 'boxes/boxes.dart';

class HiveStorage extends StatefulWidget {
  const HiveStorage({super.key});

  @override
  State<HiveStorage> createState() => _HiveStorageState();
}

class _HiveStorageState extends State<HiveStorage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<NotesModel> notes = [];

  Future<void> addNotes() async {
    final data = NotesModel(
      title: titleController.text,
      description: descriptionController.text,
    );
    final box = Boxes.getData();
    box.add(data);
    setState(() {
      notes.add(data);
      titleController.clear();
      descriptionController.clear();
    });
  }
  Future<void> deleteNote(int index) async {
    final box = Boxes.getData();
    await box.deleteAt(index); // Delete from Hive
    setState(() {
      notes.removeAt(index); // Update local list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child:Text('Notes App')),
      backgroundColor: Colors.purple.shade100,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.description),
                    trailing:IconButton(onPressed: (){},
                        icon:const  Icon(Icons.delete)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                textFormField(titleController, "Enter a title"),
                const SizedBox(height: 10),
                textFormField(descriptionController, "Enter a description"),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNotes,
        child: const Icon(Icons.add, size: 20),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     /*bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 20,
        ),
      ),*/
    );
  }

  TextFormField textFormField(TextEditingController controller, String hintText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
