
import 'package:dio/dio.dart';

import '../models/todos.dart';

class TodoRepository {
  Dio dio = Dio();

  Future<List<Todos>?>? getTodos() async {
    final response = await dio.get('http://10.0.2.2:8080/todos');
    var todos = <Todos>[];
    if (response.statusCode == 200) {
      response.data.forEach((todoJson) {
        Todos todo = Todos.fromJson(todoJson);
        todos.add(todo);
        return todos;
      });
    }
    return todos;
  }

  Future<List<Todos>?>? getTodoByID(int id) async {
    final response = await dio.get('http://10.0.2.2:8080/todo/$id');
    var todos = <Todos>[];
    if (response.statusCode == 200) {
      response.data.forEach((todoJson) {
        Todos todo = Todos.fromJson(todoJson);
        todos.add(todo);
        return todos;
      });
    }
    return todos;
  }

  Future<List<Todos>?>? addTodo(Todos todos) async {
    await dio.post('http://10.0.2.2:8080/add-todo', data: todos.toJson());
  }

  Future<List<Todos>?>? deleteTodo(int id) async {
    await dio.delete('http://10.0.2.2:8080/delete-todo/$id');
  }

  Future<List<Todos>?>? updateTodo(Todos todos) async {
    await dio.put('http://10.0.2.2:8080/update-todo', data: todos.toJson());
  }

  Future<List<Todos>?>? todoDone(int id) async {
    await dio.patch('http://10.0.2.2:8080/todo-done/$id');
  }
}