import 'package:flutter/material.dart';
import 'package:vazifa/views/screens/todo_screen.dart';
import 'note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 4,
          mainAxisSpacing: 40,
          crossAxisSpacing: 40),
      children: [
        InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const ToDoScreen()));
          },
          child: Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 32),
              width: double.infinity,
              child: const Center(
                child: Text(
                  "Todos",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const NoteScreen()));
          },
          child: Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 32),
              width: double.infinity,
              child: const Center(
                child: Text(
                  "Notes",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
