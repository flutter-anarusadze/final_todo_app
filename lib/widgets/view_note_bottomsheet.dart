import 'package:anarusadze_todo_app/data/models/todos.dart';
import 'package:flutter/material.dart';

dynamic viewNoteBottomSheet(Todos todos) {
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
            child: Text(todos.id.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 25)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            child: Text(todos.todo,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            child: Text(todos.todo,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            child: Text(todos.description,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
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
                    Icon(Icons.done, size: 33, color:Colors.white),
                    Padding( padding:EdgeInsets.only(top: 10)),
                    Text("DONE", style: TextStyle(color:Colors.white, fontSize: 14))
                  ],
                ),
              ),
              Container(
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
                    Icon(Icons.edit, size: 33, color:Colors.white),
                    Padding( padding:EdgeInsets.only(top: 10)),
                    Text("EDIT", style: TextStyle(color:Colors.white, fontSize: 14))
                  ],
                ),
              ),
              Container(
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
                    Icon(Icons.delete, size: 33, color:Colors.white),
                    Padding( padding:EdgeInsets.only(top: 10)),
                    Text("DELETE", style: TextStyle(color:Colors.white, fontSize: 14))
                  ],
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

                },
              ),
            ),
          )
        ],
      ),
    ),
  );
}
