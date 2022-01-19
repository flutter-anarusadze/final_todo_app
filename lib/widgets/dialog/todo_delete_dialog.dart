import 'package:anarusadze_todo_app/logic/provider/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

dynamic showDeleteDialog(BuildContext context, int id) {
  return AlertDialog(
    title: const Text('Delete Todo'),
    content: const Text(
        'Do you really want to delete selected note?'),
    actions: <Widget>[
      TextButton(
        onPressed: () => Navigator.pop(context, "No"),
        child: const Text('No'),
      ),
      TextButton(
        onPressed: () {
            Provider.of<TodosProvider>(context, listen: false).deleteTodo(id);
            Navigator.pushNamedAndRemoveUntil(context, '/home_screen', (r) => false);
        },
        child: const Text("yes"),
      ),
    ],
  );
}



