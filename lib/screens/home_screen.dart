import 'package:anarusadze_todo_app/logic/provider/todos_provider.dart';
import 'package:anarusadze_todo_app/widgets/bottom_sheets/add_note_bottomsheet.dart';
import 'package:anarusadze_todo_app/widgets/bottom_sheets/view_note_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home_screen';

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 1.0),
    end: const Offset(0.0, 0.0),
  ).animate(_controller);

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<TodosProvider>(context, listen: false).getTodos();
    var todos = Provider.of<TodosProvider>(context).todos;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("TODO APP",
                            style: TextStyle(
                                fontSize: 32,
                                color: Color(0xff707070),
                                fontWeight: FontWeight.bold)),
                        FloatingActionButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AddNoteBottomSheet();
                              },
                            );
                          },
                          backgroundColor: const Color(0xff04a3a3),
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SlideTransition(
                      position: _offsetAnimation,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff6cb4b1),
                            border: Border.all(
                              color: const Color(0xff6cb4b1),
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: const EdgeInsets.all(24),
                              child: ListTile(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ViewNoteBottomSheet(
                                          todos: todos[index]);
                                    },
                                  );
                                },
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                title: Text(todos[index].todo),
                                subtitle: Text(todos[index].description),
                                trailing: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: FloatingActionButton(
                                    elevation: 0,
                                    onPressed: () {},
                                    backgroundColor: (todos[index].isDone)
                                        ? const Color(0xff0ecc57)
                                        : const Color(0xff969897),
                                    child: const Icon(Icons.done),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: todos.length,
                        ),
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}
