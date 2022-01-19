import 'package:anarusadze_todo_app/data/models/todos.dart';
import 'package:anarusadze_todo_app/logic/provider/todos_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditNoteBottomSheet extends StatefulWidget {
  final Todos todos;
  const EditNoteBottomSheet({ Key? key, required this.todos}): super(key: key);

  @override
  State<StatefulWidget> createState() => _editNoteScreenState(todos);

}
class _editNoteScreenState extends State<EditNoteBottomSheet> {
  _editNoteScreenState(Todos todos);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _idController = TextEditingController(text: widget.todos.id.toString());
    final TextEditingController _titleController = TextEditingController(text: widget.todos.todo);
    final TextEditingController _descriptionController = TextEditingController(text: widget.todos.description);
    return Container(
      padding: const EdgeInsets.all(30),
      height: 500,
      color: const Color(0xff429591),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _idController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 24),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusColor: Colors.white,
                  hintText: "Please enter ID",
                  hintStyle: TextStyle(color: Color(0xc1fffdfd), fontSize: 24),
                ),
                cursorColor: Colors.white,
                validator: (String? value) {
                  if (value!.isNotEmpty) {
                    if (int.tryParse(value) == null) {
                      return "Please fill only numbers";
                    } else {
                      return null;
                    }
                  } else {
                    return "Please fill the field";
                  }
                },
              ),
              TextFormField(
                controller: _titleController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 24),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusColor: Colors.white,
                  hintText: "Please enter title",
                  hintStyle: TextStyle(color: Color(0xc1fffdfd), fontSize: 24),
                ),
                cursorColor: Colors.white,
                validator: (String? value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Please fill the field";
                  }
                },
              ),
              TextFormField(
                controller: _descriptionController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 24),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusColor: Colors.white,
                  hintText: "Please enter task details",
                  hintStyle: TextStyle(color: Color(0xc1fffdfd), fontSize: 24),
                ),
                cursorColor: Colors.white,
                validator: (String? value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Please fill the field";
                  }
                },
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
                      setState(() {
                        if(_formKey.currentState!.validate()){
                          var todos = Todos(
                              id: int.parse(_idController.text),
                              todo: _titleController.text,
                              description: _descriptionController.text,
                              isDone: false);
                          Provider.of<TodosProvider>(context, listen: false).updateTodos(todos);
                          Navigator.pop(context);
                        }
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
