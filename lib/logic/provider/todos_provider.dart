
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

  void addTodo(Todos todo) async {
    await todoRepository.addTodo(todo);
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(int id) async {
    await todoRepository.deleteTodo(id);
    var todo = _todos.firstWhere((element) => element.id == id);
    _todos.remove(todo);
    notifyListeners();
  }

  void updateTodos(Todos todos) async {
    await todoRepository.updateTodo(todos);
    var index = _todos.indexOf(todos);
    _todos[index] = todos;
    notifyListeners();
  }

}
