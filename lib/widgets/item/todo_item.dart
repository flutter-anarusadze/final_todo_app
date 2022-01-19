import 'package:anarusadze_todo_app/data/models/todos.dart';
import 'package:anarusadze_todo_app/widgets/bottom_sheets/todo_view_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoItem extends StatelessWidget {
  final Todos todos;

  const TodoItem({required this.todos});

  void viewBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return TodoViewBottomSheet(
            todos: todos);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.all(24),
      child: ListTile(
        onTap: () { viewBottomSheet(context);},
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(todos.todo, style: GoogleFonts.poppins()) ,
        subtitle: Text(todos.description, style: GoogleFonts.poppins()),
        trailing: SizedBox(
          height: 40,
          width: 40,
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {},
            backgroundColor: (todos.isDone)
                ? const Color(0xff0ecc57)
                : const Color(0xff969897),
            child: const Icon(Icons.done),
          ),
        ),
      ),
    );
  }
}
