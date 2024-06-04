import 'package:flutter/material.dart';
import 'package:vazifa/models/note.dart';

class NoteController with ChangeNotifier {
  final List<Note> _lstNote = [
    Note(
        id: 0,
        title: 'note1',
        content: "njksnvknskjnvskj",
        createDate: DateTime.now())
  ];

  List<Note> get lstNote {
    return [..._lstNote];
  }

  void add(int i, String title, String content, DateTime date) {
    _lstNote.add(Note(id: i, title: title, content: content, createDate: date));
  }

  void edit(int i, String content) {
    _lstNote[i].content += " $content";
  }

  void delete(int index) {
    _lstNote.removeAt(index);
  }
}