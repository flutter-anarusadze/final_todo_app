import 'package:flutter/material.dart';

dynamic addNoteBottomSheet() {
  return Container(
    padding: const EdgeInsets.all(30),
    height: 500,
    color: const Color(0xff429591),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField(
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusColor: Colors.white,
              hintText: "Please enter ID",
              hintStyle: TextStyle(color: Color(0xc1fffdfd), fontSize: 24),
            ),
            cursorColor: Colors.white,
          ),
          const TextField(
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusColor: Colors.white,
              hintText: "Please enter title",
              hintStyle: TextStyle(color: Color(0xc1fffdfd), fontSize: 24),
            ),
            cursorColor: Colors.white,
          ),
          const TextField(
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusColor: Colors.white,
              hintText: "Please enter task",
              hintStyle: TextStyle(color: Color(0xc1fffdfd), fontSize: 24),
            ),
            cursorColor: Colors.white,
          ),
          const TextField(
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusColor: Colors.white,
              hintText: "Please enter task details",
              hintStyle: TextStyle(color: Color(0xc1fffdfd), fontSize: 24),
            ),
            cursorColor: Colors.white,
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
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    ),
  );
}
