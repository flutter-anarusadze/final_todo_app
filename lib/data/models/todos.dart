import 'dart:ffi';

class Todos {
  final int id;
  final String todo;
  final String description;
  final Bool isDone;

  Todos({
    required this.id,
    required this.todo,
    required this.description,
    required this.isDone,
  });

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
        id: json['id'],
        todo: json['todo'],
        description: json['description'],
        isDone: json['isDone']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'todo': todo,
    'description': description,
    'isDone': isDone
  };
}
