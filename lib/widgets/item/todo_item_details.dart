import 'package:anarusadze_todo_app/data/models/todos.dart';
import 'package:anarusadze_todo_app/widgets/bottom_sheets/todo_view_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoItemDetails extends StatelessWidget {
  final String text;
  final IconData icon;

  const TodoItemDetails({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children:[
          Icon(icon, size: 33, color: Colors.white),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Text(text, style: GoogleFonts.poppins(textStyle:const TextStyle(color: Colors.white, fontSize: 14))),
        ],
      ),
    );
  }
}
