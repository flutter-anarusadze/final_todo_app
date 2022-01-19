import 'package:anarusadze_todo_app/data/models/todos.dart';
import 'package:anarusadze_todo_app/logic/provider/todos_provider.dart';
import 'package:anarusadze_todo_app/widgets/text_field/todo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TodoAddBottomSheet extends StatefulWidget {
  const TodoAddBottomSheet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoAddScreenState();

}
class _TodoAddScreenState extends State<TodoAddBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

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
              addTextFormField("Please enter ID", _idController, true),
              addTextFormField("Please enter title", _titleController),
              addTextFormField("Please enter description", _descriptionController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: MaterialButton(
                    minWidth: 189,
                    height: 37,
                    color: Colors.white,
                    child: Text("SUBMIT",
                        style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16, color: Color(0xff429591)))),
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
                          Provider.of<TodosProvider>(context, listen: false).addTodo(todos);
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

