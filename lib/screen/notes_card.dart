import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Models/note.dart';
import 'package:todo_list/Models/notes_operation.dart';
import 'package:todo_list/Helpers/DatabaseHelper.dart';

class NotesCard extends StatelessWidget {
  final Note note;
  const NotesCard({Key? key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            note.description,
            style: const TextStyle(fontSize: 17),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () async {
                  await DatabaseHelper.instance.delete(note);
                  Provider.of<NotesOperation>(context, listen: false)
                      .getNotesFromDatabase();
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}