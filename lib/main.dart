import 'package:anarusadze_todo_app/screens/home_screen.dart';
import 'package:anarusadze_todo_app/screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/provider/todos_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TodosProvider(),
    child: const TodoApp(),
  ));
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      home: const LogInScreen(),
      routes: {
        LogInScreen.routeName: (ctx) => const LogInScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
      },
    );
  }
}
