import 'package:flutter/material.dart';
import 'package:vazifa/models/note.dart';
import '../../controllers/note_controller.dart';

// ignore: must_be_immutable
class NoteItem extends StatefulWidget {
  final Function() onDelete;
  final Function() edit;
  final Note note;
  const NoteItem(this.note,
      {super.key,
      required this.onDelete,
      required this.edit});

  @override
  // ignore: no_logic_in_create_state
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  final NoteController noteController = NoteController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.yellow),
        child: ListTile(
          title: Text(widget.note.title,
              style:const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          subtitle: Text(widget.note.content,
              style:const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed:widget.edit,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                  )),
              IconButton(
                  onPressed: widget.onDelete,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}