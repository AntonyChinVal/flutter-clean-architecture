import 'dart:ui';

import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const CTextFormField({this.label = 'Label', this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: this.label,
        labelStyle: TextStyle(color: Color(0xFFBEC2CE), fontSize: 16),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEFEFEF))),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCCCCCC))),
      ),
    );
  }
}
