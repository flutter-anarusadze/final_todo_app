import 'package:anarusadze_todo_app/data/models/todos.dart';
import 'package:anarusadze_todo_app/logic/provider/todos_provider.dart';
import 'package:anarusadze_todo_app/widgets/bottom_sheets/todo_edit_bottomsheet.dart';
import 'package:anarusadze_todo_app/widgets/dialog/todo_delete_dialog.dart';
import 'package:anarusadze_todo_app/widgets/item/todo_item_details.dart';
import 'package:anarusadze_todo_app/widgets/text_field/todo_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TodoViewBottomSheet extends StatefulWidget {
  final Todos todos;

  const TodoViewBottomSheet({Key? key, required this.todos}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoViewScreenState();
}

class _TodoViewScreenState extends State<TodoViewBottomSheet> {
  _TodoViewScreenState();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController idController = TextEditingController(text: widget.todos.id.toString());
    final TextEditingController titleController = TextEditingController(text: widget.todos.todo);
    final TextEditingController descriptionController = TextEditingController(text: widget.todos.description);

    return Container(
      padding: const EdgeInsets.all(30),
      height: 500,
      color: const Color(0xff429591),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            addTextField(widget.todos.id.toString(), 20),
            addTextField(widget.todos.todo, 18),
            addTextField(widget.todos.description, 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {setState(() {
                      Provider.of<TodosProvider>(context, listen: false).todoDone(widget.todos.id);
                    });
                  },
                  child: const TodoItemDetails(text: "DONE", icon: Icons.done),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return todoEditBottomSheet(context, widget.todos, idController, titleController, descriptionController, formKey);
                      },
                    );
                  },
                  child: const TodoItemDetails(text: "EDIT", icon: Icons.edit),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => showDeleteDialog(context, widget.todos.id)
                    );
                  },
                  child: const TodoItemDetails(text: "DELETE", icon: Icons.delete),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: MaterialButton(
                  minWidth: 189,
                  height: 37,
                  color: Colors.white,
                  child: Text("SUBMIT",
                      style: GoogleFonts.poppins(textStyle:const TextStyle(fontSize: 16, color: Color(0xff429591)))),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
