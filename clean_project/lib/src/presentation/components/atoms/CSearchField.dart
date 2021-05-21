import 'package:flutter/material.dart';

class CSearchField extends StatelessWidget {
  final TextEditingController? controller;

  const CSearchField({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          Icons.search,
          color: Color(0xFFBEC2CE),
        ),
        hintText: "Buscar",
        hintStyle: TextStyle(color: Color(0xFFBEC2CE)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEAECEF), width: 1.0),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEAECEF), width: 1.0),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
