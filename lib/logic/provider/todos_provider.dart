
import 'package:anarusadze_todo_app/data/models/todos.dart';
import 'package:anarusadze_todo_app/data/repository/todos_repository.dart';
import 'package:flutter/cupertino.dart';

class TodosProvider extends ChangeNotifier{

  final todoRepository = TodoRepository();

  var _todos = <Todos>[];
  List<Todos> get todos => _todos;

  void getTodos() async {
    _todos = (await todoRepository.getTodos())!;
    notifyListeners();
  }

  void getTodoById(int id) async {
    _todos = (await todoRepository.getTodoByID(id))!;
    notifyListeners();
  }

  void addTodo(Todos todos) async {
    await todoRepository.addTodo(todos);
  }

  void deleteTodo(int id) async {
    await todoRepository.deleteTodo(id);
  }

  void updateTodos(Todos todos) async {
    await todoRepository.updateTodo(todos);
  }

}
