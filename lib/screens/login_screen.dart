import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  static const routeName = '/login-screen';

  @override
  State<StatefulWidget> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/todo_icon.png', width:170),
              MaterialButton(
                minWidth: 189,
                height: 37,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: const Color(0xff04a3a3),
                textColor: CupertinoColors.white,
                onPressed: () {},
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(top: 30)),
              MaterialButton(
                minWidth: 189,
                height: 37,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: const Color(0xff04a3a3),
                child: const Text("LOGIN", style: TextStyle(fontSize: 16, color: Colors.black)),
                textColor: CupertinoColors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
              )
            ],
          ),
        ));
  }
}
