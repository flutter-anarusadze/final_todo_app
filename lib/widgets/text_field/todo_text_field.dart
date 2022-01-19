import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


dynamic addTextField(String text, double fontSize) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
    child: Text(text,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontSize: fontSize))),
  );
}


dynamic addTextFormField(String hint, TextEditingController controller, [isDigit = false]) {
  return TextFormField(
    controller: controller,
    textAlign: TextAlign.center,
    style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontSize: 24)),
    decoration: InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusColor: Colors.white,
      hintText: hint,
      hintStyle: GoogleFonts.poppins(textStyle: const TextStyle(color: Color(0xc1fffdfd), fontSize: 24)),
    ),
    cursorColor: Colors.white,
    validator: (String? value) {
      if(value!.isNotEmpty){
        if(isDigit && int.tryParse(value) == null){
          return "Please fill only numbers";
        }else{
          return null;
        }
      }else {
        return "Please fill the field";
      }
    },
  );
}





