import 'package:anarusadze_todo_app/data/models/todos.dart';
import 'package:anarusadze_todo_app/logic/provider/todos_provider.dart';
import 'package:anarusadze_todo_app/widgets/bottom_sheets/edit_note_bottomsheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ViewNoteBottomSheet extends StatefulWidget {
  final Todos todos;

  const ViewNoteBottomSheet({Key? key, required this.todos}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _viewNoteScreenState();
}

class _viewNoteScreenState extends State<ViewNoteBottomSheet> {
  _viewNoteScreenState();

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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              child: Text(widget.todos.id.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 25)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              child: Text(widget.todos.todo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              child: Text(widget.todos.todo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              child: Text(widget.todos.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Provider.of<TodosProvider>(context, listen: false).todoDone(widget.todos.id);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 91,
                    height: 84,
                    decoration: BoxDecoration(
                        color: const Color(0xff6cb4b1),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Icon(Icons.done, size: 33, color: Colors.white),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text("DONE",
                            style: TextStyle(color: Colors.white, fontSize: 14))
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return editNoteBottomSheet(context, widget.todos, idController, titleController, descriptionController, formKey);
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 91,
                    height: 84,
                    decoration: BoxDecoration(
                        color: const Color(0xff6cb4b1),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Icon(Icons.edit, size: 33, color: Colors.white),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text("EDIT",
                            style: TextStyle(color: Colors.white, fontSize: 14))
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
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
                              setState(() {
                                Provider.of<TodosProvider>(context, listen: false).deleteTodo(widget.todos.id);
                                Navigator.pushNamedAndRemoveUntil(context, '/home_screen', (r) => false);
                              });
                            },
                            child: const Text("yes"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 91,
                    height: 84,
                    decoration: BoxDecoration(
                        color: const Color(0xff6cb4b1),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Icon(Icons.delete, size: 33, color: Colors.white),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text("DELETE",
                            style: TextStyle(color: Colors.white, fontSize: 14))
                      ],
                    ),
                  ),
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
                  child: const Text("SUBMIT",
                      style: TextStyle(fontSize: 16, color: Color(0xff429591))),
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
