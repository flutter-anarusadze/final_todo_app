import 'package:anarusadze_todo_app/data/models/todos.dart';
import 'package:anarusadze_todo_app/logic/provider/todos_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

dynamic editNoteBottomSheet(
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
            TextFormField(
              controller: idController,
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
              controller: titleController,
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
              controller: descriptionController,
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
                    if (formKey.currentState!.validate()) {
                      var todos = Todos(
                          id: int.parse(idController.text),
                          todo: titleController.text,
                          description: descriptionController.text,
                          isDone: false);
                      Provider.of<TodosProvider>(context, listen: false).updateTodos(todos);
                      Navigator.pushNamedAndRemoveUntil(context, '/home_screen', (r) => false);
                    }
                    ;
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
