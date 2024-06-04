import 'package:flutter/material.dart';
import '../../controllers/note_controller.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/note_add_dialog.dart';
import '../widgets/note_edit_dialog.dart';
import '../widgets/note_item.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final NoteController noteController = NoteController();

  void delete(int index) {
    noteController.delete(index);
    setState(() {});
  }

  void edit(int index) async {
    Map<String, dynamic>? data = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return const NoteEditDialog();
        });

    if (data != null) {
      noteController.edit(index, data['content']);
      setState(() {});
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
       drawer: const CustomDrawer(),
      body: ListView.builder(
          itemCount: noteController.lstNote.length,
          itemBuilder: (ctx, index) {
            return NoteItem(
              noteController.lstNote[index],
              edit: () => edit(index),
              onDelete: () => delete(index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, dynamic>? data = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) {
                return const NoteAddDialog();
              });
          if (data != null) {
            noteController.add(noteController.lstNote.last.id+1, data['title'], data['content'], DateTime.now(), );
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}