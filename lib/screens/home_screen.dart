import 'package:anarusadze_todo_app/logic/provider/todos_provider.dart';
import 'package:anarusadze_todo_app/widgets/add_note_bottomsheet.dart';
import 'package:anarusadze_todo_app/widgets/view_note_bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home_screen';


  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();

/*    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));*/
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<TodosProvider>(context, listen: false).getTodos();
    var todos = Provider.of<TodosProvider>(context).todos;
    return Consumer<TodosProvider>(
      builder: (context, cart, child) {
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
                                    return addNoteBottomSheet();
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
                                        return viewNoteBottomSheet();
                                      },
                                    );
                                  },
                                  contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                                  title: Text(todos[index].todo),
                                  subtitle: Text(todos[index].description),
                                  trailing: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: FloatingActionButton(
                                      elevation: 0,
                                      onPressed: () {},
                                      backgroundColor: const Color(0xff969897),
                                      child: const Icon(Icons.done),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: todos.length,
                          )),
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
