import 'package:anarusadze_todo_app/data/models/todos.dart';
import 'package:anarusadze_todo_app/logic/provider/todos_provider.dart';
import 'package:anarusadze_todo_app/widgets/text_field/todo_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

dynamic todoEditBottomSheet(
  BuildContext context,
  Todos todos,
  TextEditingController idController,
  TextEditingController titleController,
  TextEditingController descriptionController,
  GlobalKey<FormState> formKey,
) {
  return Container(
    padding: const EdgeInsets.all(30),
    height: 500,
    color: const Color(0xff429591),
    child: Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            addTextFormField("Please enter ID", idController, true),
            addTextFormField("Please enter title", titleController),
            addTextFormField("Please enter description", descriptionController),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: MaterialButton(
                  minWidth: 189,
                  height: 37,
                  color: Colors.white,
                  child: Text("SUBMIT", style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color(0xff429591), fontSize: 24))),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var todos = Todos(
                          id: int.parse(idController.text),
                          todo: titleController.text,
                          description: descriptionController.text,
                          isDone: false);
                      Provider.of<TodosProvider>(context, listen: false).updateTodos(todos);
                      Navigator.pushNamedAndRemoveUntil(context, '/home_screen', (r) => false);
                    };
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
