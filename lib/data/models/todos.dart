class Todos {
  final int id;
  final String todo;
  final bool isDone;
  final String description;


  Todos({
    required this.id,
    required this.todo,
    required this.isDone,
    required this.description,

  });

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
        id: json['id'],
        todo: json['todo'],
        isDone: json['isDone'],
        description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'todo': todo,
    'isDone': isDone,
    'description': description
  };
}
